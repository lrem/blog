+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2011-08-19T10:00:39"
draft = false
title = "Fox on fire"
+++
Wygląda na to, że trzeba powoli szukać alternatywy dla Firefoksa. Wszystko zaś
przez ich _czysto marketingową_ decyzję o _nadrabianiu zaległości_. Chodzi
oczywiście o nową wersję **co sześć tygodni**. Problem w tym, że ta
marketingowa decyzja ma fatalne skutki techniczne...

![Nie mają już nawet czasu uaktualniać
ilustracji](https://www.mozilla.com/img/covehead/firefox/main-feature-
facebook.png)

Obrazek ze strony z [nową wersją](https://www.mozilla.com/en-US/firefox/new/).
Zauważyliście, że szkoda im czasu na osobne obrazki do nowych wersji?

Wydawałoby się, że raptem chwilę temu zezwoliłem na upgrade do wersji 5.0.0.
Jak wynikało z opisu, był to właściwie security patch... Zirytowałem się więc,
że ze względu na głupie fanfary muszę poświęcać swoją uwagę na takie rzeczy.
Powinno przecież zostać zainstalowane automatycznie. Myliłem się.

Kiedy Fx się zrestartował, mym oczom ukazał się zepsuty intefrejs. Zepsuty,
gdyż nie załadował się [Pentadactyl](http://dactyl.sourceforge.net/). Jak się
po chwili okazało, nie załadowała się co najmniej połowa dodatków. Niech żyje
sprawdzanie kompatybilności oparte o wersję programu!

Udało się już ten burdel opanować. Przy okazji skorzystałem z incentywy i
usunąłem mniej używane pluginy. Niesmak jeszcze nie przeminął. A tu ukazuje
się moim oczom:

> A security and stability update is available: Firefox 6.0

Niby trzeba instalować, bo mój Firefox 5.0.1 (jedna łatka zainstalowana
automatycznie) **ma już krytyczne dziury i przestał być wspierany**. Jak
donoszą koledzy, którzy kliknęli _update_, znowu połowa rozszerzeń przestaje
działać. Ponadto nie wiem, czy jest w ogóle sens to przechodzić, skoro
**Firefox 6 zostanie porzucony już we wrześniu**.

Ktoś mógłby powiedzieć, że kliknięcie w update to nie jest aż taka męczarnia,
a twórcy rozszerzeń w końcu się nauczą nie polegać na numerkach. Jest jednak
inny poważny aspekt. Utarło się, że numer wersji ma pewne znaczenie
techniczne: jego zmiana określa złamanie kompatybilności. Oczywiście są
projekty takie jak [Fossil](http://fossil-scm.org/), gdzie kompatybilność z
założenia nie jest łamana, więc numery wersji są zbędne. Jednak Firefox taki
nie jest. Ewolucja zastosowań wymaga ewolucji architektury, a to praktycznie
wymusza okazjonalne łamanie kompatybilności. Zaś brak naturalnej bariery, jaką
jest numer wersji, wróży trwałe problemy w komunikowaniu owego łamania.

Skoro więc co sześć tygodni mają przestawać działać pluginy... Bez nich mogę
równie dobrze korzystać z Safari :/

# Komentarze

* n3m0 (2011-08-19 11:19:14): <p>Zgadzam się w całej rozciągłości.<br /> Miałem
  StopAutoplay. I ze 20 youtubów na kartach. Jak się FF odpalił po poupdate'owym
  restarcie to myślałem, że oci**ję.<br /> Teraz znowu (6 w pracy) i kolejne
  dodatki przestają działać.<br /> Rozwiązanie jest proste, należy w xpi zmienić
  zakres wersji (ryzyko, że przestanie działać, jest względnie małe), ale
  przecież nie będę się gimnastykował po każdym updacie.<br /> Zresztą - chyba
  od 4 FF mi zżera tyle pamięci, że okazjonalnie zawiesza mi kompa (jak zapomnę
  zrestartować dziada). Mozilla zresztą na problemy z zapychaniem pamięci podaje
  'solution' - od czasu do czasu restartować. Win95 normalnie ;/</p>
* zx (2011-08-19 11:30:17): <p>A te dodatki nie miały być stopniowo przepisywane
  na HTML/CSS/JS jak w reszcie przeglądarek?</p>
* Remigiusz 'lRem' Modrzejewski (2011-08-19 12:40:23): <p>Wszystko przepisać. A
  pomyśleć, że jeszcze dekadę temu śmialiśmy się z programistów html...</p>
* Caladan (2011-08-19 12:49:46): <p>Ano, taka zmiana częsta wersji nie wygląda
  profesjonalnie. Mogli od razu skoczyć do wersji 15.0 i dalej zacząć numerować
  normalnie.</p>
* jam łasica (2011-08-19 13:55:10): <p>Zainstalowałem 6 tylko po to, żeby
  sprawdzić jak wygląda tag "progress" z HTML 5 :) Ostatnio gdzieś czytałem, że
  v8 ma zużywać 100% mniej pamięci. Żadne to pocieszenie, skoro ostatnie wersje
  potrzebują 150% więcej ;-)</p>  <p>Poza tym wszystkie <strong>dobre</strong>
  rozszerzenia obsługują najnowsze wersje Fx. IMHO nie ma żadnego
  usprawiedliwienia dla leniwych twórców dodatków...</p>
* Caladan (2011-08-19 13:55:50): <p>Taak, obniżka o 100%, teraz oddajemy za
  darmo ;)</p>
