+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-06-27T12:10:38"
draft = false
title = "LolDebian"
+++
Administruję sobie serwerkiem na uczelni. Stoi na nim Debian Lenny - wydawał
się najsensowniejszym systemem do tego typu zastosowań. A zastosowanie jest
proste - podstawowy _webserver_ oraz minimalistyczny _shell_ dla studentów.
Kiedy przejmowałem nad nim pieczę, śmiałem się trochę z poprzedniego admina,
że wybrał binarne distro a _/usr/src_ urosło mu do 6GB. Powoli zaczynam jednak
rozumieć, dlaczego tak się stało...

Potrzebowałem małego i prostego pakietu. W dodatku takiego, bez którego nie
wyobrażam sobie poważnego hostingu. A tutaj takie zależności na mnie
wyskoczyły: `defoma djvulibre-desktop fontconfig fontconfig-config ghostscript
gs-common gsfonts hicolor-icon-theme libatk1.0-0 libatk1.0-data libcairo2
libcroco3 libcups2 libcupsimage2 libdatrie0 libdjvulibre15 libdjvulibre21
libdrm2 libfontconfig1 libfontenc1 libfreetype6 libfs6 libft-perl libgd2-noxpm
libgl1-mesa-glx libglib2.0-0 libglib2.0-data libgraphviz4 libgs8 libgsf-1-114
libgsf-1-common libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libice6 libilmbase6
libjasper1 libjpeg62 liblcms1 libltdl3 libopenexr2ldbl libopenexr6
libpango1.0-0 libpango1.0-common libpaper-utils libpaper1 libpcre3
libpixman-1-0 libpng12-0 librsvg2-2 libsm6 libthai-data libthai0 libtiff4
libttf2 libwmf0.2-7 libxaw7 libxcomposite1 libxcursor1 libxdamage1 libxfixes3
libxfont1 libxft2 libxi6 libxinerama1 libxml2 libxmu6 libxpm4 libxrandr2
libxrender1 libxslt1.1 libxt6 libxtrap6 libxtst6 libxv1 libxxf86dga1
libxxf86misc1 libxxf86vm1 psfontmgr sgml-base shared-mime-info ttf-dejavu ttf-
dejavu-core ttf-dejavu-extra x-ttcidfont-conf x11-session-utils x11-utils
x11-xfs-utils x11-xserver-utils xdg-utils xfonts-encodings xfonts-utils xml-
core xsltproc xutils xutils-dev` I co, kto zgadnie po zależnościach, co to za
pakiet? Spoiler: vzntrzntvpx.

I jak tu traktować ich poważnie? Nawet Ubuntu Server nie robi takich jaj...

# Komentarze

* LnxTx (2009-06-27 12:23:32): <p>Mały i prosty pakiet? Toż to kombajn do ...
  jest.</p>
* Remigiusz 'lRem' Modrzejewski (2009-06-27 12:32:38): <p>Kombajn jak kombajn.
  Na Gentoo 3MB pakietu i bez bzdurnych zależności.</p>
* Michał Górny (2009-06-27 12:40:05): <p>DajszelanaET!</p>
* kristo (2009-06-27 12:47:51): <p>Podałeś --without-recommends? Nie. <br
  />Zresztą, jak pisze @LnxTx, to jest kombajn. Program obsługuje mnóstwo
  formatów graficznych, fonty itd. Chociaż zależność gtk jest dziwna. Ktoś już
  zwrócił uwagę na to http://bugs.debian.org/cgi-
  bin/bugreport.cgi?bug=478538</p>
* Moarc (2009-06-27 12:49:03): <p>noluv4mgorny.</p>
* Remigiusz 'lRem' Modrzejewski (2009-06-27 12:55:05): <p>E: Command line option
  --without-recommends is not understood <br />;) <br /> <br />Zaś --no-install-
  recommends nie zmienia tak wiele, a przede wszystkim - nie usuwa tych
  bzdurniejszych zależności od gtk i tak dalej.</p>
