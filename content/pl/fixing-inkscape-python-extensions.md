+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-07-05T23:20:11"
draft = false
title = "Fixing Inkscape Python extensions"
+++
Inkscape actually is a nice program. Maybe some of the competition (like
Omnigraffle) are nicer. But then again, Inkscape beats them with the fact that
it's free. It also has a lot of useful extensions (like Textext).
Unfortunately, they managed to break the whole Python extension mechanism for
64bit OS X.

The exact error message was always:

> The fantastic lxml wrapper for libxml2 is required by inkex.py and therefore
this extension. Please download and install the latest version from
http://cheeseshop.python.org/pypi/lxml/, or install it through your package
manager by a command like: sudo apt-get install python-lxml

And of course none of the hints found on Google helped...

Of course the first thing I tried was installing the _lxml_ module. To no
avail. I have multiple Python installations in my system, so I continued with
installing it for every one of them. Still, nothing. Following some hints I
tried fiddling with _libxml2_ and other libraries. No effect.

It turns out, that Inkscape team tried to be nice and Mac style, so they
bundled the extensions by themselves. The problem is: `lxml/etree.so: Mach-O
bundle i386` This would not be that bad, as: `/usr/bin/python: Mach-O
universal binary with 3 architectures /usr/bin/python (for architecture
x86_64): Mach-O 64-bit executable x86_64 /usr/bin/python (for architecture
i386): Mach-O executable i386 /usr/bin/python (for architecture ppc7400):
Mach-O executable ppc` Which _should_ be used by a program, that wants a
standard framework. Unfortunately they happily run whatever is first in the
path, ending up with my custom 64bit only interpreter. Which can't load the
32bit only library they provide.

The only remaining quirk is the misleading error message. This is due to the
simple code:

    
    
    
    try:
        from lxml import etree
    except Exception, e:
        sys.exit(_('The fantastic lxml wrapper for libxml2 is required by inkex.py and therefore this extension. Please download and install the latest version from http://cheeseshop.python.org/pypi/lxml/, or install it through your package manager by a command like: sudo apt-get install python-lxml'))
    

That was created probably way before the decision to include lxml. But since
that it's not valid any more...

Being a good child I added my findings about the problem to the [long time
open Launchpad bug](https://bugs.launchpad.net/inkscape/+bug/482993) and
[suggested fixing the error
message](https://bugs.launchpad.net/inkscape/+bug/602041).

Anyhow, the fix is as simple as: `rm -r
/Applications/Inkscape.app/Contents/Resources/python` This gets rid of all the
broken Inkscape bundled python stuff. In case you don't already have the
modules installed, then run: `easy_install lxml easy_install numpy`

# Komentarze

* riddle (2010-07-06 00:12:24): <p>I hate when people do this instead of
  actually contributing something valuable, but may I just suggest adding "pre {
  white-space: pre-wrap; } to template’s CSS?</p>
* Remigiusz 'lRem' Modrzejewski (2010-07-06 00:17:16): <p>Well, I never cared
  about this theme because it's meant to be <em>temporary</em> ;)</p>
  <p>Anyhow, good hint, implemented. Thanks :)</p>
* Mark (2012-01-04 20:44:17): <p>It's going to be officially fixed in 0.48.3 for
  Mac OS X 10.7. :D</p>  <p>https://bugs.launchpad.net/inkscape/+bug/819209</p>
  <p>PS: "Dodaj komentarz"? maybe it would be better/nicer to have comment form
  descriptions in English... :D</p>
* Mark (2012-01-04 20:44:33): <p>It's going to be officially fixed in 0.48.3 for
  Mac OS X 10.7. :D</p>  <p>https://bugs.launchpad.net/inkscape/+bug/819209</p>
  <p>PS: "Dodaj komentarz"? maybe it would be better/nicer to have comment form
  descriptions in English... :D</p>
* Remigiusz 'lRem' Modrzejewski (2012-01-05 15:33:25): <p>Yeah, if this blog was
  primarily in English that would be nice ;)</p>
* Ross (2012-03-30 07:30:35): <p>I have learn a few just right stuff here.
  Certainly value bookmarking for <br /> revisiting. I surprise how a lot
  attempt you place to create such a magnificent <br /> informative website.</p>
* Darren (2012-04-19 14:25:28): <p>Hi - I've googled my way on to your blog as
  I'm using Inkscape .48.2 with OSX 10.7.3 and I can't get the extensions to
  work - BUT I have no idea how to actually execute your fix. Could you explain
  please?<br /> many thx</p>
