---
title: "Setting up Davinci Resolve on nixos with Rocm and OpenCL"
draft: false
date: 2024-02-27T11:06:29.000Z
description: "Guide on how to setup Davinci Resolve with Rocm and OpenCL"
---
# Introduction
- This was only tested on my own GPU(RX 580)
- Basic Nixos know-how is assumed


>Note for people running Tmpfs-on-root: Building resolve will probably fail, make sure /tmp has enough space if you get an error

## Installation
Add it to `environment.systemPackages`
```nix
environment.systemPackages = [
  pkgs.davinci-resolve
];
```
Now rebuild your system, this will take some time as its a big package

## Setting up Rocm OpenCL
```nix
  # Enable openGL and install Rocm
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages_5.clr.icd
      rocmPackages_5.clr
      rocmPackages_5.rocminfo
      rocmPackages_5.rocm-runtime
    ];
  };
  # This is necesery because many programs hard-code the path to hip
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages_5.clr}"
  ];
  environment.variables = {
    # As of ROCm 4.5, AMD has disabled OpenCL on Polaris based cards. So this is needed if you have a 500 series card. 
    ROC_ENABLE_PRE_VEGA = "1";
  };
```
Rebuild and reboot
```bash
sudo nixos-rebuild boot
reboot
```

## Running it
```bash
davinci-resolve
```
Now this should hopefully detect your GPU and run