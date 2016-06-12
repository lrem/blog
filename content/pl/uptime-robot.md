+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2015-03-06T11:20:33"
draft = false
title = "Uptime Robot"
+++
Miałem ostatnio trochę problemów z wyłożeniem się całej mojej obecności w
Internecie (w tym samym tygodniu Jogger, dostawca w Polsce i w Stanach).
Efektem ubocznym tych problemów było to, że w końcu zauważyłem całkowity brak
monitoringu. Uznałem więc, że potrzebuję czegoś, co spełni te wymagania:

  * black box 
  * sondy zarówno na HTTP (czy zwraca 200) i ping 
  * proste w konfiguracji (podaję adres i tyle) 
  * natychmiastowe powiadomienia (nie będę zaglądał na żadną stronę) 
  * darmowe
![](http://pub.lrem.net/2015/03/uptimerobot.png)

Gdyby nie ostatni punkt, wyborem byłby pingdom. Ale nie będę płacił za
sprawdzanie, czy mój blogasek żyje. Jest też kilka opcji _self-hosted_, z
których najprzyjaźniej wygląda [Cabot](https://github.com/arachnys/cabot).
Problem z tym jest taki, że potrzebny byłby też metamonitoring (co jeśli
monitoring padnie jako pierwszy?), a mi się ewidentnie nie chce poświęcać na
to czasu. Szczęściem udało się znaleźć [Uptime
Robot](https://uptimerobot.com/). Spełnia on wszystkie powyższe wymagania.
Ponadto jest (z tego co zrozumiałem ze strzępków informacji) _multi-master
mutlihomed_, więc nie muszę się martwić niezawodnością. Jeden problem z głowy
mniej :)

# Komentarze

* torero (2015-03-06 12:08:55): <blockquote>   <p>Miałem ostatnio trochę
  problemów z wyłożeniem się całej mojej obecności w Internecie</p>
  </blockquote>  <p>Żadnych problemów nie zauważyłem, wyłożyłeś się wręcz
  bezproblemowo :P</p>  <p>[nie dość, że niekonstruktywnie, to jeszcze
  nieoryginalnie - dawno temu koleżance szukającej lekarstwa na wymioty (w
  autokarze) odrzekłem, że nie potrzebuje żadnego lekarstwa na wymioty, bo
  wymiotuje bardzo ładnie]</p>
* rozie (2015-03-06 23:19:01): <p>Dzięki za cynka, założyłem konto, wygląda
  zacnie. Miałem podobne wymagania i tylko nieco większego lenia, bo monitoring
  na krzyż bez problemu mam jak postawić...</p>
* Remigiusz 'lRem' Modrzejewski (2015-03-07 02:05:10): <p>Oj nie tak
  bezproblemowo. Patrzę: serwer leży, ale mam drugi, to przeniosę śmieci. I
  dopiero wtedy drugi się wyłożył (po ~roku działania bez przerwy).</p>
* rozie (2015-03-07 08:04:00): <p>W sumie to mógłbym bez większego problemu
  podzielić na 3 maszyny. Oraz: to trochę nie tak, że nigdy ma nie paść. Po
  prostu prawdopodobieństwo awarii (a w zasadzie iloraz prawdopodobieństwa i
  skutków) musi być odpowiednio niskie. Bo w sumie jaki skutek ma niedziałanie
  przez parę dni blogaska?</p>
* Remigiusz 'lRem' Modrzejewski (2015-03-07 10:16:27): <p>No w moim przypadku
  zadzwoniła do mnie mama, że jej webapp do inwentaryzacji bałaganu na strychu
  nie działa...</p>
* Zal (2015-03-08 02:22:03): <p>Też się podpiąłem. Mam kilka usług, które
  śmigają na dobrze zarządzanym sprzęcie i... kilka takich, które siedzą na moim
  prywatnym łączu na naprędce złożonych serwerkach armowych ;&gt; Proste
  narzędzie, ale przynajmniej w końcu zacznę ogarniać tę moją kuwetę.</p>
