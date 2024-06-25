---
title: "Surviving on 100kb/s"
draft: false
date: 2024-06-25T13:53:29.000Z
description: "How i live with 100kb/s internet"
---
So, a couple of weeks ago, a power surge killed my desktop pc, my thinkpad and networking equipment, and I haven't had the time to repair/buy it. Instead, I just adapted to the 100kb/s cellular life.

## My Network
I currently use a WAN router that uses a SIM card to get Wi-Fi, and I have all my devices connected to it with Ethernet or Wi-Fi. I get an average of 100kb/s, but it's quite unstable and has a second of latency.

## My Homelab
Thankfully, my homelab with almost a terabyte of *legally* downloaded media survived. So i have been able to watch the tv shows ive been putting off. However, my provider blocks all torrenting and even port forwarding, so all my services at [theholytachanka.com](https://theholytachanka.com) and [pwned.page](https://pwned.page) are offline. 100kb/s would be too slow for any meaningful usage anyway.

## My Phone
This is where it got interesting. Almost all Android apps are very unoptimized for huge latency, so most just time out and don't work. This led me to use Termux. Thankfully, I already had it downloaded, so I didn't have to download it.

I had to replace all my apps that use the internet with CLI/TUI replacements:
- I replaced Discord with [Discordo](https://github.com/ayn2op/discordo); I highly recommend trying it, even on the desktop. It's very good and the only one I've tried that's actually usable.
- I replaced Moshidon with [Toot](https://github.com/ihabunek/toot), which is fine.
- I replaced Grayjay (YouTube client) with yt-dlp. When I want to use something, I just start the download before I go to sleep and watch it in the morning.
- Instead of browsing Reddit and 4chan, I now mostly browse [Hackernews](https://news.ycombinator.com/), [Lobste.rs](https://lobste.rs/), and [Tildes](https://tildes.net/), which use a lot less traffic.

It's been a pain using CLI/TUI apps on Termux with a touchscreen keyboard, but it's been fine. I now type this with Neovim on my Pixel 6a running GrapheneOS. It's not the best, but I've gotten used to it. Hopefully, I'll fix my networking equipment fixed soon.