+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-04-05T10:57:31"
draft = false
title = "KDE vs Gnome: wiele kodowań"
+++
Od jakiegoś czasu znowu używam Ubuntu na laptopie. Ma ono sporo zalet, które
zapewne wszyscy znają. Jednak są rzeczy, których po prostu w tym Gnomie zrobić
nie potrafię. Jedną z nich jest poprawna obsługa mojego środowiska o
mieszanych kodowaniach. Co dla odmiany bez problemu otrzymuję w KDE...

Moje środowisko pracy składa się z kilkunastu serwerów, z którymi się łączę
przez SSH. Niestety na części z nich panuje jeszcze kodowanie ISO-8859-2, na
większości pozostałych UTF-8. Rzeczą niezbędną jest możliwość przełączania
sobie kodowania w terminalu. [Gnome-
terminal](http://en.wikipedia.org/wiki/Gnome-terminal) takiej możliwości nie
daje, albo ja nie umiem jej znaleźć. Pod
[Konsole](http://en.wikipedia.org/wiki/Konsole) jest to prosta sprawa
kliknięcia _Settings->Encoding_. Ba, można sobie kliknąć w _Settings->Save
profile_, a potem w _menu editorze_ przypisać pod wygodną kombinację komendę:
`LC_ALL="pl_PL" konsole --profile ISO`

I proszę, mamy jednoklikowy terminal ISO-wy.

Ale to co mnie najbardziej w tej kwestii zdziwiło, to
[gedit](http://en.wikipedia.org/wiki/Gedit). Żeby w edytorze tekstu nie dało
się poprawnie załadować pliku w innym niż systemowe kodowaniu? Czy serio
przyjazność Gnome'a, dbanie o to by użytkownik nie pogubił się od nadmiaru
opcji, wymaga od niego ręcznego babrania się z
[iconv](http://en.wikipedia.org/wiki/Iconv)?!

# Komentarze

* Piotr Pyclik (2009-04-05 11:14:19): <p>A w GNOME Terminal to nie jest Termina
  -&gt; Set Character Encoding?</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-05 11:16:44): <p>LOL, owszem, jest coś
  takiego. Z przyzwyczajenia jestem bez menubara, w KDE da się dojść do jego
  funkcjonalności prawoklikiem na terminal. Tutaj tylko profile można tak
  wybierać...</p>
* Piotr Pyclik (2009-04-05 11:18:10): <p>No nie wiem, mi to nigdy nie było
  potrzebne, a mimo to szybko znalazłem. ;)</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-05 11:20:45): <p>No i cóż, w KDE
  jednoklik, a tutaj jednak trochę machania myszą jest... To może w gedicie też
  coś przegapiłem?</p>
* Kudi (2009-04-05 11:24:39): <p>a w gedicie w oknie wyboru pliku do wczytania
  na dole masz pasek z wyborem kodowania i tam tez jest opcja dodawania/usuwania
  kodowan z listy.</p>
* Badzok (2009-04-05 11:52:03): <p>ja jakos preferuje poczciwego gnoma :)</p>
* Brzuś (2009-04-05 13:46:59): <p>Przecież możesz sobie ustawić oddzielne
  profile w Terminalu i prawoklik-&gt;profile-&gt;i_tu_wybierasz_profil, a w
  gedicie jak nie umie otworzyć pliku bo ma inne kodowanie niż utf to wybierasz
  z rozwijanego menu odpowiednie kodowanie (jest pod tym komunikatem o
  niemożności otwarcia)</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-05 14:00:09): <p>On umie otworzyć,
  tylko krzakami wali zamiast literek... A profile niestety kodowania nie
  zawierają.</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-05 14:23:46): <p>A no i w sumie
  wychodzi na to, że jednak wszędzie da się to ustawić. Tylko trzeba się trochę
  więcej naklikać.</p>
* sziwan (2009-04-14 14:36:31): <p>Podchodzisz od d… strony. Charset, czy
  ogólniej locale, nie powinny być w tym wypadku cechą hosta („panuje
  iso8859-2”) tylko sesji, czy ściślej terminala (w rozumieniu komputera przy
  którym siedzisz). Locale powinny być ustawione tylko tam, a każdy zdalny host
  powinien dziedziczyć locale sesji przez zmienne środowiskowe.</p>
* Piotr Kochanek (2009-04-19 19:13:00): <p>A mnie w GNOME zastanawia brak
  możliwości ustawienia wyświetlania potwierdzenia o przeniesienie plików do
  kosza. Tzn, po wybraniu plików i wciśnięciu &lt;Del&gt; pliki zostają
  natychmiast przeniesione bez pytania (co czasem może być troche wkurzające). Z
  tego co wiem, da się włączyć potwierdzenia tylko przy usuwaniu plików. Może
  czegoś nie wiem?</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-21 00:21:05): <p>Szukałeś czy opcji
  takiej nie daje gconf-editor? Takie paskudstwo na wzór regedita, ale pozwala
  ustawić kilka rzeczy do których nie ma dojścia w normalniejszych
  interfejsach.</p>
