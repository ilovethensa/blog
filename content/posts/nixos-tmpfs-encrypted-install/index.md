---
title: "How to install encrypted root-on-tmpfs nixos"
draft: false
date: 2024-02-27T11:06:29.000Z
description: "Guide on how to install nixos on tmpfs encrypted"
---
# Introduction
- This guide assumes that you have already booted into NixOS live.
- Basic Linux knowledge is assumed.

This guide is mainly based off of [this blog post](https://elis.nu/blog/2020/05/nixos-tmpfs-as-root/)

## Partitioning the drives
```bash
# Specify the device
DEVICE="/dev/sda"

# Use gdisk to create a GPT partition table
gdisk $DEVICE <<EOF
o
Y
n
1

+512M
EF00
n
2


w
Y
EOF

# Inform the system about the partition changes
partprobe $DEVICE

# Display partition information
gdisk -l $DEVICE
```

## Creating filesystems
Firstly you need to create a 32-bit vFAT for the esp partition
```bash
mkfs.vfat -F32 /dev/sda1
```
Then we can create a LUKS parition for /nix
```bash
# Format the drive to LUKS
cryptsetup luksFormat /dev/sda2
# Open the LUKS drive
cryptsetup luksOpen /dev/sda2 cryptroot
```

# Use XFS for this guide
```bash
# Mount the root file system
mount -t tmpfs none /mnt
# Create directories
mkdir -p /mnt/{boot,nix,etc/nixos,var/log}

# Mount /boot and /nix
mount /dev/sda1 /mnt/boot
mount /dev/sda2 /mnt/nix
```

## Configuration
Now first create a nixos config using
```bash
nixos-generate-config --root /mnt
```
```nix
### Filesystems
Now you need to add some options to the root filesystem
```
fileSystems."/" = {
  fsType = "tmpfs";
  options = [ "defaults" "size=2G" "mode=755" ];
};
```

### Users
When you have a system with a tmpfs root you have to configure all users and passwords in configuration.nix, otherwise you won’t have any user or a password on the next boot.

You probably want to have immutable users as well since it doesn’t make any sense to have mutability of users if it’s going to reset anyways.

>Note: Don’t use the options password or hashedPassword for users because it won’t work. It has to be the options named initialPassword or initialHashedPassword.
```nix
{
  # …

  # Don't allow mutation of users outside of the config.
  users.mutableUsers = false;

  # Set a root password, consider using initialHashedPassword instead.
  #
  # To generate a hash to put in initialHashedPassword
  # you can do this:
  # $ nix-shell --run 'mkpasswd -m SHA-512 -s' -p mkpasswd
  users.users.root.initialPassword = "hunter2";

  # …
}
```

### Other
You can now tweak anything else you want in the config file(Timezones, users, etc)
Just make sure to copy `/etc/nixos` to `/nix` to preserve your configs

## Installing
Now to install the system just run
```
nixos-install --no-root-passwd
```