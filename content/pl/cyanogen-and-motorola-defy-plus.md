+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2012-03-16T12:34:59"
draft = false
title = "Cyanogen and Motorola Defy Plus"
+++
Ever tried to install Cyanogen(mod) on a Motorola Defy Plus? Chances are you
were stopped by this error:

    
    
    E:Can't make /tmp/update_binary
    

Retrying will not change anything. This is a permanent problem with
ClockworkMod recovery in conjunction with Android version in the new Defy. But
it's easy to solve.

![ADB Daemon in BootMenu](http://pub.lrem.net/2012/03/bootadb.jpg)

Location of ADB Daemon in BootMenu

Defy+ is mostly a Defy with faster CPU and a bigger battery. This is why all
the howtos and tutorials simply point to the older version. CyanogenMod itself
provides one download for both versions. All this is good, but we can't forget
that the stock ROM contains a newer version of Android on the Plus version.

The particular problem is that to make things faster, the _/tmp_ directory in
Defy+ is stored on a RAM disk. This is in fact a typical _tmpfs_ created for
some reason as _/data/tmp_. Then, the real _/tmp_ is substituted with a
symbolic link to _/data/tmp_. Not so surprising by today's Linux standards.

The problem: one of the first steps of ROM upgrade is to wipe the old _/data_.
Then, everything Clockwork recovery does, goes through _/tmp_... Which is a
link to something that you just erased. Great, isn't it?

Simple problem, simple solution: after wiping your _/data_, choose in the boot
loader to start the _ADB_ daemon. Now, on your computer, start _adb shell_ and
do:

    
    
    rm /tmp
    mkdir /tmp
    

That's it. _/tmp_ is an actual directory again, thus it can be used by
Clockwork mod and everything is fine again.

# Komentarze

* ours (2012-03-16 20:18:27): <p>Wow, first post is mine :)</p>  <p>Can you
  write simple instruction how to install cyanogen on defy? I found few
  instructions about this, but none of them is clear for me. </p>  <p>Can I back
  to original android version after all?</p>
* Remigiusz 'lRem' Modrzejewski (2012-03-16 20:24:22): <p>Do you already have
  root?</p>
* ours (2012-03-16 21:38:39): <p>nope. and I actually have defy not defy+, but I
  think that the way of doing things is very similar. </p>  <p>Performance of
  original software is really disappointing, but until I'm not sure how upgrade
  android correctly I do nothing. What is with guarantee? Can I back to original
  android version and pretend that I never messed with phone software?</p>
* Remigiusz 'lRem' Modrzejewski (2012-03-16 21:48:01): <p>For the original Defy,
  the <a
  href="http://wiki.cyanogenmod.com/wiki/Motorola_Defy:_Full_Update_Guide"
  rel="nofollow">official steps</a> should suffice. I didn't read the warranty
  agreement myself, but from comments I deduced, that just getting root
  privileges voids the warranty. A full backup and restore is possible only
  <em>after</em> you get root. Thus, depending on your carefulness and
  inquisitiveness of Motorola folk you may or may not succeed with getting
  warranty repairs after modding the phone.</p>
* Capa (2012-08-18 22:30:52): <p>Hi, I run the command line and write "adb
  shell" but PC say: error: device not found. What I have to do?</p>
* Remigiusz 'lRem' Modrzejewski (2012-08-19 10:52:16): <p>Is it connected
  through USB? Have you set up the phone to allow debugging? Now I have it under
  Settings -&gt; Applications -&gt; Development -&gt; USB debugging. Don't
  really remember if it was like this in original ROM.</p>
