+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2016-01-30T19:08:59"
draft = false
title = "Pomysł: TV defender"
+++
Dzielę się pomysłem na weekendowy projekt, w nadziei że ktoś coś podpowie,
albo wskaże mi gotowy produkt na rynku. Jest to coś z kategorii "fajnie by
mieć", więc mam nadzieję to kupić albo zrobić niedługo.

Ma to być _czujnik zbliżeniowy wyłączający telewizor gdy ktoś podejdzie zbyt
blisko_. Część aktywną można łatwo załatwić jakimś _CEC w Raspberry Pi_, mając
rzeczone RPi i kabel HDMI problem ogranicza się do prostego oskryptowania.
Część ciekawa to owo wykrywanie, że ktoś jest za blisko.

Miałem już kiedyś czujnik ruchu, ale to raczej nie spełni oczekiwań - wykrywa
_ruch gdzieś w pokoju_, zamiast _obecność pół metra stąd_. Chałupniczo mógłbym
próbować świecić kilkoma diodami IR i odbierać odibicie, ale:  
**a)** to chyba byłoby zbyt kierunkowe (mówimy o wykrywaniu obecności w odległości pół metra-metr od powierzchni która ma około metra szerokości)  
**b)** rozwiązania chałupnicze w moim wykonaniu z reguły nie zadawalają mnie skutecznością.

Ergo, czujnik zbliżeniowy najlepiej kupić. Jest tego na rynku zatrzęsienie.
Rozrzut cen, więc pewnie i jakości, czyni ten wybór nietrywialnym. Do całości
zniechęca dość słaba organizacja sklepów, na przykład patrząc na tani układ z
AVT o tym, że się nie nadaje, dowiadujemy się [pod koniec
dokumentacji](http://serwis.avt.pl/manuals/AVT1852.pdf) (zero sugestii na
stronie w sklepie).

Czy ktoś ma doświadczenie i może zasugerować jaki z grubsza typ czujnika
będzie odpowiedni do tego zastosowania?

# Komentarze

* sprae (2016-01-31 06:12:53): <p>Może któryś z czujników ultradźwiękowych?<br
  /> https://nettigo.pl/products/category/17</p>  <p>Mają różna charakterystykę
  kąta wykrywania.<br /> Można ją regulować różnymi nakładkami.<br /> Jeśli
  będzie zbyt szeroka to każdy przedmiot na podłodze lub firanka może być
  wykrywane.</p>  <p>Te droższe mają kontroler, który podaje odległość w
  centymetrach (ascii) za pomocą portu szeregowego. <br /> W tych tańszych
  zwykle trzeba liczyć czas trwania impulsu. Na Linuksie w malinie może to być
  niedokładne. Nie próbowałem.</p>  <p>Możesz też doczepić kamerę i za pomocą
  OpenCV, wykrywać twarze i obliczać odległość na podstawie rozstawu oczu.</p>
* Remigiusz 'lRem' Modrzejewski (2016-01-31 15:48:18): <p>Heh, na ten sam HC-
  SR04 wpadłem już po napisaniu tego wpisu. W twoim linku czytam, że w testach
  wygląda dość dobrze. Dzięki, teraz wystarczy poszukać jak to tutaj najlepiej
  kupić :)</p>