* remiq (2011-08-19 14:38:03): <blockquote>   <p>IMHO nie ma żadnego
  usprawiedliwienia dla leniwych twórców dodatków...</p> </blockquote>  <p>No,
  ci leniwi twórcy powinni znać swoje miejsce. Posłowie coś powinni z nimi
  zrobić. Może publiczne biczowanie za brak aktualizacji w terminie?</p>
* Zal (2011-08-19 16:16:15): <p>A twórcy Vimperatora uznali, że ogień zwalczą
  ogniem i ustawili w swojej wtyczce maxVersion na jakąś magicznie wysoką
  wartość :&gt;</p>
* Remigiusz 'lRem' Modrzejewski (2011-08-19 16:45:54): <p>Pentadactyl jest
  chwilowo na 8.*. Więc niby kilka miesięcy by działał ;)</p>  <p>Jednak takie
  zawracanie dupy twórcom rozszerzeń jest moim zdaniem bez sensu.</p>
* womperm (2011-08-19 16:59:59): <p>Po prostu to jest psychologia. Chrome
  zdobywa użytkowników i nabija sobie numerki z każdą nową wersją, więc nie
  znający się użytkownik, powie "chrome jest lepszy bo ma nowszy numerek, a fx
  jest stary".</p>
* Remigiusz 'lRem' Modrzejewski (2011-08-19 17:01:47): <p>No to niech zrobią tak
  samo jak Slackware odpowiedział kiedyś na version bloat ze strony Redhata:
  następna po 6.0 wersja to 16.0. Można wrócić do normalności.</p>
* raj (2011-08-19 17:02:32): <p>Całkowita racja. Odbiło im z tymi wersjami.</p>
* pecet (2011-08-19 17:02:47): <p>Nighlty Tester Tools wyłączasz kompatybilność
  i śmigasz, ja przeszedłem z wersji 3.6 do 6, i wywaliłem jedynie z 5
  rozszerzeń z moich 40 paru. :)</p>
* Szymon (2011-08-19 17:29:40): <p>na fx 3-coś pimperator był za wolny jak na
  mój gust. Btw, jest jakaś stabilna klawiszologia do chrome ? może być vi, może
  też emacs. Me nie używa fxa od jakiś 2 miesięcy, nie lubię zamieszania.</p>
* Remigiusz 'lRem' Modrzejewski (2011-08-19 17:32:36): <p>Pentadactyl nie miewa
  problemów z wydajnością jak niegdyś Vimperator. Na Chrome używam Vimium, nawet
  działa (w przeciwieństwie do Vrome).</p>
