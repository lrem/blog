+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-03-16T01:05:06"
draft = false
title = "Dr Richard Hipp w Polsce"
+++
Używałeś kiedyś [Traca](http://trac.edgewall.org/)? Albo może
[CVSTraca](http://www.cvstrac.org/)? Ten drugi stał się źródłem inspiracji dla
wszystkich dzisiejszych narzędzi opartych na koncepcie _Timeline_. Jeśli do
tej pory odpowiadałeś przecząco, to z twórczością [Dr Richarda
Hippa](http://en.wikipedia.org/wiki/D._Richard_Hipp) miałeś kontakt dzięki
bazie [SQLite](http://sqlite.org/). Autor tego RDBMS o **największej liczbie
wdrożeń na świecie** odwiedził w tym tygodniu Polskę. Wykładał o tworzeniu
niezawodnego oprogramowania na politechnikach w Gdańsku i Wrocławiu.

[![Dr Richard Hipp i Remigiusz Modrzejewski](http://sphere.pl/~lrem/hipp.jpg)]
(http://sphere.pl/~lrem/hipp1200.jpg) (Dr Richard Hipp i Remigiusz
Modrzejewski, wejście do gmachu głównego PG)

Najpierw był wykład. Dr Hipp tłumaczył przepełnionemu audytorium na czym
polega tworzenie niezawodnego oprogramowania. Wyszedł od wymagań [procesu
DO-178B](http://en.wikipedia.org/wiki/DO-178B) obowiązującego w tworzeniu
oprogramowania dla lotnictwa. Sprowadza się on do pisania tomiszcz
dokumentacji, spod których ledwie widać kod programu. Następnie zaś
przedstawiał swoje pomysły _**jak uzyskać 90% efektu przy 10% wysiłku**_. Ich
treść postaram się przybliżyć w następnych wpisach.

Dobre kilka minut wykładu poświęcił na tłumaczenie czemu jakość SQLite jest
tak ważna. Jak się okazuje - **ta baza jest wszędzie**. Zaszyto ją w wielu
programach, jak choćby Amarok, Gajim, Skype czy Photoshop. Jest jedyną bazą w
pełni zawartą w standardowych implementacjach niektórych języków skryptowych
(PHP, Tcl, chyba Python). Solaris bez SQLite w ogóle nie byłby w stanie
bootować. Zaś jeśli w ogóle nie używasz komputerów, to i tak masz ją w
telefonie na którym czytasz ten post (na pewno występuje w Symbianie, WebOS-
ie, Windows Mobile i iPhone'ie).

Następnie Tomek Kosiak zorganizował spotkanie w trochę bardziej kameralnym
gronie w [siedzibie swojej firmy](http://www.dacsystem.pl/). Najciekawszym
tematem tam poruszanym był [Fossil](http://fossil-scm.org/) \- następny krok w
zarządzaniu projektem. Jest on dla Traca tym, czym git dla svn. Wprowadza
bowiem nie tylko rozproszoną kontrolę wersji, lecz również **rozproszone
wiki** i **rozproszoną bugzillę**! Projekt wciąż jest mocno rozwijany, jednak
już teraz warto przyjrzeć mu się z bliska (główne braki to niemożność łatwej
migracji z innych systemów).

Spotkanie skończyło się spacerkiem już w cztery osoby. Największe wrażenie na
widowni wywarła ilość testów jaka składa się na niezawodność SQLite.
Największe wrażenie na wykładowcy wywarła ilość pracy, jaką poświęcono na
budowę kościoła Mariackiego.

![mgr Tomasz Kosiak i Dr Richard Hipp](http://sphere.pl/~lrem/neptun.jpg) (mgr
Tomasz Kosiak i Dr Richard Hipp, fontanna Neptuna)

# Komentarze

* Zal (2009-03-16 01:09:16): <p>Focia lepsza, niż moje polowanie na Stallmana :D
  Zaczynam żałować, że sam na wykład nie wpadłem. <br /> <br />Co do reszty -
  dzięki za info o Fossil. Nie interesowałem się do tej pory tą tematyką, ale
  wygląda, iż takie braki wiedzy należy szybko uzupełnić.</p>
* Remigiusz 'lRem' Modrzejewski (2009-03-16 01:16:40): <p>W ogóle czym jeszcze
  imponuje Hipp - skromnością. Gdyby nie uwaga Tomasza, pewnie większość osób
  nie zorientowała się, że to on jest autorem CVSTraca. Przy rozmowie totalne
  zero ewangelizacji... No i mówił wprost, że jest otwarty na pomysły, chętnie
  przyjmie dowolne ulepszenia do fossila... I nie ma nic przeciwko, gdyby komuś
  się chciało portować jego kod do gita (choć przeniesienie wiki i bugzilli
  zabiłoby na miejscu jego projekt).</p>
* radmen (2009-03-16 07:58:13): <p>O, a ja myślałem że to dopiero będzie. Jakoś
  zauważyłem komunikat w weekend i nie spojrzałem na datę. Szkoda, że tak późno
  się dowiedziałem, w sumie bym się wybrał.</p>
* mentos (2009-03-16 09:00:23): <p>Następnym razem jak będziesz wiedział
  wcześniej o takim wykładzie to uprzedź szybciej, że jest;)</p>
* Remigiusz 'lRem' Modrzejewski (2009-03-16 09:02:57): <p>Uprzedzę. Ale teraz to
  było jakoś tak zabójczo szybko - informacja się pojawiła chyba na dwa dni
  przed wykładem. A nie były to zbyt luźne dni :/</p>
* tkosiak (2009-03-16 09:24:09): <p>Wykład był nagrywany kamerą - właśnie z
  myślą o tych co nie mogli lub nie zorientowali się, że warto przyjść. Jak
  będzie już gotowy do obejrzenia to dam znać gdzie go znaleźć. Wiem, że slide-y
  wziął Pan Goczyła - myślę, że mogą zostać one wykorzystane na jakichś
  wykładach o tworzeniu niezawodnego oprogramowania na WETI.</p>
* elwis (2009-03-16 09:29:21): <p>ja niestety wówczas miałem WF :(</p>
* lRem (2009-03-16 12:26:15): <p>Nawet dwoma kamerami obsługiwanymi przez
  wykładowców z katedry multimediów ;)</p>
* kselos (2009-03-27 13:49:37): <p>Jak by ktoś chciał to zdjęcia, slajdy i opis
  tego co się działo we Wrocławiu na wykładzie Hippa zamieściłem dokładnie tu:
  http://linuxacademy.pl/wiki/An_Introduction_To_SQLite. <br /> <br />Niestety
  mieliśmy lekko za mało czasu żeby zorganizować jakieś podcasty. <br /> <br
  />Pozdrawiam. <br />P.S. Dzięki za info że w sprawie przyjazdu Hippa. Jak
  będziecie mieć jeszcze coś podobnego dajcie znać. Ze swojej strony powiem na
  razie tyle że 9-10 maja 2009. Kolejna VI Sesja Linuksowa we Wrocławiu. Więcej
  info niebawem m.in. na www.linuxacademy.pl/</p>
* Remigiusz 'lRem' Modrzejewski (2009-03-27 14:16:03): <p>O, to widzę, że u Was
  mówił na inny temat. A co do Sesji Linuksowej... Jakoś nie wierzę w dużą
  popularność wyjazdu 450km na taką imprezę :/</p>
