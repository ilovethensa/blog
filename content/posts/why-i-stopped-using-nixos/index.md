---
title: "Why I Chose NixOS (And Why I Eventually Moved On)"
draft: false
date: 2024-09-25T16:50:16.178900107+00:00
description: "Why is stopped using nixos"
---
NixOS is probably the best Linux distro right now; its immutable, but it doesn't take power away from the user.
It uses the latest packages without breaking on every update.
You could write a simple config for a machine and just... leave it be, and it won't break (excluding hardware failure).

## Before

I had my whole homelab and all my devices running NixOS; everything was from a single repo.
I had auto updates, zero faulty updates, zero maintenance.
I had a unified configuration across all devices.

## Why I Switched Away

So, why did I switch away? Well... it was boring... very, very boring.
I could just use devices with zero tinkering; everything *just-worked*.
I always had fun troubleshooting and debugging stuff; that's why I used to run Arch testing (even on my servers).
I missed the thrill of the unknown, the excitement of not knowing if an update would break something.
I missed the sense of accomplishment when I fixed a tricky issue.
I missed the learning experience that came with troubleshooting and debugging.
I felt like I was getting too comfortable, too complacent, and I needed a change.

## What Now?

So... what did I switch to?

### Desktops

For my desktops, I've been using Arch stable; I'd forgotten how to install non-NixOS distros.
For NixOS, it was always just mount the drives, then `nixos-install`; it was really easy.
I've been running almost the same config as before, and the first issue I had was audio (as always with Linux), or more specifically, Pipewire (still a lot better than ALSA... God, that was bad).
I fixed that pretty quickly (I love the Arch forums).
I've been having some trouble keeping configs synced between machines, but I'm going to figure that out.

### Servers

For my servers (except my Renegade, which runs Armbian), I was really on the fence between Debian, Ubuntu, and Fedora Server.
Ubuntu spies on users; Fedora was a bit... not to my taste, so Debian it is.
As before, I had to figure out how to install it, and I couldn't over SSH (which would be really handy to autostart on the default ISO).
I had to plug a monitor and keyboard into my server and install it; setting it up was pretty smooth.
I set up OpenSSH, decided to go with CasaOS this time (I was doing it manually last time, decided to go with a more... complete solution).
It was really easy; just clicked yes a couple of times, and boom, it works.
My only issue was Jellyfin hardware acceleration; they should really forward `/dev/dri128` by default; it would be helpful.
