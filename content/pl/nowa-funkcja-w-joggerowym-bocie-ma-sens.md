+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-05-22T14:31:44"
draft = false
title = "Nowa funkcja w Joggerowym bocie, ma sens?"
+++
Po ostatnim wpisie miałem okazję porozmawiać chwilę z D4rkym o rozwoju
Joggera. Przedstawiłem swój pomysł który ma rozwiązać jedną z moich bolączek,
on zaś delikatnie mówiąc nie zgodził się co do jego użyteczności. Chciałbym
więc dowiedzieć się, czy to rzeczywiście byłby _hack na którym skorzystałoby 3
userów_. Wszelkie opinie mile widziane, w tym ograniczające się do
_super/spadaj_.

### Problem

Jak wszyscy wiemy, jogger powiadamia o komentarzach wysyłając linijkę typu:

> Jogger: Do Twojego joggera został dodany komentarz
http://blog.lrem.net/2010/05/22/wpadka-joggera/ (#472770)

Aby odpowiedzieć na dany komentarz trzeba zawrzeć w swojej wiadomości id

Irytuje _mnie_ w niej długość tego id. Przepisanie #472770 wymaga tyle uwagi,
że nie ma co się w to bawić bez kopiuj-wklej. _Ja_ jednak nie lubię odrywać
rąk od klawiatury...

### Rozwiązanie

Proponuję dodać możliwość odpowiedzi korzystając z _id tymczasowego_. Aby
odróżnić je od właściwego, trzeba by zapisać je za pomocą literek, o tak:

> Jogger: Do Twojego joggera został dodany komentarz
http://blog.lrem.net/2010/05/22/wpadka-joggera/ (#472770 / #ce)

Id tymczasowe przypisywane byłoby dla każdego użytkownika indywidualnie do
każdego wątku w którym się udziela. Licząc na szybko nigdy nie byłoby potrzeba
więcej niż **2 literek**.

#### Wady

D4rky wskazał trzy problemy z moim pomysłem:

  1. Jeśli ktoś zagląda na Jabbera raczej rzadko, może się okazać, że ważność tymczasowego id wygasła. Bot może wtedy odpowiedzieć wiadomością o tym, że to id jest już nieczynne i trzeba powtórzyć z pełnym numerkiem.
  2. ,,Łatwo zrobić literówkę''. Cóż, święta racja. Nie jestem w stanie z tym dyskutować.
  3. Takich drobnostek jest w Joggerze już za dużo i tylko burdel robią. To niestety jest odwieczny problem w inżynierii oprogramowania, sądzę jendak, że _przynajmniej dla mnie_ ilość wprowadzanego tutaj burdelu jest mniejsza od użyteczności ;)

#### Tymczasowe id

Żeby to miało sens, ważne jest wybranie dobrej metody nadawania tych id i ich
ważności. Można ograniczyć to według ilości dni, można też pamiętać je na
stałe, ograniczając maksymalną liczbę i przy zapisywaniu nowego nadpisując
najstarsze. Jeśli ograniczy się według ilości dni można albo używać ponownie
starych numerów (co wiąże się z ryzykiem skomentowania nie tego wpisu), albo
pozwolić na rozrastanie się id w coraz to więcej liter.

Niezależnie od wybranej wyżej metody maksymalna liczba śledzonych id
wykorzystując daną liczbę liter to:

Liczba liter | Liczba wpisów  
---|---  
1 | 26  
2 | 676  
3 | 17576  
  
Tak więc zakładając trzyliterowe id problem zbyt wielu śledzonych wpisów staje
się raczej teoretyczny... Liczba śledzonych wpisów musi być jednak
ograniczona, gdyż każdy taki wpis to kolejny niewielki wiersz w bazie danych.

#### Inercja użytkowników - konfiguracja

Pojawiła się też sugestia, że od liczby użytkowników zadowolonych z tego
rozwiązania większa mogłaby być liczba użytkowników którzy poczuliby się
zaskoczeni, zagubieni i uciekli z krzykiem. Dlatego też sugerowałem możliwość
włączenia tego w panelu, z domyślnym wyłączonym. Można by też wtedy
konfigurować ilość liter w tymczasowym id.

### Rozwiązanie alternatywne

