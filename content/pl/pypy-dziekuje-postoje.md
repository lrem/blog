+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-12-01T17:52:48"
draft = false
title = "PyPy - dziękuję, postoję"
+++
W ramach pracy zawodowej piszę średniej wielkości aplikację w Pythonie. Żeby
było śmieszniej, aplikacja ta powinna być możliwie wydajna. Stąd czasami
przyglądam się różnym ciekawym rozwiązaniom. [Cython](http://www.cython.org/)
jest niby fajny, ale psuje kompatybilność kodu z innymi interpreterami*.
[Psyco](http://Psyco.sourceforge.net/) dało świetne rezultaty, ale projekt
całkowicie zamarł. Dlatego dzisiaj przyjrzałem się [PyPy](http://pypy.org/).

Pierwszy problem pojawił się natychmiastowo:

    
    
    
    Traceback (most recent call last):
      File "app-main.py", line 33, in run-toplevel
      File "run.py", line 59
         except Exception as e:
                         ^
    SyntaxError: invalid syntax
    

No cóż, widać zbyt optymistycznie założyłem, że twórcy PyPy zdążyli już
nadrobić do 2008. Trudno, trzeba na ten moment cofnąć do:

    
    
    
    $ pypy --version
    Python 2.5.2 (79541, Nov 26 2010, 10:18:11)
    [PyPy 1.4.0]
    
    

Dobra, kolejny problem wyskakuje zaraz po uruchomieniu:

    
    
    
    Traceback (most recent call last):
      File "app-main.py", line 33, in run-toplevel
      File "run.py", line 42, in 
        history = History(reset = True)
      File "history.py", line 24, in --init--
        self.connection = sqlite3.connect('history.db')
    AttributeError: 'module' object has no attribute 'connect'
    
    

Szybka wycieczka do Google podsuwa rozwiązanie:

    
    
    
    import sqlite3
    if not hasattr(sqlite3, "register-converter"):
        from sqlite3 import dbapi2 as sqlite3
    
    

Wygląda trochę strasznie, niby eksprerymentalne, ale działa bez błędów.

Następny problem wyprodukował cztery ekrany komunikatu błędu, pozwolę sobie
wkleić tylko fragment:

    
    
    
    Traceback (most recent call last):
     File "app-main.py", line 33, in run-toplevel
      File "run.py", line 64, in 
        cPickle.dump(obj, open('obj.p', 'wb'), cPickle.HIGHEST-PROTOCOL)
      File "/usr/local/Cellar/pypy/1.4/lib-pypy/cPickle.py", line 35, in dump
        Pickler(file, protocol).dump(obj)
    ...
    PicklingError: Can't pickle : it's not found as --builtin--.weakref
    
    

No cóż, tego już tak łatwo nie obejdę. Tymczasowe rozwiązanie sprowadzało się
mniej więcej do: _s/cPickle.*/pass/_...

Kiedy ostatecznie wszystko wydawało się działać, nadszedł czas na oszacowanie
zysku. Najpierw czysty Python 2.6:

    
    
    
    $ time python run.py >/dev/null
    real    0m23.432s
    user    0m21.913s
    sys     0m0.332s
    
    

Teraz pypy:

    
    
    
    $ time pypy run.py >/dev/null
    real    0m40.639s
    user    0m37.041s
    sys     0m0.588s
    

No, w koń... Co proszę?!

Po chwili konsternacji wróciłem do badań. Okazało się, że choć wrapper SQLite
działa, to nie działa on zbyt wydajnie. No cóż... Teraz już wszystkie metody
klasy odpowiedzialnej za zrzucanie danych na dysk zastąpiłem po prostu
_pass_em. I w końcu:

    
    
    
    $ time pypy run.py >/dev/null
    real    0m8.306s
    user    0m7.888s
    sys     0m0.220s
    
    

(CPython zyskał na ostatnich zmianach w kodzie 3 sekundy.) Juhu! Zysk
porównywalny z Psyco! I trzeba było wyciąć _tylko_ zapisywanie efektów
obliczeń. Cóż, pozostaje poczekać, trzymać kciuki i mieć nadzieję, że gdy
Psyco zestarzeje się poza akceptowalne granice (już teraz nie odpalę go na
systemie na którym testowałem PyPy), PyPy będzie działał bez potknięć.

* - po pierwsze, Cython to nie interpreter, tylko osobny język będący nadzbiorem Pythona. Generalnie kod Pythonowy można skompilować Cythonem uzyskując drobne przyspieszenie. Po dodaniu kilku linijek, głównie deklaracji typów, przyspieszenie staje się znaczne. Jednak tak uzyskanego Cythonowego kodu nie da się zinterpretować Pythonem. Za pomocą trochę mniej czytelnych wersji Cythonowych konstrukcji można niby uzyskać kod, który będzie przy okazji poprawny pod Pythonem, ale... I tak będzie wymagał Cythona na docelowym systemie.

# Komentarze

* Remigiusz 'lRem' Modrzejewski (2010-12-01 17:54:33): <p>A, jeszcze pytnie -
  jak wewnątrz code wpisać znak '_', by nie traktowało tego jako znacznika
  kursywy?</p>
* Krzysiek (2010-12-01 18:35:09): <p>Wydawało mi się że psyco działa poprawnie
  do py2.6 ale tylko w wersji x64 więc nie jest tak źle.</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-01 18:36:10): <p>właśnie nie działa w
  x64, stąd problem. Działa z CPythonem 32 bitowym do wersji 2.6.</p>
* Lolek (2010-12-01 22:00:02): <p>Może Jython?  Wiem, że np. JRuby było demonem
  szybkości w porównaniu do zwykłego Ruby przed wydaniem 1.9 :)</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-01 22:14:35): <p>Jython to dodatkowa
  warstwa męczarni z uruchomieniem w środowisku docelowym - musiałbym dołączyć
  całą Javę. W innych okolicznościach pewnie bym go też rozważył (jak i
  IronPythona, gdyby Windows w ogóle wchodził w rachubę).</p>
