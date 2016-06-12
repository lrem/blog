+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2008-08-13T13:11:26"
draft = false
title = "TclDtrace zaimplementowane w 100%"
+++
[TclDtrace](http://dev.lrem.net/tcldtrace/) (mój projekt na GSoC) jest już w
pełni funkcjonalne. Oznacza to, że pozwala na osiągnięcie w swoich programach
wszystkiego, na co pozwala _dtrace(1)_, z wyjątkiem obsługi _annonymous
state_. Wszelkie testy, opinie i uwagi przed stabilizacją API mile widziane.
Ewentualne pomysły na GUI do DTrace również chętnie rozważę...

Paczka z wersją [0.4 dostępna
tutaj](http://dev.lrem.net/tcldtrace/changeset/121/tags/0.4?format=zip).

Przed stabilną wersją 1.0 planuję jeszcze kilka kolejnych wersji, skupiających
się na:

  * dokumentacji - w tej chwili dostępna wyłącznie [na wiki](http://dev.lrem.net/tcldtrace/wiki/CommandsList)
  * oczyszczeniu kodu - jest kilka powtarzających się motywów w różnych funkcjach
  * demonstracji możliwości API - jakieś proste GUI do DTrace
  * ewentualnych zmianach w API - o ile jakieś zostaną ustalone

Wszystko odbędzie się do końca tygodnia. Zgodnie z [zasadami
Google](http://code.google.com/opensource/gsoc/2008/faqs.html#0.1_timeline).

# Komentarze

* Anonim (2008-08-13 17:58:31): <p>&quot;Komentarze do notki TclDtrace
  zaimplementowane w 100%&quot; <br />Trochę OT, ale mógłbyś wyróżnić trochę
  tytuł wpisu od reszty, bo teraz wygląda jakby komentarze zostały
  zaimplementowane w 100% ;)</p>
* Remigiusz 'lRem' Modrzejewski (2008-08-13 18:00:28): <p>Teraz lepiej?</p>
* Jacek Politowski (2008-08-13 20:18:15): <p>A nie lepiej tytuł w cudzysłów
  wziąć?</p>
* Remigiusz 'lRem' Modrzejewski (2008-08-13 20:24:20): <p>A za kim to jest
  cytat?</p>
