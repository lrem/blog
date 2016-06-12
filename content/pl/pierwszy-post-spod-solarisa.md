+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2008-05-30T23:40:45"
draft = false
title = "Pierwszy post spod Solarisa"
+++
Nadszedl najwyzszy czas sie przemoc i zabrac za Solarisa. I to cos wiecej niz
_wszystko zdechlo po instalacji VMWare tools_, czy tez _niby dziala, ide
spac_. Mimo poprzednich, nienajlepszych, doswiadczen nie zrazam sie do tego
systemu. Chocby dlatego, ze moja praca na GSoC wymaga jego uzycia... W kazdym
razie opisze chwilke perypetii _Solarisowego nooba w podejsciu n-tym_.

Na cale moje szczescie Sun wypuscil w miedzyczasie nowa wersje OpenSolarisa o
wdziecznej nazwie Indiana. Jest ona z zalozenia znacznie bardziej _ludzka_ od
poprzednich. Widac to jeszcze przed sciagnieciem - zamiast meczenia sie przez
kolejne ekrany rejestracji i czytania licencji, na stronie Indiany jest jeden
wielki przycisk dajacy nam od razu obraz _.iso_. Kolejna roznica to instalacja
- 38 minut kopiowania na dysk, zamiast kilku godzin jak ostatnio.

Dalej jednak nie jest juz tak rozowo. Przede wszystkim przez Polski uklad
klawiatury rozumiany jest tu **uklad maszynistki**. Jeszcze nie wygooglalem
jak to zmienic, dlatego tez ten post jest bez naszych znakow diaktrycznych.
Poza tym Gnome wyglada jak wszedzie (nie lubie), z tym domyslnym bezsensownym
bialym tlem terminala. Jednak w samym terminalu znaczna czesc klawiatury nie
chce wspolpracowac, chocby przyciski _home_ czy _end_. Co wiecej, w ogole
**nie dziala kolko myszki**, czego juz od lat nie widzialem.

Jedna rzecz mnie jednak calkiem rozlozyla na lopatki. Otoz system domyslnie
konfiguruje interfejsy za pomoca DHCP. Jednak robi to **bez DNS**. Zeby bylo
weselej, reczne stworzenie _/etc/resolv.conf_ tez nie pomaga. Konieczne jest
dodanie wpisu:

    
    
    lrem@indy:~$ grep dns /etc/nsswitch.conf
    hosts:      files dns
    

By moc cieszyc sie:

    
    
    lrem@indy:~$ ping wp.pl
    wp.pl is alive
    

(By zobaczyc statystyki do ktorych przyzwyczaily nas inne implementacje,
trzeba uzyc przelacznika _-s_.)  
Ja wierze, ze sa powazne powody, by utrzymac to jako konfigurowalne. Ale niech
mi ktos wytlumaczy, czemu nie ustawic domyslnie _dla biurka_ odpytywania DNS-
ow o nazwy hostow?

# Komentarze

* Zal (2008-05-30 23:45:14): <p>Ja również babrałem się z OpenSolarisem kilka
  dni temu. W moim jednak przypadku zabawa zakończyła się po 30 minutach po
  instalacji pod VMware. Tuż po tym, jak uświadomiłem sobie, że na biurko to się
  nie nadaje - chyba, że użytkownik dysponuje sporymi zasobami wolnego czasu
  ;]</p>
* Remigiusz 'lRem' Modrzejewski (2008-05-30 23:50:04): <p>Wiesz, za poprzednim
  razem też skończyłem po 30 minutach. Twardym zwisem. Rozpieprzył mi chyba
  sterowniki karty graficznej hosta...</p>
* coft (2008-05-31 22:14:45): <p>Jeżeli chciałbyś zobaczyć dziesiątki nie
  działających rolek od myszki zapraszam do sal laboratoryjnych wydziału
  informatyki politechniki szczecińskiej.</p>
* lRem (2008-05-31 22:16:34): <p>Systemy nie ruszane od lat?</p>
* coft (2008-06-01 09:49:37): <p>Nie jest taki stary, uname -v <br />#4 SMP Fri
  Feb 18 13:28:43 CET 2005 <br /> <br />Administratorzy wyznają zasadę: Im
  ciężej coś użytkownikowi zrobić, tym mniej awarii nam zgłosi.</p>
* trochej (2008-06-01 14:20:14): <p>Niestety, wszystkie odmiany (Open)Solarisa
  działają bardzo wolno pod VMware i VirtualBoksem. Na żywo jest znacznie
  lepiej. Błąd a propos ukłądu maszynistki zgłosiłem i być może już w następnej
  wersji będzie domyślnie obłożenie programisty. Klawiaturę polską programisty
  można wyklikać tak, tylko trzeba sobie wygenerować plik xorg.conf:
  http://trochej.blogspot.com/2007/11/sxce-76.html</p>
* lRem (2008-06-01 21:01:37): <p>A ja poszedłem po rozum do głowy i znalazłem
  wygodne obejście tego problemu do czasu, aż przemielą Twoje zgłoszenia:  <br
  />  <br />  <img src="http://maxnet.org.pl/~lrem/sposob.jpg" width="100%">
  </p>
* lRem (2008-06-28 13:37:12): <p>Ponoć w najnowszych buildach naprawili tę
  klawiaturę.</p>
