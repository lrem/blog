+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-12-19T01:48:30"
draft = false
title = "Najbrzydsza rzecz w Pythonie"
+++
W przerwie między zastanawianiem się czemu jeszcze nie śpię, a zajadaniem
spaghetti z mikrofalówki, trafiłem na najbrzydszego do tej pory _quirka_ w
Pythonie. Znalezienie rozwiązania zajęło mi przygnębiająco dużo czasu. Jak
również samo rozwiązanie jest przygnębiające - **moduł musi importować samego
siebie**.

Python, jak wszystkim dobrze wiadomo, nie ma czegoś takiego jak zmienna
globalna. Słowo kluczowe _global_ co prawda istnieje, ale dla niepoznaki
oznacza ono zmienną modułową (prosty odpowiednik _our_ z Perla). Zmienną taką
zdefiniowaną w pliku _abc.py_ z innego pliku możemy dorwać jako _abc.zmienna_.

Problem pojawia się, gdy plik _abc.py_ jest bezpośrednio tym, który
uruchamiamy. Jak się okazuje, wewnętrznie Python naszą zmienną zachowuje w
_\--name--.zmienna_. Zaś dla pliku uruchomionego _\--name--_ ma wartość
_\--main--_. "Dzięki" temu gdy importujemy ten plik z innego pliku otrzymujemy
**dwie oddzielne kopie** naszej zmiennej: _\--main--.zmienna_ oraz
_abc.zmienna_.

To samo tyczy się klas. Jeśli więc korzystamy z obiektów klasy, lub w
jakikolwiek inny sposób modyfikujemy klasę w locie, możemy potknąć się o
różnicę między _\--main--.klasa_ i _abc.klasa_.

Rozwiązaniem tego problemu jest taka konstrukcja naszego pliku:

    
    
    
    #!/usr/bin/env python
    # abc.py
    
    if __name__ = "__main__":
        import abc
    
    abc.zmienna = 42
    

Niestety triku tego nie da się zastosować do klas.

# Komentarze

* Remigiusz 'lRem' Modrzejewski (2010-12-19 01:51:08): <p>Przy okazji: nadal
  czekam na sugestię, jak przekonać Joggera, by nie traktował dwóch podkreśleń
  jako tagu markdowna. Markdown dla wpisów mam w panelu wyłączony.</p>
* Szymon (2010-12-19 09:16:48): <p>w pythonie są same brzydkie rzeczy ;&gt;</p>
* 2M1R (2010-12-19 10:26:50): <p>@Szymon: Płoń heretyku ;) Programowanie w py to
  bajka, szczególnie jak się przesiadło z C... Co do zagadnienia zasięgu
  zmiennych polecam przeglądnąć oficjalny tutorial:
  http://docs.python.org/py3k/tutorial/classes.html#python-scopes-and-namespaces
  (Fakt ze akurat podałem linka do py3k nie powinien mieć tu znaczenia ale niech
  mnie jakiś bardziej doświadczony pythonowiec poprawi)</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-19 10:47:05): <p>Rzeczywiście jest o
  tym wspomniane, ale żeby nie przeoczyć tego jednego zdania trzeba chyba
  specjalnie tego szukać...</p>