Innym rozwiązaniem, niewątpliwie prostszym ze wszystkich stron, jest po prostu
przedstawianie pełnego numeru w Base26. Z jednej strony ,,chcialoby ci sie
przpisywac #aFczOIFd?''. Z drugiej jednak ,,idki i tak najczesciej ludzie
kopiuja''. Do tego wspomniane #472770 w Base26 to raptem #ZWIL (acz za jakieś
50000 wpisów przeszlibyśmy na pięcioliterowe).

# Komentarze

* Polinik (2010-05-22 15:07:58): <p>IMO: Zbędne. Wychodzi na to, że Tobie ciężko
  przepisać 7 znaków, więc wymagasz, żeby inna osoba napisała ich parę tysięcy
  -- programując nową funkcjonalność.<br />  <br />  Poza tym -- wygląda mi to
  na metodę TeleShopów typu Mango -- kreujesz duży problem z drobnej niewygody.
  :)</p>
* Remigiusz 'lRem' Modrzejewski (2010-05-22 15:16:00): <p>Zapomniałem dodać:
  zaoferowałem się, że sam te znaki napiszę. I jest to oferta poważna, mam
  doświadczenie z pisaniem botów do Jabbera w Perlu (Joggerowy jest w tym
  napisany).</p>
* Draakhan (2010-05-22 15:16:44): <p>Zgadzam się z tym, że jest to zbędne.
  Przepisanie 6 znaków zamiast 3 - rzeczywiście straszny problem...</p>
* q84_fH (2010-05-22 15:31:47): <p>Obczai sobie plugin jogger w ekg2 i zacznij
  używać ekg2, albo dopisz coś podobnego do swojego-ulubionego klienta.<br />
  <br />  IMO d4 ma rację.</p>
* Łukasz (2010-05-22 15:39:30): <p>Joggerowi/botowi przydałoby się kilka innych
  zmian niż takie bzdety, poza tym czasowy ID dla każdego użytkownika który
  odbiera go przez bota... Ok, tylko że przy kilku tysiącach (zakładam że tyle
  komentarzy wysyła bot) tymczasowy ID byłby tak samo długi jak ID właściwy,
  przecież kiedyś pula krótkich &quot;abc&quot; musi się wyczerpać.<br />  <br
  />  Obecna forma jest wystarczająca... 90% kopiuj/wklej nie przeszkadza ;)<br
  />  <br />  Prędzej możnaby napisać wtyczkę dla np. pidgina który zamieni ID
  na aktywny link wysyłający ID do pola odpowiedzi.</p>
* matekm (2010-05-22 15:52:13): <p>skoro Irem zaoferował się, że taką
  funkcjonalność napisze, to niech pisze!:) Coś się przynajmniej ruszy.</p>
* Remigiusz 'lRem' Modrzejewski (2010-05-22 15:53:14): <p>@Łukasz:<br />  Co by
  się bardziej przydało botowi? No i przegapiłeś widać tabelkę, w której
  podałem, że trzyliterowe skróty starczą na siedemnaście tysięcy wątków. W moim
  przypadku (max kilkanaście wątków w tygodniu) wystarczyłyby skróty
  jednoliterowe.</p>
* BTM (2010-05-22 16:22:48): <p>Nie ma sprawy, na pewno zaraz jakiś admin,
  zajmujący się na co dzień rozwojem Joggera żuci okiem i dopisze przed końcem
  weekendu؟</p>
* Hoppke (2010-05-22 16:26:45): <p>Prawdę mówiąc, to chętniej bym zobaczył coś,
  co przekształca strumień komentarzy w coś w stylu rozmowy -- jogger mógłby np.
  dynamicznie &quot;tworzyć&quot; wyspecjalizowane JID-y dla każdego wpisu,
  przez co komentarze do różnych wpisów by się nie mieszały, a przepisywanie ID
  byłoby w ogóle niepotrzebne (bo JID pełniłby rolę ID). Wyglądałoby to trochę
  jak osobne chaty biegające sobie równolegle. Ale to też dość niszowa
  zachcianka :)</p>
* D4rky (2010-05-22 16:27:54): <p>Problem polega na tym, że lRem nie jest w
  stanie tego napisać z powodów technicznych, które chyba przeoczył podczas
  rozmowy ;)</p>