* KORraN (2011-08-19 17:39:19): <p><em>"Rozwiązanie jest proste, należy w xpi
  zmienić zakres wersji (ryzyko, że przestanie działać, jest względnie małe),
  ale przecież nie będę się gimnastykował po każdym updacie."</em></p>
  <p>Rozwiązanie jest prostsze i podał je pecet ;) Można też samemu ustawić
  odpowiednią wartość w about:config. Ja osobiście nie narzekam na Firefoksa,
  przestawiłem się i jest ok, Chrome jest dla mnie za prosty, a Opera ma głęboko
  gdzieś swoich userów.</p>
* mnlf (2011-08-19 17:50:32): <p>U mnie się właśnie przed chwilą uaktualnił do
  wersji 3.6.20 Automatycznie z apta bez żadnego klikania, jak widać jest to
  ciągle ten sam firefox 3.6 tylko, że z poprawkami odpowiadającymi za
  bezpieczeństwo, dzięki temu nie mam nigdy takich problemów jak opisałeś.</p>
  <p>Nie wiem z jakiej dystrybucji korzystasz ale jeśli nie lubisz gdy
  funkcjonalność programów ulega dużym zmianom i wolisz aby aktualizacje
  poprawiały jedynie błędy, powinieneś wybrać debiana stable albo ewentualnie
  ubuntu LTS.</p>  <p>Naprawdę nie można mieć pretensji do developerów o to, że
  rozwijają funkcjonalność swojego programu, to nie oni decydują o tym czy
  zainstalujesz sobie wersję rozwojową, testową czy stabilną.</p>
* Remigiusz 'lRem' Modrzejewski (2011-08-19 17:57:20): <p>Instaluję tylko
  stabilne. Problem w tym, że w niektórych projektach wymyślili sobie, że
  wypuszczanie stabilnych wersji co półtora miesiąca to bardzo dobry pomysł.</p>
* SebaS86 (2011-08-19 18:20:51): <p>Teraz Ci leniwi programiści będą mieli powód
  aby ich dodatki były płatne. ;)</p>
* ffhejter (2011-08-19 20:58:24): <p>opera, polecam</p>
* n3m0 (2011-08-19 21:49:06):
  <p>http://www.pcmag.com/article2/0,2817,2391386,00.asp</p>  <p>Hłe hłe...</p>
* Piotrek Reinmar Koszuliński (2011-08-20 01:13:11): <p>1) To nie wina
  Firefoksa, że ma tak dużo dodatków. Każdy znajdzie coś dla siebie, ale 95% nie
  powinna być używana. Jeśli autor nie potrafi dobrze napisać rozszerzenia, to w
  następnej wersji albo się wywali, albo się wyłączy ze wzg. na wersję.</p>
  <p>2) Chrome wydaje wersje równie szybko i jakoś nikomu to nie przeszkadza.
  Może dlatego, że tam prawie nie ma dodatków? Oczywiście "prawie" wzg.
  Firefoksa.</p>  <p>3) Krótkie cykle wydawnicze są co prawda spowodowane
  głównie marketingiem, ale ja jako developer się z tego cieszę. Takie
  przypominanie użytkownikom, że trzeba zrobić update i w dodatku "uciekanie" z
  najnowszym numerkiem działa dobrze psychologicznie. Ja mam 4, a tu już 6
  wydali... Fck. Pora na update. A nie jak kiedyś. Ja mam 2.0, oni wydali 3.0,
  to nie ma co update'ować. A 2 lata minęły.</p>  <p>4) Używam dwóch dodatków
  Adblock i Firebug i nie mam żadnych problemów :P W końcu to przeglądarka.</p>
  <p>5) Kolejne wersje to nie tylko poprawki bezpieczeństwa, ale też naprawdę
  sporo nowych ficzerów. Wystarczy popatrzeć na changelogi.</p>