* Konryd (2010-12-02 11:25:47): <p>@Lolek</p>  <p>Rzeczywiście, JRuby jest
  szybszy w porównaniu z MRI. Niestety (na szczęście?) taka sytuacja w Pythonie
  nie zachodzi.</p>  <p>@IRem<br /> Fajny artykuł. Obserwuję PyPy od lat i
  jestem pełen podziwu dla pracy nad nim wykonanej. Rzeczywiście, wygląda na to,
  że w tym momencie największymi blockerami większości wdrożeń jest
  szybkość/stabilność niektórych modułów trzecich (ja osobiście czekam na PIL
  [1] i  psycopg2 [2]). Z tego co wiem, aktualnie to jeden z ich
  priorytetów.</p>  <p>[1] http://morepypy.blogspot.com/2010/05/running-
  wxpython-on-top-of-pypy.html<br /> [2] https://github.com/Ademan/psycopg2</p>
* Lionix (2010-12-02 11:26:10): <p>O ile dobrze wiem IrionPythona można też
  odpalić na Mono. Ciekawi mnie jak by wypadł pod Mono.</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-02 11:27:07): <p>@Lionix: pewnie tak
  jak wszystko inne: w 93% poprawnie :/</p>
* mt3o (2010-12-02 13:12:26): <p>A może pyrex? Tez jest nadzbiorem pythona,
  powinien dawać takie same korzyści jak cython</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-02 13:40:03): <p>A kod w Pyreksie da
  się uruchomić swobodnie interpreterem Pythona? Bo jeśli nie, to nie widzę
  sensu (Cython powstał na bazie Pyreksa i ponoć jest lepszy).</p>
* Nil (2011-10-16 10:07:19): <p>Również z nadzieją testowałem PyPy i spotkał
  mnie wielki zawód.<br /> Wygląda to tak, że mój kod puszczony pod Psyco działa
  za pierwszą iteracją tak z 800% wolniej ale później za to ok 3 razy szybciej.
  Cython poprawił wydajność o ok. 30% ale za to nie ma kosztu wykonania
  pierwszej iteracji, zawsze działa tak samo. Unlead Swallow kiedyś mnie
  zawiódł, projekt jest martwy więc nie sprawdzałem. PyPy... no cóż, działa 2 -
  3 razy wolniej niż czysty cPython. Po konsultacjach na #pypy uzyskałem
  odpowiedź, że:<br /> 1. Mój kod jest do dupy<br /> 2. PyPy włącza
  optymalizację po 2000 iteracji.<br /> Sprawdziłem, po 2000 iteracji,
  rzeczywiście przyspiesza i nawet zbliża się do osiągów cPythona.<br /> Tak
  więc, gdyby mój kod był piękny i szybki to bym nie potrzebował przyspieszenia,
  no i chciałbym aby po prostu działał szybko, nie tylko gdy obliczenia powtórzę
  2000 razy.<br /> Wciąż marzę o szybkim pytonie. Niech będzie choć jak
  javascript V8 i będzie bajka. Bo na razie to bardzo przyjemny język ale
  najczęściej potrzebujesz szybkiego samochodu, nie tylko pięknego.<br /> PS.
  Czemu ja nie pisałem tego w javie albo c++? No? Czemu! Ostatnio Go wygląda
  zachęcająco. Może nie tak szybkie jak java, ani proste jak Python ale jako
  kompromis?</p>
