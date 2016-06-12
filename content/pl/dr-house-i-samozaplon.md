+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-07-31T21:21:43"
draft = false
title = "Dr House i samozapłon"
+++
Ostatnio mam wakacje. Objawia się to między innymi tym, że oglądam _serial_.
Pierwszy raz od siedmiu lat, ale to nadal nic interesującego. Interesujące
jest to, że z tej okazji najnowsze Łubudubu zafundowało mi lekkie oparzenie
palców. I pewnie mało brakowało do poważnego uszkodzenia laptopa...

Oglądam sobie na przerośniętym telewizorze podłączonym do netbooka. Układ
wydawałoby się idealny, ale Windows nie wiedzieć czemu nie oferuje ani jednej
rozdzielczości w formacie 16:9. Stąd nie mam wyboru - muszę oglądać pod
Łubudubu.

Niby nie powinno to sprawiać problemu - system ten służy mi także do każdego
innego celu. Jednak przy oglądaniu filmów na zewnętrznym monitorze, nie
wiedzieć czemu, raz na jakiś czas wyłącza sobie monitor. Ot tak, po prostu,
pyk i czarno. Pomaga _gdm restart_, ale oznacza to, że trzeba wstać z kanapy i
przejść cały pokój. Niestety zmiana ustawień oszczędzania energii nic nie dała
- nadal wyłącza. Wszelkie pomysły mile widziane.

Ale to, co mnie serio skłoniło do napisania tego posta, to największy przykład
debilizmu jaki spotkałem w Linuksie. Wyglądało to tak: wstaję, pstryk w power
(powoduje hibernację), klap, do pokrowca i do plecaka. Laptop się nie przydał,
więc tylko pojechał na kilkugodzinną wycieczkę dookoła miasta. Jak go z
plecaka wyciągałem, miał co najmniej 50 stopni.

Jak się okazało, na pulpicie obok miałem spauzowane _vlc_. A przy domyślnych
utawieniach _policy_ Ubuntu odmówi zatrzymania systemu jeśli gdzieś wisi jakiś
odtwarzacz. No i niech mi ktoś to wytłumaczy... Czemu nie mogę wyłączyć
systemu w dowolnym momencie? Co komu szkodziło to, że można było sobie zrobić
przerwę bez wyłączania odtwarzacza? I czemu to w ogóle reaguje na odtwarzacz w
długotrwałej pauzie?

# Komentarze

* lukasz (2009-07-31 21:45:55): <p>a co ma z tym wspólnego dr house?</p>
* Wstrętny anonim (2009-07-31 22:09:31): <p>Najprawdopodobniej VLC blokuje
  możliwość wstrzymywania. Słowa kluczowe: inhibit, gnome-power-manager. Jeśli
  tak, zażalenia należy skierować do autorów VLC, żeby przestawało blokować
  podczas pauzy. A tak w ogóle, to PEBKAC.</p>
* Remigiusz 'lRem' Modrzejewski (2009-07-31 22:25:41): <p>Nah, to powinno się
  dać ustawić, acz jest to debilny default. Miałem raczej nadzieję na pomysł co
  do pierwszego problemu... <br /> <br />A Dr House ma z tym tyle wspólnego, że
  dzięki oglądaniu tego serialu dostrzegłem te problemy.</p>
* Remigiusz 'lRem' Modrzejewski (2009-07-31 22:31:28): <p>Na szybko wyszukałem
  dwie rzeczy: <br /> <br />1) Można to wyklikać w ustawieniach VLC. <br /> <br
  />2) To chyba w ogóle jest błąd? Powinni używać gnome-screensaver inhibit
  zamiast gnome-power-manager inhibit? <br /> <br />Tak czy owak jak ktoś o tym
  nie wiedział wcześniej, to może sobie zafundować niespodziankę...</p>
* Remigiusz 'lRem' Modrzejewski (2009-08-01 00:55:12): <p>To całe ,,pyk i
  czarno'' to wygaszacz ekranu. Co ciekawe nie włączał się regularnie po
  ustawionych 10 minutach - czasami nawet cały odcinek udało się obejrzeć bez
  zgaśnięcia monitora. Za to teraz (po wyłączeniu wygaszacza) zdarzyło się ,,pyk
  i brązowo''. Ciekawe co dalej... <br /> <br />Ech. Dopóki nie spróbowałem
  filmów, to całe to Łubudubu wydawało się działać idealnie :/</p>
* zdz (2009-08-03 07:52:56): <p>To wygląda jak splot nieszczęść. Z jednej strony
  błędna obsługa Inhibit w VLC. Totem, instalowany domyślnie w Ubuntu, robi to
  prawidłowo, włącznie z uninhibit w czasie pauzy. <br />Z drugiej strony GNOME
  Power Manager jeśli nie może dokonać zaplanowanego uśpienia odgrywa sygnał
  dźwiękowy ostrzegający użytkownika. Może miałeś ściszone? <br />I trzecia
  sprawa, laptop, który ma problem z wentylacją przy zamkniętej klapce... broken
  by design?</p>
* lRem (2009-08-03 13:07:46): <p>Dźwięk raczej miałem włączony, oglądałem film.
  Poza tym prawie wszystkie ustawienia na tym laptopie są domyślne z Ubuntu. <br
  /> <br />A co do problemu z wentylacją... Chcesz sprawdzić co się stanie z
  Twoim laptopem po trzech godzinach działania na słońcu, w ciasnym pokrowcu i
  ciemnym plecaku? ;)</p>
