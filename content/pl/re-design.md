+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2011-03-06T02:02:00"
draft = false
title = "(Re?)Design"
+++
Z powodu wiszącego nade mną bardzo poważnego zadania marnuję czas na pierdoły.
Dziś padło na, bardzo mocno zaległe, ujednolicenie wyglądu bloga z innymi
rzeczami. Proszę więc o wszelkie komentarze, w szczególności te złośliwie
wytykające niedociągnięcia :)

Zdaję sobie sprawę z tego, że strona logowania nadal ma się nijak. Po prostu
nie mam na to ochoty w tej chwili. Czy ktokolwiek kiedykolwiek tam zajrzał?

Przy okazji dokonałem paskudnego spostrzeżenia: Joggerowe poprawianie kodu
psuje xhtml-a. Inne paskudne spostrzeżenie to to, że ten szablon to xhtml ;)

# Komentarze

* Zal (2011-03-06 02:30:01): <p>FIRST POST!</p>  <p>PS. Formatka dla komentarzy
  jest wypełniona jakimiś znakami białymi pod Chrome 11.0.686.3 dev.</p>
* Zal (2011-03-06 02:32:18): <p>PPS. Dodaj do DOCTYPE definicję encji i będzie
  się walidować całość. Np.:</p>  <blockquote>   <p>&lt;!DOCTYPE html PUBLIC
  "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-
  rdfa-1.dtd" [ &lt;!ENTITY nbsp "&amp;#160;"&gt;  ] &gt;</p> </blockquote>
* rozie (2011-03-06 08:41:03): <p>To co opisał Zal jest też pod Fx (4.0b12).
  Dwie linie białych znaków, różna ilość w każdej.</p>  <p>IMHO za szeroki
  sidebar (i nieco szerszy, niż ten pomarańczowy na głównej stronie). To czarne
  tło u góry, na którym jest tytuł - podobnie, różni się od tego na głównej
  (jest wyższe).</p>  <p>Czcionka mogłaby być o oczko większa (i treść wpisu, i
  komentarze). Ale to opinia użytkownika 1024x768, czyli mniejszości. I ogólnie
  często muszę na tym sprzęcie ctrl-+ używać.</p>
* rozie (2011-03-06 08:45:48): <p>Jeszcze jedno: nie masz widocznego entryID.
  Ani na wierzchu, ani w źródle strony. Nie da się obserwować wpisu przez
  jabbera bez tego... Jak już grzebiesz, to może dorzuć coś w stylu tego, co
  miałem? W źródle okolice funkcji myIDEntry, zamiast ID wpisu oczywiście tag z
  szablonu Joggera musi być.</p>
* Remigiusz 'lRem' Modrzejewski (2011-03-06 12:08:14): <p>Białe znaki
  poprawione, dzięki.</p>  <p>Co do encji, to jakoś nie widzę problemu. Ładnie
  się wszystko* validuje również gdy użyję encji.</p>  <p>Co do szerokości
  sidebara, to chwilowo zostawiłem celowo taką jak w pierwowzorze. Zamierzam
  spróbować kilku widgetów (raczej nie reklamowych) i nie chcę po kilku dniach
  poszerzać z powrotem ;)</p>  <p>Z headerem jest trochę śmiesznie, bo w moim Fx
  (3.6.13) jest na odwrót. No i też muszę pomyśleć, czy coś tam kiedykolwiek
  wstawię, a jak nie to chyba trochę zmniejszyć.</p>  <p>Czcionka jest niemała -
  1.11em w treści. Przykładowo u Kosy jest 0.9em, u torero 1em, u Zala i grzglo
  domyślna, na głównej Joggera 0.88em. Może masz po prostu za małą ustawioną w
  przeglądarce?</p>  <p>Co do obserwowania przez jabbera, to miał być przycisk
  śledź komentarze. Ale nie wiem czy to by zadziałało, więc rzeczywiście dodam
  chwilowo tekst... A co mi tam, pozwolę sobie skopiować Twój skrypt. Mogę? ;)
  Choć teraz trochę to dziwnie mi wygląda.</p>  <p>W każdym razie dziękuję za
  pomoc :)</p>  <ul> <li><br /> <ul> <li>poza starymi wpisami, których nie chce
  mi się edytować, by przechodziły pod xhtml</li> </ul></li> </ul>
* rozie (2011-03-10 17:59:11): <p>Skrypt (szumne słowo) oczywiście możesz,
  przecież bym nie podawał namiarów jakbym nie chciał rozpowszechniać. ;-)
  Wygląda faktycznie nieszczególnie - trochę za blisko poprzedniej linii, trochę
  za długi tekst (ponad linia na 1024) i trochę za duża czcionka. Z kolei sam
  numer bym boldnał i/lub zostawił tej samej wielkości.</p>  <p>Brak odnośników
  do poprzedniego/kolejnego wpisu z premedytacją?</p>
* Remigiusz 'lRem' Modrzejewski (2011-03-10 18:03:31): <p>Nie, czyste lenistwo
  :)</p>
