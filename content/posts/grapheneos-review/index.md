---
title: "GrapheneOS review after 215 days"
draft: false
date: 2024-10-03T05:52:38.943Z
description: "Review of GrapheneOS after 215 days of usage"
---
I used to run stock Android without a second thought about privacy or minimalism.
My phone was primarily for watching YouTube and chatting with friends on Facebook.
Those were indeed simpler times.

As I became more informed about online privacy, I started debloating my phone using [UAD](https://github.com/0x192/universal-android-debloater).
Note: UAD is now abandoned; consider using [UADNG](https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/) instead.

While it worked for the most part, I wanted to completely remove Google services, which caused issues multiple times.
Fortunately, Android's self-repair capabilities helped me recover.
I eventually managed to debloat my phone significantly, but by then, I had already decided it was time for a change.

## The Pixel

I decided to take the plunge and purchase a Pixel, specifically a Pixel 6a, which was relatively affordable in Bulgaria, priced around 150 euros.
The decision to choose between GrapheneOS and CalyxOS was a difficult one.

Initially, I was swayed by a friend's negative opinions about GrapheneOS, which led me to try CalyxOS for the first couple of weeks.

## CalyxOS

Installation was a bit more difficult than GrapheneOS, though I didn't know at the time.
My experience with CalyxOS was decent, but it didn't particularly stand out from stock Android.
Although I found it to be a significant improvement over my previous phone in terms of performance, with everything feeling snappy and responsive.

However, as I delved deeper into the world of custom ROMs and learned more about CalyxOS's security shortcomings, I began to lose confidence in the operating system.
This, combined with my growing distance from the friend who had initially influenced my decision, ultimately led me to reconsider my options and switch to GrapheneOS.

## GrapheneOS

Installation was a breeze, with a couple of clicks on a web UI, and you're done – no terminal required.

### The Good

* **Minimalism**: GrapheneOS is very minimal, which may be a drawback for some, but it's a significant advantage for me. The default UI is a black screen with a few icons, which suits my style. Battery life has also improved.
* **Ease of use**: GrapheneOS just works (for the most part). Everything is point-and-click, like normal Android, its a very high-quality ROM.
* **Fast updates**: GrapheneOS is usually always on the latest Android, with same-day security updates – I couldn't ask for more.
* **Permission system**: GrapheneOS has an even better permission system than Android. I can restrict apps to access only certain folders or files, and they won't know there's more. There are no "super apps" that can't have permissions removed; every app is a user app.
* **Profiles**: Profiles are a game-changer. I have several profiles, including one for work, one for personal stuff, one for my online identity, and one for "normie" stuff. It's really neat, as I can have "normie" spyware on my normie profile that can't see or even know I have a separate online profile.
* **Security**: The security is top-notch, with features like [pin scrambling](https://grapheneos.org/features#pin-scrambling), [Duress PIN/Password](https://grapheneos.org/features#duress), [advanced exploit mitigations](https://grapheneos.org/features#exploit-mitigations), [improved sandboxing](https://grapheneos.org/features#improved-sandboxing), [fully verified root](https://grapheneos.org/features#anti-persistence)

### The Not-So-Good

* **Notifications**: Unfortunately, without Google Play, you won't have notifications in many apps (including Signal). Even with it, notifications can be finicky, sometimes working and sometimes not. I currently have it installed, but Signal is still running its own notification daemon, which sucks up a lot of battery.
* **No auto-updates for user-installed apps**: While there are automatic updates for the browser and OS itself, which happen in the background, there doesn't seem to be a way to set up completely automatic updates on GrapheneOS. You still have to update your apps manually from [Fdroid](https://f-droid.org/) or [Obtainium](https://obtainium.imranr.dev/).

## Conclusion

Overall, I'm extremely satisfied with GrapheneOS, and despite some minor drawbacks, I don't see myself switching to another operating system anytime soon. No matter what rossman tells you, its still the best.