* Pandaa (2011-08-20 15:35:02): <p>Jest taki plug, "Add-on compatibility
  reporter", który sprawia, że problemów nie ma z kompatybilnością, dopóki
  faktycznie konstrukcja pluga się nie gryzie z obecną wersją.</p>
* radarek (2011-08-20 21:43:23):
  <p>https://addons.mozilla.org/pl/firefox/addon/add-on-compatibility-
  reporter/?src=api</p>  <p>Zainstalować i cieszyć się (w większości)
  działającymi dodatkami w najnowszej wersji ff.</p>
* SebaS86 (2011-08-20 22:09:44): <p>Dodatek, który poprawia działanie dodatku,
  który "poprawia" działanie przeglądarki. Do tej pory paranoją wydawało mi się
  definiowanie wyglądu przeglądarki za pomocą CSS-a i pisanie wtyczek w JS ale
  to jest chyba jeszcze lepsze. :)</p>  <p>Teraz to chyba i ja się przesiądę na
  coś innego, dowcip o Emacsie jak ulał zaczyna pasować do Firefoksa.</p>
  <p>@Reinmer, odnośnie punktu 5, używałbym nadal Firefoksa w wersji 2 gdyby
  miał aktualizacje bezpieczeństwa. Niestety będzie trzeba przeboleć do
  ustabilizowania sytuacji, tak jak niektórzy musieli przeboleć Vistę.</p>
* n3m0 (2011-08-21 02:21:37): <p>Właśnie zdowngrade'owałem dziada do 3.6
  (firefox3 w repozytorium AUR).<br /> Zajętość pamięci ponad 50% mniej niż na 5
  - nawet(!) przy dwukrotnie większej liczbie otwartych kart.<br /> Wszystkie
  pluginy działają, chodzi szybko i sprawnie.<br /> Because FUCK YOU, firefox
  4+!</p>
* Szymon (2011-08-21 10:25:32): <blockquote>   <p>Teraz to chyba i ja się
  przesiądę na coś innego,<br />   dowcip o Emacsie jak ulał zaczyna pasować do
  Firefoksa.</p> </blockquote>  <p>który ? że na 8MB nie dało się pracować ?
  potwierdzam. W tej chwili to jest taki kombajn że 32 to też jest mało.</p>
* Caladan (2011-08-21 10:27:19): <p>Ten o systemie operacyjnym Emacs i jego
  edytorze ;)</p>
* Szymon (2011-08-21 10:31:04): <p>ten mnie akurat nie śmieszył, lipny był
  choćby ze względu na to że emacs ma wbudowane porządne edytory ;)</p>  <p>btw,
  nowy fx ma <em>scratch</em> XD mogli to nazwać inaczej bo się kojarzy XD</p>
* Szymon (2011-08-21 10:31:27): <p>kurwa zamieniło mi gwiazdki, sry.</p>
* rozie (2011-08-21 15:07:20): <p>Trochę dramatyzujesz. Fakt, obecna sytuacja z
  rozszerzeniami jest zła, ale częste wydania dopiero co weszły i zapewne
  najpóźniej do końca roku jakoś to wyprostują. Poza tym, dla chcącego nic
  trudnego - wystarczy wyłączyć sprawdzanie kompatybilności i załatwione (u mnie
  załatwia to Nightly Tester Tools).</p>  <p>I ja akurat z Fx 5.0 jestem
  zadowolony. Na oko trochę szybszy niż 3.6 (na biednym sprzęcie).</p>
* Remigiusz 'lRem' Modrzejewski (2011-08-21 15:54:42): <p>Czyli jesteś
  zadowolony z przestarzałej, niewspieranej już wersji...</p>
