+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-03-13T12:32:26"
draft = false
title = "Upgrade Gentoo i problem z dźwiękiem"
+++
Zrobiłem coś czego z Gentoo nie powinno się robić - pozwoliłem zerdzewieć.
Dlatego też ostatnie kilka dni cały czas coś mi się kompiluje w tle. Pomijając
już to, że szybciej by chyba było skompilować od zera, to sytuacja ta niesie
za sobą pewne niedogodności:

  * cały czas dysk terkocze
  * co jakiś czas trzeba coś zrestartować
  * co jakiś czas trzeba zapuścić _etc-upgrade_
  * co jakiś czas coś działa inaczej niż przedtem (i ujawniają się _funny features_)

Do tej ostatniej kategorii zaliczyłem to, że w pewnym momencie zamiast dźwięku
z głośników zaczął dobiegać paskudny pisk.

Oczywiście _revdep-rebuild_ nie wskazał przyczyny, 15 sekund Googlania
takoż... Zmiana wersji _alsy_, wypieprzenie _artsd_ ani inne kroki nie
pomogły. Koniec końców poddałem się i poszedłem spać. Rano zaś wstałem,
włączyłem komputer, odpaliłem _kmix_ i wyłączyłem ten cholerny mikrofon :)

# Komentarze

* q84_fH (2009-03-13 14:01:31): <p>Czasami śmieszne rzeczy wchodzą przy emerge
  --update --newuse --deep @system @world.  <br />Ale czy jest coś
  porównywalnego z nudą bezawaryjnej aktualizacji? <br />Gentoo FTW :)</p>
* yoshi314 (2009-03-13 14:59:58): <p>mialem kiedys ten pisk przy jakims
  wariancie ac97. musialem wyciszac line-in. <br /> <br />ja ostatnio
  aktualizuje system raz na 2,3 tygodnie i jako daje rade.  <br /> <br />ale
  czasami z zazdroscia patrze na arch linux na kompie obok ktory robi to
  znacznie szybciej (bo lacze nie najgorsze).</p>
* lRem (2009-03-13 15:45:50): <p>Najlepsze jest to, że ja to  mam w sprzęcie -
  niezależnie od systemu przedni mikrofon nasłuchuje ufo. I zawsze o tym
  zapominam ;)</p>
* Michał Górny (2009-03-13 17:18:30): <p>&gt; cały czas dysk terkocze <br /> <br
  />To jeszcze używa się dysków bez regulacji poziomu hałasu? Dołóz do tego
  kompilowanie na tmpfs — i pięknie jest.</p>
* lRem (2009-03-13 21:24:26): <p>No nowe (ciche) dyski właśnie mam w plecaku,
  tylko muszę jeszcze do domu trafić coby je wkręcić :) <br /> <br />A co do
  tmpfs to jest jeszcze śmieszniej - ram mi śpiewa. Serio, potrafi być momentami
  głośniejszy niż cała reszta blaszaka razem wzięta. A już podczas memtest86 to
  brzmi jak orkiestra symfoniczna. Ale niestety działa, więc nie kwalifikuje się
  na gwarancję.</p>
* Michał Górny (2009-03-13 21:28:24): <p>lRem: nagraj i poka!</p>
* lRem (2009-03-13 21:37:01): <p>Ok, jak tylko się w domu rozgoszczę (raczej nie
  dzisiaj).</p>
* LCF (2009-03-14 10:24:57): <p>Z czystej ciekawości, czy naprawdę warto się tak
  umęczać z systemem na workstacji ?</p>
* Michał Górny (2009-03-14 10:35:13): <p>LCF: Nie, lepiej mieć Windows i
  regularnie zastanawiać się „gdzie, do cholery jasnej, podział się ten
  sterownik?” o wpół pierwszej nad ranem.</p>
* Remigiusz 'lRem' Modrzejewski (2009-03-14 11:07:03): <p>LCF: to teraz proszę
  wytłumacz, czym jest według Ciebie to umęczanie się, a przede wszystkim - czy
  widzisz jakąś lepszą alternatywę?</p>
* GiM (2009-03-25 10:52:26): <p>@lRem: vista zajebista ;-) <br />w pracy mam i
  nie narzekam, do wszystkiego się można przywyczaić :)</p>
* Remigiusz 'lRem' Modrzejewski (2009-03-25 11:02:29): <p>@Gim: a czy ja
  cokolwiek pisałem o Viście?</p>
* sonakshi sinha weight loss (2014-08-28 03:55:24): <p>I always spent my half an
  hour to read this website's posts <br /> all the time along with a mug of
  coffee.</p>
* les media sociaux (2015-01-28 06:23:26): <p>D'après cette agence, la plupart
  des marques sont de plus en plus sensibles au fait que les réseaux sociaux ont
  leurs importances en marketing <br /> en ligne.</p>
