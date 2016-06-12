+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2011-05-30T12:18:00"
draft = false
title = "Linux 3.0"
+++
_Nadejszła wiekopomna chwiła_! Po ~20 latach:

    
    
    +VERSION = 3
    +PATCHLEVEL = 0
    +SUBLEVEL = 0
    +EXTRAVERSION = -rc1

W końcu coś się dzieje w tym Linuksie ;)

![Linux 3.0](http://maxnet.org.pl/~lrem/3tux.jpg)

Teraz do konkretów. Przełomowe zmiany to:

> So what are the big changes? **NOTHING**. Absolutely nothing. Sure, we have
the usual two thirds driver changes, and a lot of random fixes, but the point
is that 3.0 is *just* about renumbering, we are very much *not* doing a KDE-4
or a Gnome-3 here. No breakage, no special scary new features, nothing at all
like that. We've been doing time-based releases for many years now, this is in
no way about features. If you want an excuse for the renumbering, you really
should look at the time-based one ("20 years") instead.

Oraz uzasadnienie zmiany numerka:

> The whole renumbering was discussed at last years Kernel Summit, and there
was a plan to take it up this year too. But let's face it - what's the point
of being in charge if you can't pick the bike shed color without holding a
referendum on it? **So I'm just going all alpha-male**, and just renumbering
it. You'll like it.

Źródło: [LKML](http://lkml.org/lkml/2011/5/29/204). Podkreślenia własne.

# Komentarze

* pecet (2011-05-30 12:39:42): <p>:DD</p>
* pecet (2011-05-30 12:40:47): <p>Swoją drogą ciekawe kiedy wyjdzie 2.6.35.14,
  bo akurat jadę na longtermach.., a nie chciało mi się aktualizować od .11 i
  sobie powiedziałem, że jak .14 wyjdzie to to zrobie.</p>
* Remigiusz 'lRem' Modrzejewski (2011-05-30 13:49:37): <p>Oj kiepściutko,
  przecież te longermy pownieneś aplikować następnego dnia...</p>
* Tomasz Kowalczyk (2011-05-30 14:56:13): <p>Ja ogólnie jestem przeciwko tej
  "wielkiej" numeracji, jaką teraz wprowadza Chrome, Firefox i inne programy. Po
  to są wersje, podwersje i wydania, żeby móc ogarniać, kiedy wychodzi tylko
  mały update, a kiedy całkowicie nowa wersja. A tak poważny projekt jak Linuks
  nie powinien iść tą typowo marketingową drogą. Z drugiej strony, nikt Linusa
  nie może zignorować, więc [nie]stety mamy Linucha 3.0. ;]</p>
* Remigiusz 'lRem' Modrzejewski (2011-05-30 15:31:23): <p>No właśnie przez to
  "po to są wersje" musieli zmienić. Bo już od pięciu czy tam siedmiu lat wersje
  Linuksa w ogóle nie wskazują na wielkość zmiany. Acz ludzie uparli się
  oczekiwać, że różnice w kodzie będą jakoś zależały od różnicy w numerkach.
  Duża różnica w numerze bez dużej różnicy w kodzie ma wzniecić trochę szumu,
  aby w końcu do nich dotarło, że "czas na 2.7" raczej nigdy nie nadejdzie.</p>
* jam łasica (2011-05-30 17:19:46): <p>Ciekawe ile programów przestanie działać,
  gdy nie "wykryje" kernela 2.x ;) Np. dla kompatybilności Opera po wydaniu
  wersji 10.x nadal stosowała wewnętrzną numerację 9.x. Tak samo Windows 7 ma
  numer wersji 6.1...</p>
* moher (2011-05-30 17:26:42): <p>@jam łasica: Ale W7 raczej nie ma oznaczenia
  6.1 ze względu na kompatybilność a raczej dlatego, że ro SP do Visty.</p>
* Remigiusz 'lRem' Modrzejewski (2011-05-30 17:55:37): <p>Windows te wewnętrzne
  oznaczenia ma akurat związane ze zmianami. Dopóki nie zrobią kolejnego fikołka
  w architekturze systemu, to techniczni nie dadzą się zmusić na zmianę majora z
  6 na cokolwiek. Nawet jeśli marketing doliczy już do fafnastu.</p>
* pecet (2011-05-30 19:36:31): <p>No Windows ma bardzo zdrową numerację, a do
  końca roku Linux 10? ;)</p>
* Bartosz &quot;BTM&quot; Szczeciński (2011-05-30 19:45:41): <blockquote>
  <p>No Windows ma bardzo zdrową numerację</p> </blockquote>  <p>No, z 3.x
  przeskoczyli na 95, potem 2000, a teraz na 7 ;)</p>
* Remigiusz 'lRem' Modrzejewski (2011-05-30 20:40:31): <p>Windows 95 miał numer
  4.0, 2000 − 5.0, XP - 5.1, Vista - 6.0, 7 − 6.1. Chyba najklarowniejsza
  numeracja wersji w historii oprogramowania. Z historią marketingu jest trochę
  inaczej :P</p>
* jam łasica (2011-05-30 21:03:25): <blockquote>   <p>Dopóki nie zrobią
  kolejnego fikołka w architekturze systemu</p> </blockquote>  <p>Pewnie dlatego
  Windows Me tak szybko skoczył do 4.90 :)<br /> I jeszcze Win NT, który
  wystartował od razu z 3.1 (jako przerobiony MS OS/2).</p>
* rozie (2011-05-31 07:04:09): <p>"Duża różnica w numerze bez dużej różnicy w
  kodzie ma wzniecić trochę szumu, aby w końcu do nich dotarło, że "czas na 2.7"
  raczej nigdy nie nadejdzie" - mała strata, bo nieparzyste były testowe. ;-)
  Tak czy inaczej wiele hałasu o nic - to tylko numer. I może będzie czytelniej
  teraz - bo z 3 (4) cyfr i tak używane były 2-3.</p>
* Remigiusz 'lRem' Modrzejewski (2011-05-31 09:57:56): <p>Dwie z 4, 2.6 jako
  część stała… Ciekawe ile czasu zajmie im teraz przerobienie wszystkich
  skryptów, żeby wyciąć jedną liczbę ;)</p>
* iss (2011-05-31 10:02:53): <p>IMO skoro naprawdę poważnych zmian nie ma, to
  nie numerki idą nawet do 2.6.123.</p>  <p>Chyba wszyscy zazdroszczą
  Chrome/Chromium, gdzie między wersjami 5 a 11 jedyna widoczna różnica to
  usunięcie "http://" przed adresem.</p>  <p>Sensowną numerację ma na przykład
  KDE - X.Y.Z - gdzie Z, to bugfiksy, Y pewne ulepszenia, a X to już dość
  radykalna zmiana.</p>
* Remigiusz 'lRem' Modrzejewski (2011-05-31 10:04:55): <p>Ale przecież model
  rozwoju Linuksa w ogóle na coś takiego nie pozwala...</p>