* Remigiusz 'lRem' Modrzejewski (2012-04-19 14:32:40): <p>Wow, they still did
  not fix it? I remember a claim that it's already past in 2011...</p>
  <p>Anyhow, these two commands I suggested are to be executed in command line,
  which you can access by running the Terminal app that is included in your
  system.</p>  <p>The first one can be done in Finder instead. You find the
  Inkscape application and right click -&gt; <em>Show Package Contents</em>. In
  the new Finder window you descend to Contents-&gt;Resources. You find the
  directory called python and remove it. But then you will probably still need
  to install numpy in the command line.</p>
* Darren (2012-04-19 14:47:45): <p>mmmOK - Python directory removed as
  suggested. But installing numpy in the command line comes up with...</p>
  <p>[Errno 13] Permission denied: '/Library/Python/2.7/site-packages/test-easy-
  install-6141.write-test'</p>  <p>The installation directory you specified (via
  --install-dir, --prefix, or<br /> the distutils default setting) was:</p>
  <pre><code>/Library/Python/2.7/site-packages/ </code></pre>
* Remigiusz 'lRem' Modrzejewski (2012-04-19 14:49:51): <p>Ah, that's easy. Add
  <em>sudo</em> to the beginning of the command. So the whole thing will be:</p>
  <blockquote>   <p>sudo easy<em>install lxml easy</em>install numpy</p>
  </blockquote>  <p>It will ask for your password, to get the permission to
  install the module. Otherwise you could set up local modules path, but that's
  way more complicated.</p>
* Darren (2012-04-19 14:52:51): <p>argghh</p>  <p>sudo : easyinstall : command
  not found</p>
* Remigiusz 'lRem' Modrzejewski (2012-04-19 14:54:30): <p>Sorry, the blog engine
  ate _ signs, as it thought it is part of formatting. Disregard that line, just
  write sudo and then copy the line that was in the post.</p>
* Darren (2012-04-19 14:59:12): <p>well, if it's </p>  <p>sudo</p>  <p>and
  then</p>  <p>easyinstall lxml easyinstall numpy</p>  <p>I'm afraid then I
  get</p>  <p>-bash: easyinstall: command not found </p>  <p>btw thanks hugely
  for the quick responses, I appreciate it.</p>
* Remigiusz 'lRem' Modrzejewski (2012-04-19 14:59:57): <p>Nope, easinistall is
  not one word, it is two words delimited with underscores.</p>
* Darren (2012-04-19 15:01:36): <p>while if it is </p>  <p>sudo</p>  <p>and
  then</p>  <p>easy<em>install lxml easy</em>install numpy</p>  <p>then I
  get</p>  <p>error: can't create or remove files in install directory</p>
  <p>The following error occurred while trying to add or remove files in the<br
  /> installation directory:</p>  <pre><code>[Errno 13] Permission denied:
  '/Library/Python/2.7/site-packages/test-easy-install-6236.write-test'
  </code></pre>  <p>The installation directory you specified (via --install-dir,
  --prefix, or<br /> the distutils default setting) was:</p>
  <pre><code>/Library/Python/2.7/site-packages/ </code></pre>
* Darren (2012-04-19 15:03:10): <p>sorry - all my underscores also being eaten,
  </p>  <p>I meant in the above post easy install (delimited with underscore and
  no spaces)</p>
* Remigiusz 'lRem' Modrzejewski (2012-04-19 15:04:08): <p>Ok, last try to write
  it correctly:</p>  <pre><code>sudo easy_install lxml sudo easy_install numpy
  </code></pre>  <p>This looks correct in preview...</p>
* Darren (2012-04-19 15:10:11): <p>ok - and thx again for your patience. For the
  install of lxml...</p>  <p>Searching for lxml<br /> Reading
  http://pypi.python.org/simple/lxml/<br /> Reading http://codespeak.net/lxml<br
  /> Best match: lxml 2.3.4<br /> Downloading
  http://lxml.de/files/lxml-2.3.4.tgz<br /> Processing lxml-2.3.4.tgz<br />
  Running lxml-2.3.4/setup.py -q bdist<em>egg --dist-dir /tmp/easy</em>install-
  LM0iXn/lxml-2.3.4/egg-dist-tmp-mWezRV<br /> Building lxml version 2.3.4.<br />
  Building without Cython.<br /> Using build configuration of libxslt 1.1.24<br
  /> unable to execute llvm-gcc-4.2: No such file or directory<br /> error:
  Setup script exited with error: command 'llvm-gcc-4.2' failed with exit status
  1</p>  <p>and for numpy...</p>  <p>Searching for numpy<br /> Best match: numpy
  1.5.1<br /> Adding numpy 1.5.1 to easy-install.pth file</p>  <p>Using
  /System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python<br
  /> Processing dependencies for numpy<br /> Finished processing dependencies
  for numpy<br /> darren-lennards-imac-g5:~ lennardfamily$</p>
