+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-01-26T20:57:52"
draft = false
title = "Eksportowanie historii z Gajima"
+++
Mój ulubiony klient Jabbera trzyma logi w SQL. To raczej dobrze niż źle.
Jednak w tym układzie nie można po prostu przekazać komuś pliku z jego
historią. Nie będzie to prosty _grep_. Jeśli chcemy poratować kogoś częścią
swojej historii rozmów, trzeba użyć czegoś w stylu poniższego:

> `sqlite3 logs.db 'select strftime("%Y/%m/%d %H:%M:%S", m.time, "unixepoch"),
kind, message from logs m join jids j on m.jid_id==j.jid_id where jid like
"Ty@Twoja.domena" and m.time > 1234567890 and m.time < 1325476870;' | sed -e
's/|4|/ <Ty>/' | sed -e 's/|0|/ *Ty* /' | sed -e 's/|6|/ <ja>/' > logi.txt`

Oczywiście wypada podmienić _Ty@Twoja.domena_ na JID rozmówcy, _Ty_ na jego
nicka, _ja_ na swojego i obie duże liczby na odpowiednie _timestampy_.

# Komentarze

* Rebel (2010-01-26 21:23:04): <p>nie jestem pewien ale chyba wersja beta tlena
  na linuxa też ma archiwum w sql... ?</p>
* Remigiusz 'lRem' Modrzejewski (2010-01-26 21:23:42): <p>Nie wiem, nie mam
  Linuksa chwilowo ;)</p>
* Minio (2010-01-27 13:36:59): <p>Tych trzech sedów nie da się zamienić na
  jednego? Na oko:<br />  <br />  sed -e 's/|[46]|/ /;s/|0|/ *Ty* /'<br />  <br
  />  Ale nie mam żadnego pliku źródłowego by móc potwierdzić.</p>
* Remigiusz 'lRem' Modrzejewski (2010-01-27 13:43:52): <p>LoL, nie zauważyłem
  wcześniej, że wcięło mi kawałek kodu. Teraz widać, że nie aż tak prosto. Ale
  owszem, można to sprowadzić do jednego. Tylko ja wolę konstruować rurki krok
  po kroku, więc w tej wklejce widać kolejność w jakiej interpretowałem
  komunikaty ;)<br />  <br />  Jak by już to optymalizować, to wypadałoby zacząć
  od SQL-a.</p>
