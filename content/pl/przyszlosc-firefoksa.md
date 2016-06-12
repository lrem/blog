+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2011-10-03T12:13:36"
draft = false
title = "Przyszłość Firefoksa"
+++
Ten wpis dłuuugo leżakował jako szkic...

![](http://mozcom-cdn.mozilla.net/img/covehead/press/background-landing.png)

Jedną trzecią cyklu wydawniczego (po ludzku: dwa tygodnie) temu [ponarzekałem
sobie na zawrotne tempo pojawiania się nowych wersji
Firefoksa](http://blog.lrem.net/2011/08/19/fox-on-fire/). Wpis ten zaskoczył
mnie dwiema rzeczami: popularnością (jak na mój blog) oraz odzewem. Otóż dwa
dni później otrzymałem maila od firmy reprezentującej Mozillę w Polsce...

Czyżbym uchodził za Bloggera przez wielkie B? :D Źródło obrazka:
[Mozilla](http://www.mozilla.org/en-US/press/).

W mailu tym pan z agencji PR zaproponował kontakt z nimi gdyby naszło mnie
kiedyś na pisanie o Mozilli. Poprosiłem więc o przekazanie kilku pytań do
_kogoś technicznego._ Uzyskanie odpowiedzi trochę potrwało... Jednak muszę
przyznać, że wrażenie z kontaktu pozytywne. Oraz pisanie tego wpisu trwało
jeszcze dłużej niż czekanie na odpowiedź ;)

Moje pytanie brzmiało tak:

> Czy planowany jest jakiś nowy system określania kompatybilności dla twórców
rozszerzeń? Wychodzące co sześć tygodni nowe wersje nie niosą już za sobą
solidnej informacji. Dla przykładu właśnie przejrzałem kilka moich ulubionych
dodatków - mają ustawioną kompatybilność na wersję dziewiątą. Co budzi pewne
wątpliwości, skoro nie weszła ona jeszcze do "kanału Aurora", więc według
intuicji (nie czytałem dokumentacji procesu, ale przypuszczam, że jest to
granica mrożenia poważnych zmian) kod nie powinien być na tyle stabilny, by
ogłaszać kompatybilność. Mniej aktywnie doglądane dodatki doprowadzają do
tego, co wynikło z komentarzy: ludzie po prostu wyłączają wszelkie sprawdzanie
kompatybilności. Co też jest mało pocieszające...

Odpowiedź zaś przyszła taka:

> Tak, eksperymentujemy z kilkoma opcjami ktore pomoga sprawic by dodatki
zaczely czuc sie normalnie w nowym modelu wydan. Miedzy innymi: \- uzytkownicy
bety/aurory mogliby moc zglaszac czy dodatki dzialaja a wyniki tego
skutkowalyby wlaczaniem ich dla uzytkownikow tej wersji gdy stanie sie ona
stabilna \- dodatki bylyby wlaczane dla nowych wydan juz od wersji aurora i
tylko jesli wiecej niz 0.5% uzytkownikow zglosi problemy z nimi zostana
wylaczone a autor powiadomiony o niekompatybilnosci \- wlaczenie testow, ktore
sprawdza czy uzytkownik z wlaczonym dodatkiem moze dostac sie do funkcji
wylaczenia go i automatyczna akceptacje wszystkich dodatkow ktore przejda ten
test i kilka innych. W kazdym razie - to dla nas bardzo wazny temat, duzo
pracy wkladamy w przebudowanie systemu tak aby dzialal w duchu Mozilli i
wygodnie dla uzytkownikow! Mozna przylaczyc sie do dyskusji na grupie newsowej
mozilla.dev.planning . Pozdrawiam Zbigniew Braniecki

Przede wszystkim: dobrze wiedzieć, że **ludzie w Mozilli dostrzegają
absurdalność aktualnej sytuacji**. I nie ograniczają się do tymczasowego
hacku, o którym możemy poczytać tutaj:

Z drugiej strony można się obawiać, co z tego wyjdzie. Tym bardziej, że
rozważane jest [skrócenie cyklu do 5
tygodni](http://www.extremetech.com/mobile/96737-mozilla-wants-to-shorten-
firefoxs-six-week-release-schedule-to-five-weeks-or-less). Nawet jeśli dobrze
wykorzystać do testowania kompatybilności potencjał ogromnej społeczności
wokół Firefoksa, gdzieś jest granica czasu który jest potrzebny. Dla mniej
popularnych dodatków, albo takich których używa się rzadziej, kilka tygodni to
może być za mało by trafić na wszystkie _corner case'y_. Acz, czy jest to
serio potrzebne?

# Komentarze

* KORraN (2011-10-03 12:23:59): <p>Hmm, ale jeżeli byś się zainteresował tematem
  to to wszystko już było w sieci napisane :&gt; Tak samo jak to, że skrócenie
  cyklu wydawniczego było tylko pomysłem, który został odrzucony.</p>
* Remigiusz 'lRem' Modrzejewski (2011-10-03 12:24:54): <p>Kiedy pisałem, to
  jeszcze nie był odrzucony. Ot, tak to jest jak się nie ma czasu :/</p>
* pecet (2011-10-03 12:47:20): <p>Używam Firefoksa 8 beta 1 i wszystko co
  działało w 7,6,5 i prawie wszystko co działało w 3.6 działa nadal, więc IMHO
  nie ma co narzekać, fakt, że trzeba sobie wymusić brak sprawdzania
  kompatybilności, ale raczej power user używający takiej ilości rozszerzeń jak
  ja to umie, a najpopularniejsze addony dla ZU typu AdblockPlus i tak są w
  miarę szybko aktualizowane.</p>
* Remigiusz 'lRem' Modrzejewski (2011-10-03 12:48:44): <p>Tak, da się to obejść.
  Ale to przecież bzdura jest.</p>
* pecet (2011-10-03 12:51:35): <p>No, zwłaszcza że jak instalowałem ze 2 dni
  temu tą betę, to nawet nightly tester tools który wymusza kompatybilność dla
  paru wersji w przód akurat tej nie przewidział, ale dopisałem co trzeba do
  about:config, z niesmakiem, ręcznie. Cóż tez mi się to nie podoba, bo te
  numerki już nic nie znaczą, ale co poradzić, Firefoks nadal jest jedyną
  sensowną przeglądarką jak dla mnie.</p>  <p>PS. właśnie mnie Lazarus (też do
  Firefoksa) uratował, bo klikłem "przestań śledzić", zamiast "wyślij komentarz"
  ;)</p>
* sprae (2011-10-03 16:30:19): <p>A czy większość tych niedziałających wtyczek
  nie jest czasem porzucona? Bo jako developer nie widzę problemu, przy dostępie
  do tak szerokiej gamy wersji testowych na naprawę sprawy lub podanie jakiegoś
  komunikatu dla użytkowników.</p>
* Remigiusz 'lRem' Modrzejewski (2011-10-03 16:31:51): <p>Wtyczka, która mnie
  ubodła w pierwszym wpisie jest jak najbardziej czynnie rozwijana. A poza tym,
  jak program robi co ma robić to po co go jeszcze "rozwijać"? A tak, po to,
  żeby co miesiąc wpisywać nowy numerek wersji...</p>
* sprae (2011-10-03 16:50:58): <p>No zobaczymy co z tego wyjdzie jak Mozilla
  weźmie na siebie testy.<br /> Bo już myślałem, że JS i XUL jest jak Perl -
  Napisz i zapomnij ;-)</p>