* Remigiusz 'lRem' Modrzejewski (2012-04-19 15:24:33): <p>Oh, this means you
  don't have Xcode. Sorry, I completely forgot to mention, that it is a
  prerequisite for the procedure (and most things open source). With SL, Xcode
  was an optional install provided on the system disc. I don't know how is it
  with Lion.</p>
* Darren (2012-04-19 15:51:29): <p>aha - just installing Xcode now. will update
  later!</p>
* Darren (2012-04-19 16:10:58): <p>hihi - well Xcode now installed (my bad for
  forgetting), and the same scripts returned as in the post at 15:10</p>  <p>no
  idea now.</p>  <p>Searching for lxml<br /> Reading
  http://pypi.python.org/simple/lxml/<br /> Reading http://codespeak.net/lxml<br
  /> Best match: lxml 2.3.4<br /> Downloading
  http://lxml.de/files/lxml-2.3.4.tgz<br /> Processing lxml-2.3.4.tgz<br />
  Running lxml-2.3.4/setup.py -q bdist<em>egg --dist-dir
  /tmp/easy</em>install-2JlvMW/lxml-2.3.4/egg-dist-tmp-lgecrG<br /> Building
  lxml version 2.3.4.<br /> Building without Cython.<br /> Using build
  configuration of libxslt 1.1.24<br /> unable to execute llvm-gcc-4.2: No such
  file or directory<br /> error: Setup script exited with error: command 'llvm-
  gcc-4.2' failed with exit status 1<br /> darren-lennards-imac-g5:~
  lennardfamily$ sudo easy_install numpy<br /> Searching for numpy<br /> Best
  match: numpy 1.5.1<br /> numpy 1.5.1 is already the active version in easy-
  install.pth</p>  <p>Using
  /System/Library/Frameworks/Python.framework/Versions/2.7/Extras/lib/python<br
  /> Processing dependencies for numpy<br /> Finished processing dependencies
  for numpy<br /> darren-lennards-imac-g5:~ lennardfamily$</p>
* Remigiusz 'lRem' Modrzejewski (2012-04-19 16:11:44): <p>Did you restart
  Terminal.app after installing Xcode?</p>
* Darren (2012-04-19 16:34:46): <p>yup.</p>  <p>still get stuck on that same
  error</p>  <p>"unable to execute llvm-gcc-4.2: No such file or directory<br />
  error: Setup script exited with error: command 'llvm-gcc-4.2' failed with exit
  status 1"</p>
* Remigiusz 'lRem' Modrzejewski (2012-04-19 16:36:46): <p>Meh, you need to find
  some programmer who already switched to Lion. Should not be that hard, but
  unfortunately I'm not a one.</p>
* Darren (2012-04-19 16:39:58): <p>ok - thx for all the help though.</p>
* Logan (2012-08-29 16:29:35): <p>I have been surfing online more than three
  hours today, yet I never found any interesting article like yours.<br /> It is
  pretty worth enough for me. Personally, if all webmasters and bloggers made
  good <br /> content as you did, the internet will be much more <br /> useful
  than ever before.|<br /> I couldn't resist commenting. Very well written!|<br
  /> Inn is found in the flooring buisingess, traveler and additionally
  interpersonal precinct in Poland's budget,<br /> on the intersection of it has
  the significant road:.</p>  <p>It really is at the famed Development in
  Community not <br /> to mention Development, a vey important
  establishments,<br /> finance institutions and also the buying centre. The are
  all services to produce ones own stay in <br /> Warsaw as enjoyable as they
  can be, are generally <br /> obtained surrounding. Comfortable hitting the
  ground with this airport terminal, based 10 <br /> kilometers within the
  lodge; plus the Central Train Section is some sort <br /> of 0. 5-kilometre
  yardage.</p>