* rozie (2011-08-21 16:11:05): <p>Akurat się dist-upgrade po urlopie ciągnął,
  jak to pisałem (zresztą devteam Mozilli w Debianie też trochę czasu pewnie
  potrzebował...). 6.0 używam za krótko (kilkadziesiąt minut?), żeby się
  wypowiadać bardziej, na pierwszy rzut oka wygląda jak 5.0, więc liczę, że nie
  będzie źle.</p>  <p>Ogólnie spora ściema z tymi cyferkami. Różnic między
  Chromium ~6 a ~13 też nie widzę, ale Ch używam specyficznie, tylko do paru
  serwisów. ;-)</p>
* Remigiusz 'lRem' Modrzejewski (2011-08-21 16:22:08): <p>Ano ściema, ale w
  przypadku Chrome to nie ma takiego znaczenia, bo oni wciąż się nie dorobili
  sensownego ekosystemu.</p>
* interjak (2011-08-29 21:52:55): <p>Skoro nie rozwalam komputera przy każdej
  aktualizacji Windows (choć krew mnie zalewa, że znów coś ssie, a ssie co
  najmniej raz na tydzień), to i update'y FF jakoś wytrzymam. </p>  <p>Fakt, że
  czasem powoduje to niedziałanie dodatku - a gdyby mi na dobre wyłączyć np.
  Quicknote, to bym wył. Na szczęście, jak dotąd, udało się uniknąć takiej
  katastrofy.</p>
* SebaS86 (2011-08-29 23:04:46): <p>@interjak, problem w tym, że Firefox w
  pogoni za nowościami powoduje także wprowadzenie mniej lub bardziej
  uciążliwych błędów. Np. w 5 na niektórych stronach źle dekodowało obrazki
  (Memory corruption due to multipart/x-mixed-replace images
  http://www.mozilla.org/security/known-vulnerabilities/firefox.html#firefox6) -
  wystarczy wejść np. na stronę http://infoludek.pl, przekłamania powinny być
  widoczne przy listach. O ciekawszych błędach w 6 dowiemy się pewnie po wydaniu
  7 albo 6.0.1.</p>
* lRem's blog (2011-10-03 12:13:51): <p>Przyszłość Firefoksa<br /><br />Ten wpis
  dłuuugo leżakował jako szkic...<br />  <br />  Jedną trzecią cyklu
  wydawniczego (po ludzku: dwa tygodnie) temu ponarzekałem sobie na zawrotne
  tempo pojawiania się nowych wersji Firefoksa. Wpis ten zaskoczył mnie dwiema
  rzeczami: popularnością[...]</p>
* italian restaurants near me (2014-12-28 11:13:12): <p>Mein Name ist Gino . Ich
  lebe in Somme- Leuze , Belgien. <br /> Ich zufällig stolpern lrem.net . Ich
  möchte nur sagen, "Hallo " .</p>
* http://gallery.naryanian.com/profile/joa (2015-01-01 02:13:50): <p>Mein Name
  ist Carlo . Ich lebe in Brüssow , Deutschland.<br /> Ich zufällig stolpern
  lrem.net . Ich möchte nur sagen, "Hallo " .</p>
* firefox download (2015-01-22 13:18:42): <p>The domain of web browsers has
  always been packed with competition and intense challenge of offering the most
  <br /> to the user. Step-three: Uninstall the Existing Flash Participant.</p>
* motorcity.ua (2015-02-05 17:52:10): <p>The minimum amount that a trader must
  deposit within a cash account depends around the brokerage.<br /> In 2005,
  E*Trade began talks to acquire Ameritrade,<br /> another discount
  brokerage.</p>
* online title loans (2015-03-01 14:16:41): <p>Vehicle title loans are cash
  loans the place that the title loan provider places a lien in your vehicle
  until it truly is paid.<br /> Selling a motor vehicle without a title can be a
  <br /> bit tough because you will need to follow legal requirements.</p>
* ovulation calendar fertile days (2015-03-07 11:52:48): <p>Apparently that is
  more than you may need, but you can cut by changing <br /> the idea of excess
  (the fine).</p>
* golden corral near me (2015-03-09 19:22:25): <p>Nonetheless, devoid of the
  knowledge and skills to find cheap deals, you might find yourself at a
  disadvantage.</p>