* Satanowski (2010-12-19 11:40:37): <blockquote>   <p>#!/usr/bin/env perl</p>
  </blockquote>  <p>Zastanawia mnie jak ten perl sobie z tym kodem poradzi
  ;-)</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-19 13:04:25): <p>Jak zawsze, tylko
  zapomniałem w Inline::Python owinąć ;)</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-19 14:46:01): <p>Ech, ludzie mi
  bocznymi kanałami ciągle powtarzają, że powyższe rozwiązanie jest brzydkie...
  Kilka innych działających:<br />  1. Przenieść zmienne globalne do osobnego
  <em>global.py</em>.<br />  2. Dodać do konstruktora każdej innej klasy w
  projekcie referencję do obiektu który chciałem uczynić globalnym (bo "to
  potrzeba posiadania globalnych zmiennych jest dziwna").<br />  3. Oddzielić
  logikę głównej klasy od programu wykonywalnego. Inaczej mówiąc, stworzyć
  osobny plik który będzie tym wykonywanym, którego całą zawartością będzie
  import i uruchomienie głównej klasy.<br />  W moim programie wybrałem
  rozwiązanie pierwsze.</p>    <p>Kilka w sposób oczywisty nie działających:<br
  />  1. Odnosić się do zmiennej przez <em>--main--.zmienna</em>.<br />  2.
  Zrobić z niej singleton dowolną powszechnie znaną metodą.<br />  3. Użyć słowa
  kluczowego <em>global</em>.</p>
* sprae (2010-12-19 14:53:06): <p>Czekam na kolejny art w którym stwierdzisz, że
  brakuje goto ;-)</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-19 14:59:02): <p>Gdyby goto było
  najlepszym rozwiązaniem czegokolwiek, to bym narzekał też i na jego brak. Mogę
  tymczasem narzekać, że wychodzenie z zagnieżdżonych pętli w Pythonie
  rzeczywiście jest nieprzemyślane. Brakuje nazwanych pętli.</p>
* sprae (2010-12-19 15:05:24): <p>Tak na serio chciałem przez to powiedzieć, że
  tradycyjna idea globalnych zmiennych nieco kłóci się z ideą dynamicznego
  języka i namespace-ów.<br /> Wizja "najlepszego" rozwiązania to tylko twoja
  wizja.</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-19 15:12:44): <p>Ale alternatywą do
  zmiennej globalnej jest dorobienie tony dodatkowego kodu, który na dobrą
  sprawę nic nie robi, a przy okazji marnuje pamięć i stwarza możliwość błędu.
  To mi się nieco kłóci z ideą wygodnego programowania. Ale tak, to tylko moje
  zdanie.</p>
* sprae (2010-12-19 15:39:19): <p>Alternatywą jest dostosować się do platformy,
  np. sprawdzając jak podobne rozwiązania stworzyli inni, albo zmienić platformę
  na taką, która pasuje do twoich wymagań. Przecież jest tyle konkurencji.</p>
* sprae (2010-12-19 15:46:07): <p>Zapomniałem o najważniejszym. Dla mnie
  najlepszym rozwiązaniem byłoby stworzenie osobnego modułu/ów ze zbiorem takich
  zmiennych i importowanie tam, gdzie są potrzebne.<br /> To chyba jest
  najładniejsze z możliwych. Chyba, że jesteś od tych, których krzywdzi
  zastosowanie każdej kolejnej zmiennej, modułu, zależności.</p>
* Ravicious (2010-12-19 16:32:07): <p>Myślałem, że nie utrudniasz sobie życia i
  piszesz obiektowy kod, wtedy właściwym rozwiązaniem byłoby rozwiązanie numer
  3. AFAIK na jeden plik powinna przypadać jedna klasa (oczywiście są odstępstwa
  od tej reguły).</p>  <p>No chyba, że to jest jakiś bardzo prosty skrypt.</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-19 16:41:09): <p>@sprae... Przecież
  wyraźnie napisałem, że takie właśnie rozwiązanie zastosowałem ostatecznie w
  swoim programie. A nie zmienię platformy na lepszą z tego trywialnego powodu,
  że nie wiadomo mi nic o lepszej do tego zastosowania.</p>  <p>@Ravicious:
  Piszę obiektowo, jeden plik na klasę. I w tym właśnie układzie wydaje mi się
  logiczne, że uruchamiany powinien być plik, w którym zaimplementowana jest
  klasa trzymająca stan głównej pętli programu. Nie powiesz mi, że wymogiem
  obiektowości jest umieszczanie wywołania głównej pętli w osobnym pliku niż
  samej pętli.</p>