* Remigiusz 'lRem' Modrzejewski (2010-05-22 16:28:52): <p>Trzecia myśl: można by
  nadawać unikalne literkowe ID każdemu wpisowi, ale zaczynając od nowych wpisów
  (dotychczasowe byłyby dostępne tylko po numerkach). W ten sposób przy
  aktualnym przeciętnym tempie (~2500 wpisów miesięcznie, średnia z 3 miesięcy)
  przez ponad pół roku mielibyśmy id trzyliterowe, a czteroliterowe przez
  lata...</p>
* D4rky (2010-05-22 16:30:34): <p>lRem - czyli zmieniać przyzwyczajenia
  użytkowników i dodawać dodatkowy, jeszcze bardziej skomplikowany, bo oparty o
  litery system identyfikacji wpisów, żeby obciąć dwa znakii. Makes perfect
  sense ;)<br /> Mówiłem ci już, że się to nie przyjmie i widzę, że się dużo nie
  myliłem. Botowi potrzebna jest całkowita zmiana podejścia i sposobu
  komentowania, a nie drobne hacki.</p>
* Łukasz (2010-05-22 16:31:49): <p>Na pierwszym miejscu odpuściłbym taką
  formę:<br /> &quot;Pojawił się nowy komentarz do wpisu
  http://blog.lrem.net/2010/05/22/nowa-funkcja-w-joggerowym-bocie-ma-sens/
  (#472780)&quot;<br /> Każdy doskonale wie co przychodzi od bota, ważna jest
  szybka informacja co konkretnie, np. <br /> &quot;Irem / nowa-funkcja-w-
  joggerowym-bocie-ma-sens (#472780)&quot; <br /> Mogłoby to być nawet w formie
  linku. Sam #ID żeby go wyróżnić mógłby być pogrubiony. <br /> Przeczyłem
  tabelkę, jednak pomyślałem zupełnie o czymś innym.... Nie ważne.<br /> <br />
  Nowa funkcja... Kreator wpisu oparty na sesji po jego rozpoczęciu... Żeby po
  wysłaniu wiadomości nie dodawał się nowy wpis, a rozpoczynał proces jego
  tworzenia. Bot wysyłał by wiadomość z informacją że można wpisać: <br /> <br
  /> Tytuł wpisu &gt; piszemy, wciskamy enter &gt; bot odpowiada że można wpisać
  treść, piszemy wciskamy enter i po sprawie... podczas pisania wpisu byłaby
  opcja dodania zdjęcia #img(opcjonalny_styl_css)(adres.pl/dofotki.png) czy
  linku na tej samej zasadzie. Tak, wiem że jest możliwość dodawania wpisów
  przez bota, jednak to nie do końca to.<br /> <br /> Prawda jest taka nie ma tu
  za dużo opcji do ulepszenia, wiele byłoby trzeba pozmieniać w samym joggerze
  żeby później zabrać się za bota.<br /> <br /> I zadam pytanie raz jeszcze
  skoro jesteśmy w temacie, bo w innym wpisie o podobnej tematyce nikt mi nie
  odpowiedział. W jakim języku napisany jest jogger i bot ?</p>
* Hoppke (2010-05-22 16:33:54): <p>Zgaduję, że php i perl?</p>
* D4rky (2010-05-22 16:34:11): <p>Łukasz, <br /> ad 1)
  https://login.jogger.pl/templates/constants/ :)<br /> ad 2) bota to by trzeba
  od zera chyba przepisać ;)<br /> ad 3) PHP dla Joggera, Perl+PHP dla bota, co
  by nie dublować kodu.</p>
* Łukasz (2010-05-22 16:43:10): <p>D4rky - odpalcie jakąś stronę z propozycjami
  które można by wprowadzić, każdy z użytkowników mógłby coś tam napisać.
  Oczywiście bez komentarzy i oceniania. Później zebrać grupę kilku ludzi którzy
  wybiorą co ciekawsze propozycje, następnie przedyskutować i napisać,
  jednocześnie je wprowadzając. Na joggerze jest kilka osób które zajmują się
  php/perlem. <br /> <br /> Oczywiście nikt z zacięciem maniaka nie będzie tego
  pisał całymi dniami, bo mu za to nie płacą, ale myślę że spokojnie można by to
  zrealizować.</p>