* meeee (2009-06-27 13:46:53): <p>I co ci po tym,  6G co to jest? Jaka to
  maszyna, P2 i dysk 10? Nowsza maszyna będzie szybsza, pewniejsza i będzie
  brała mniej prądu. Czas na upgrade, w dzisiejszych czasach nikt się tym nie
  przejmuje. <br /> <br />A jakie chcesz inne distro niż binarne na maszynę
  produkcyjną? Może kompilować na zabytku byś chciał jeszcze? No tak w warunkach
  akademickich to przejdzie pewnie...</p>
* Remigiusz 'lRem' Modrzejewski (2009-06-27 13:55:18): <p>Przemyśl jeszcze raz
  swoją wypowiedź... Czy serio uważasz, że ręczne klepanie './configure
  &amp;&amp; make &amp;&amp; sudo make install' jest o wiele bardziej
  enterprajzowe od 'emerge pakiet'? Czy jakoś inaczej mam zrozumieć to
  ,,przecież kompilowanie w niczym nie przeszkadza, byleby nie użyć distro które
  wymaga kompilacji''?</p>
* jam łasica (2009-06-27 18:46:00): <p>Gdyby poprzedni admin wszystko instalował
  w normalny sposób, <br />to może nie byłoby już żadnych dodatkowych zależności
  ;)</p>
* Remigiusz 'lRem' Modrzejewski (2009-06-27 18:47:49): <p>Praca poprzedniego
  admina poszła w niebyt, to było FUBAR. Choć może rzeczywiście, coś przetrwało
  formatowanie i robi nadal zależności? Trzeba było nowy dysk kupić, o! :)</p>
* Zal (2009-06-27 21:09:20): <p>Tak swoją drogą - to nie było tak, że na
  poprzednim sprzęcie adminów było wielu? :D Pamiętam, że sferowy serwer, co i
  rusz przechodził pod opiekę innej osoby.</p>
* Remigiusz 'lRem' Modrzejewski (2009-06-27 21:14:41): <p>Oj coś Ci się
  pomieszało. Ja go odziedziczyłem bezpośrednio po Noiksie, który chyba zajmował
  się tym od początku. <br /> <br />Chyba, że masz na myśli wszelkie dodatkowe
  uprawnienia prezesa. Ci to rzeczywiście się szybko zmieniali (a ostatnio
  jeszcze szybciej - ja byłem chyba najkrócej urzędującym prezesem w
  historii).</p>
* marketing plan for small business (2014-07-11 00:02:51): <p>I am sure this
  piece of writing has touched all the <br /> internet visitors, its really
  really nice post on building up new webpage.</p>
* visit the therxforum (2015-05-25 09:41:24): <p>For over 15 years Real Bookies
  has http://www.therxforum.com/showthread.php?t=918640&amp;highlight=
  successfully assisted bookmakers from around the <br /> world to take wagers
  from thousands of players on a pay for each head foundation.</p>  <p>Our
  state-of-the-art bookie software and the dedication from all of <br /> our
  clerks, outlines people, administrators and partners have made <br /> our own
  price for each head sportsbook solution one of the <br /> fastest expanding
  and most dependable bookmaking provider names in the industry.</p>  <p>Word of
  mouth may be the number cause new visit here agencies sign up in RealBookies,
  <br /> which usually speaks towards the high quality of <br /> service
  provided to both agents and their gamers.</p>  <p>Upon signing up for the
  Realbookies family, you can receive your very <br /> own assistant that will
  be right now there to solution any queries you may <br /> have about the
  company as well as how to grow your company using our pay per <br /> head
  sportsbook.</p>  <p>Joining Realbookies will make your own operation turn out
  <br /> to be par and level the particular playing
  www.therxforum.com/showthread.php?t=918640&amp;highlight= industry with the
  <br /> biggest online gaming companies on earth. The wagering <br /> software
  you and your players is going to be getting <br /> is the same with the
  biggest online sportsbooks today.</p>