* Szymon (2011-10-03 17:37:54): <p>z lisami trzeba ostrożnie, nawet jeśli chce
  się pomóc: http://oglaf.com/brackenwife/1/</p>  <p>btw1, z tego co zauważyłem
  siedzisz w zacnej i szanowanej instytucji, jak dla mnie LR^2. Może mozilla
  liczy sobie lr w podobny sposób jak me ;)</p>  <p>btw2, miałem dość złośliwego
  posta wyprodukować o darcie, BEichu i fochach z nim związanych ale w między
  czasie wywaliłem konto ;p</p>
* Hoppke (2011-10-03 20:17:06): <p>Szkoda, że nie zająkują się o najprostszym (w
  sensie konceptu) rozwiązaniu -- wersjonowaniu wewnętrznych API...</p>
* kubarek (2011-10-03 21:16:41): <p>Firefox się wypalił wyraźnie :)</p>
* pecet (2011-10-03 21:27:30): <p>Nie wypalił się, nadal nie ma lepszych
  alternatyw jeśli chodzi o przeglądarki z największa możliwością dostosowania
  pod siebie, po prostu zauważyli że Chrome zbiera coraz większe peany, i
  pomysleli - cholera może dlatego że mają większy... numerek? ;)</p>
* Hoppke (2011-10-03 22:00:53): <p>Ale Chrome to akurat przeglądarka, która
  najskuteczniej chowa przed userem numerki. Na stronie pobierania Chrome
  nigdzie nie widać wersji, upgrade potrafi się też dokonać całkowicie w tle. No
  i wersjonowanie Chrome bardziej przypomina numery IP, niż coś co ma zrobić
  wrażenie na userze. Zresztą, jako user Chrome często nie mam pojęcia, której
  wersji używam :)</p>  <p>Fx za czymś goni, to widać, ale obawiam się, że
  targetem jest IE :) No cóż, mają już wywalczony udział w rynku, nie muszą się
  tak starać, mogą zajmować się pierdołami. IE spoczęło na laurach i się na tym
  przejechało, możliwe że Fx też to czeka.</p>
* http://pokerwiki.ru/blog/135436.html (2014-12-07 19:51:12): <p>La víctima
  aportó a la Guardia Civil los cargos bancarios a fin de <br /> que los agentes
  contactaran con los responsables de la única empresa que figura en los
  extractos de la entidad, de forma que descubrieron que los servicios habían
  sido abonados a una empresa de gestión de líneas eróticas, con números de
  teléfono de tarificación especial <br /> y efectuados entre el veinte de junio
  y el 7 de julio pasados.</p>