* D4rky (2010-05-22 17:34:26): <p>Łukasz, a ile jest osób, które faktycznie będą
  chciały coś robić, a nie tylko gadać?</p>
* matekm (2010-05-22 17:40:59): <p>myślę, że biorą pod uwagę ile technicznych
  osób jest na joggerze co najmniej kilka robotników by się znalazło.<br />  <br
  />  A może to czas, żeby otworzyć projekt? Bo na chwilę obecną rozwój stoi w
  miejscu.</p>
* BTM (2010-05-22 17:42:40): <p>&gt; A może to czas, żeby otworzyć projekt? Bo
  na chwilę obecną rozwój stoi w miejscu.<br />  <br />  This. To jedyne co ma
  sens. Zakładając, że poziom kodu jest przyzwoity.<br />  <br />  Wrzucenie
  kodu na np. Github, danie możliwości pobrania kodu ludowi - niech pisze swoje
  poprawki i jakiś &quot;zarząd&quot; niech wprowadza je do głównego drzewa
  Joggera.</p>
* Łukasz (2010-05-22 17:44:49): <p>Od razu powstaną klony, jęczenie że nie
  wiadomo co, gdzie i na jaki serwer iść/zostać/usunąć ... skopiują, ulepszą i
  jogger.pl upadnie, bo zostanie lepszy jogger.org ;)</p>
* matekm (2010-05-22 17:46:31): <p>można bawić się we wróżkę lub wziąć się do
  roboty - ja jestem za tym drugim. A jak powstaną lepsze klony - to chyba tym
  lepiej dla użytkowników.</p>
* BTM (2010-05-22 17:46:32): <p>Reddit udostępnia darmowo kod oraz całe obrazy
  VM z działającym środowiskiem, Digg ma jakieś darmowe odpowiedniki -
  widziałeś, żeby coś ich przebiło? <br />  <br />  Jeżeli komuś się na prawdę
  będzie chciało zrobić z kodem Joggera coś lepszego od Jogger.pl, to znaczy, że
  tak musiało być. A tak na prawdę to większość osób i tak nic nie zrobi.</p>
* Łukasz (2010-05-22 17:48:44): <p>Możliwe, ja tam zwolennikiem os nie jestem ;)
  w każdym bądź razie pisałbym się na napisanie czegoś do joggera jakby były
  jakieś konkretne wytyczne odnośnie funkcji i kierunku rozwoju.</p>
* BTM (2010-05-22 17:49:31): <p>@Łukasz: też nie jestem zwolennikiem OS jako
  jedynej słusznej drogi - ale w tym wypadku wyglądała by na przydatną. No ale z
  tego co wiem, to kod Joggera piękny nie jest ;)</p>
* Remigiusz 'lRem' Modrzejewski (2010-05-22 17:54:00): <p>Z tego co wiem, to
  jeśli komuś by się chciało coś podobnego tworzyć, to chyba łatwiej dodać do
  jakiegoś WP obsługę XMPP. Jogger to przede wszystkim społeczność.</p>
* Łukasz (2010-05-22 18:06:15): <p>Społeczność która upada... Większość osób
  która podtrzymywała główną/techblog na poziomie przeniosła się na inne
  platformy, ewentualnie mają tutaj swoje uboższe odpowiedniki.</p>
* D4rky (2010-05-22 18:11:36): <p>W chwili obecnej kod się nie nadaje do release
  z bardzo, bardzo wielu powodów. Ale nie miałbym nic przeciwko rozpoczęciu
  pisania od nowa przy otwartym modelu dostępu do kodu i źródle na jakiejś
  licencji typu GPL lub nawet BSD.</p>
* skkf (2010-05-22 18:16:55): <p>Bez sensu. Zainwestuj w komunikator, który
  kopiuje tekst po zaznaczeniu go. Taka operacja zajmuje mniej niż sekundę. Ale
  wiem, że dla niektórych to potworny wysiłek.</p>
* Remigiusz 'lRem' Modrzejewski (2010-05-22 21:16:18): <p>Pozostaje więc się
  zapytać czemu upada. Ale to nie temat dla mnie, za słaby jestem w te
  klocki.</p>
