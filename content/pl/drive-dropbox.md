+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2012-11-06T17:53:15"
draft = false
title = "Drive--, Dropbox++"
+++
Ostatnio sporo czytam. Muszę też robić notatki. Chcąc się oderwać od
komputera, czytam jak najwięcej na tablecie. Potrzebuję więc czegoś, co
pozwoli mi synchronizować notatki między jednym a drugim. Wydawało mi się, że
Google Drive będzie optymalne. Niestety, nie miałem racji...

![I zdechło...](http://pub.lrem.net/2012/11/drive_dead.png)

Ten komunikat oznacza koniec pracy...

### Synchronizacja

Ku memu wielkiemu zdziwieniu, Drive na Androida nie potrafi po prostu
synchronizować folderu. Byłoby to zbyt proste... Dlatego skazani jesteśmy na
używanie tego ich cudownego edytora i wgrywanie/ściąganie plików pojedynczo.

### Edytor tekstu

Zacznę może od tego: Googlowy edytor tekstu **nie umie edytować plików
tekstowych**! Nie, nie jest to przejęzyczenie. Pliki takie są dostępne tylko
do odczytu. Pięknie...

Ok, więc będzie tekst formatowany ich edytorem. Niby nie jest to wielka
sprawa. Nawet ma jakieś niby sensowne UI do formatowania... Tylko czemu w
wersji mobilnej nie da się wyklikać, że coś jest headerem?

Ale to wszystko szczegóły. Prawdziwy problem pojawia się przy prawdziwej
pracy. Konkretnie przy wklejaniu niemałego kawałka tekstu. Ilekroć tego
próbuję, program traci połączenie z serwerem. **Nie da się już zapisać**, ani
nawet kontynuować pracy. Problem jest powtarzalny i występuje już przy niezbyt
długich akapitach.

### Simple notepad

Ok, więc potrzebuję jednak innego edytora. Pada na [Simple Notepad](https://pl
ay.google.com/store/apps/details?id=org.mightyfrog.android.simplenotepad&featu
re=related_apps#?t=W251bGwsMSwxLDEwOSwib3JnLm1pZ2h0eWZyb2cuYW5kcm9pZC5zaW1wbGV
ub3RlcGFkIl0.). W sumie bez wyraźnego powodu, poza tym że program ów nie
próbuje mnie szpiegować _i działa_. Piszę sobie w Markdownie, po czym Pandoc
pozwala mi z tego zrobić ładną i semantycznie sensowną stronę.

### Dropbox

I teraz kolejne jaja. SN pozwala eksportować te swoje notatki do chyba każdej
sensownej chmury. W przypadku Drive trzeba to jednak robić ręcznie. Google nie
udostępniło ponoć jeszcze API do automatycznej synchronizacji. API takie
udostępnił jednak [Dropbox](http://db.tt/lbUVfAcN).

Integracja Simple Notes + Dropbox działa sensownie, czyli tak jak bym sam to
napisał. Kiedy otwieram plik, jest on najpierw ciągnięty z chmury. Ilekroć
kliknę save bądź opuszczę edytor, jest do chmury pchany. Jeśli zamiast w
biurze przyjdzie mi do głowy popracować na ławeczce między drzewami, to nic
się nie obraża i synchronizacja nastąpi dopiero wtedy, gdy będę w zasięgu
WiFi. Rozwiązanie idealne w przypadku pracy samemu na wielu urządzeniach.

![Nieprawda! Maki się nie
palą!!1!~](https://www.dropbox.com/static/images/firebox_transparent.png)

Chmura nie zapomina...

### Przestrzeń

_Tabelkową_ przewagą Drive jest udostępniona na start przestrzeń: 5GB. Dropbox
daje za darmo w podstawie tylko 2GB, jednak po kwadransie miałem już 3.25GB.
Pierwszy krok: rejestrując się skorzystaj z linka od kogoś, [na przykład ode
mnie](http://db.tt/lbUVfAcN). Dodaje to do obu kont 500MB. Z tego co widzę, to
max darmowej przestrzeni w Dropboksie to na ten moment 45GB (16GB z samych
poleceń).

# Komentarze

* DTJ (2012-11-06 19:35:21): <p>https://www.dropbox.com/spacerace jak masz
  e-mail w domenie <em>.edu</em> jakiejś uczelni to do 25GB można dostać.</p>
* Remigiusz 'lRem' Modrzejewski (2012-11-06 19:42:08): <p>Nie musi być
  <em>edu</em> ;)</p>
* mt3o (2012-11-06 20:04:02): <p>A Evernote znasz?</p>
* Remigiusz 'lRem' Modrzejewski (2012-11-06 20:04:43): <p>O istnieniu wiem, ale
  nie wiem czy by równie dobrze zadziałało.</p>
* Zal (2012-11-06 22:45:09): <p>Podstawowy dataplan: 2 GB<br /> Great Space
  Race: 25 GB na dwa lata<br /> Camera Uploads: 3,5 GB (do 5 GB)<br /> HTC +
  Dropbox: 23 GB na dwa lata<br /> Getting started + simple tasks: 875 MB<br />
  Dropquest 2012: 1 GB<br /> Poleceni: 10 GB (do 16 GB)</p>  <p>Podsumowując,
  nie wiem po co komu więcej miejsca na Dropie, niż kilka/kilkanaście
  gigabajtów.</p>
* torero (2012-11-06 23:30:44): <blockquote>   <p>Integracja Simple Notes +
  Dropbox działa sensownie, czyli tak jak bym sam to napisał.</p> </blockquote>
  <p>Uwielbiam taką chłodną świadomość własnego profesjonalizmu, też tak mam
  :D</p>
* Michał &quot;Wolvverine&quot; Panasiewicz (2012-11-07 03:54:59): <p>Evernote -
  jedyny problem że synchronizacja dostępu do notatek w offline dla Androida
  jest w wersji płatnej.I to że nixnoteczasami bywa kapryśny.<br /> Z dropboxem
  (i keepass2) to podstawowy zestaw.</p>
* fsm@rashell.pl (2012-11-07 08:44:35): <p>Evernote chodzi pod wine. <br /> Poza
  tym jest jeszcze everpad (podobno świetny na Ubuntu, moja Fedora/KDE) go nie
  odpala. Ale w sumie i tak zawsze korzystam przez przeglądarkę.</p>
* Hoppke (2012-11-07 15:07:40): <p>Evernote++. Używam do trzymania różności, od
  kawałków kodu, przez obrazki, po przepisy kulinarne.<br /> A do bardzo
  specyficznego typu notatek (-&gt; tasków) może się też sprawdzić Trello.</p>
  <p>Wiem też, że MS wypuścił OneNote na Androida -- ale nie testowałem, więc
  się nie wypowiem.</p>
* Remigiusz 'lRem' Modrzejewski (2012-11-07 15:18:10): <p>Czy evernote pozwoli
  mi, po stronie PC, edytować notatki Vimem?</p>
* Hoppke (2012-11-07 15:22:27): <p>Raczej nie, wydaje mi się, że trzyma dane w
  binarnych blobach, bez bezpośredniego dostępu.</p>
* Remigiusz 'lRem' Modrzejewski (2012-11-07 15:23:44): <p>Aha. Opcja z
  Dropboksem ma tę zaletę, że mam w Vimie podpięte dość przydatne skrypty.</p>
* remiq (2012-11-07 22:41:37): <p>Evernote trzyma notatki lokalne i czasem je
  synchronizuje. Jeśli w międzyczasie zmienisz notatkę na innym urządzeniu, po
  synchronizacjach otrzymasz konflikt jako obie notatki zapisane do
  porównania.</p>  <p>Vima raczej nie obsłuży, ale ma swoje API, więc albo sam
  możesz napisać, albo skorzystać z ifttt by przeportować do innej postaci.</p>
* Madelene O. Siedel (2014-09-26 23:31:25): <p>Asking questions are in fact nice
  thing if you are not understanding anything <br /> totally, but this paragraph
  presents good understanding yet.</p>
* online payment processing options (2014-12-21 07:19:03): <p>This is reall
  interesting, You're a very skilled blogger.<br /> I have joined your rss feed
  and llok forward to seeking more of <br /> yor wonderful post. Also, I've
  shared your website in mmy social networks!</p>
* Ryan (2014-12-22 09:25:22): <p>Heya i'm for the primary time here. I came
  across this board and <br /> I to find It truly useful &amp; it helped me out
  a lot. I am hoping to present one thing back and <br /> help others like you
  helped me.</p>
* top eleven hack no download (2014-12-22 09:27:09): <p>I do not own a phone
  with Android (I in fact have an apple iphone ...) however I wish to configure
  some Android apps, <br /> without burning cash on a phone.</p>
* http://easyhacks4you.com/hay-day-hack-fr (2014-12-26 14:21:11): <p>Hay Day
  Hack Tool is made for those individuals that fucking despises to purchase
  something in the game for a genuine money or they just <br /> do not have
  money to buy that spunk in the game so they wish to obtain all those sources
  for this cheas device you can obtain endless amount of Diamonds as well as <br
  /> Coins any time you would like to. It is realy <br /> fucking working great
  and you can download it and also try out now.<br /> Don't be frightened it
  will not restriction you since we have executed a fucking <br /> excellent
  Anti-Ban system that secures our individuals from <br /> ban.Download now the
  current as well as updated Hay Day Cheats to get free <br /> of cost precious
  stones right to your account.</p>
* Hack Tool (2014-12-28 03:31:01): <p>Fastidious respond in return of this issue
  with real arguments and describing all about that.</p>
* Hack Tool (2014-12-28 03:31:16): <p>Fastidious respond in return of this issue
  with real arguments and describing all about that.</p>
* Early Childhood Music Tutor Sydney (2015-05-19 04:51:28): <p>The learning lab
  is providing the best Maths and English tutor in Sydney and if you are looking
  for maths tutor for your child contact us now!</p>
* aquapure salt cell (2015-06-25 21:06:11): <p>good to see this. great piece of
  word and calmness are more than other.</p>
* Seagrove Beach real estate (2015-06-28 07:20:09): <p>Your go up with the rio
  Negro starts throughout february or maybe drive as well as will begin for you
  to recede throughout july. Your madeira river soars as well as falls two
  months ahead of the majority of all of those other amazon online
  marketplace.</p>
* halong luxury cruise (2015-07-27 10:27:38): <p>I was very thrilled to see the
  fantastic moments of Fairfax County 4-H Fair. I congratulate each and everyone
  who have got the prizes in the fair. Fairfax has been doing such a great job
  and thus they have been encouraging the teenagers.</p>
