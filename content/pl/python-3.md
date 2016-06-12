+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2011-02-21T17:35:01"
draft = false
title = "Python 3?!"
+++
Zapowiada się na to, że znowu będę musiał przysiąść nad programowaniem w
Pythonie. Z tej okazji, jak zawsze, robię rundę zwiadowczą w poszukiwaniu
darmowych (z mojego punktu widzenia) usprawnień. Dzisiaj postanowiłem
przyjrzeć się Pythonowi w wersji trzeciej. No i znalazłem kilka powodów, dla
których jest on niemal niczym Perl 6 ;)

Lista wyrywkowo-przypadkowa. Tylko te rzeczy, które mnie ugryzły przy tym
jednym projekcie w momencie, gdy chciało mi się pisać.

**Ogólna niekompatybilność**: główny powód, dla którego zmieniono numerek na 3. Niby nie boli, bo dali od razu narzędzie do automatycznej konwersji. Oczywiście nie działa ono zawsze, ale cóż, nie ma nic za darmo. No i niektórych potworków z języka fajnie było się pozbyć. Poniżej jednak wymienię kilka zmian moim zdaniem na gorzsze.

**Usunięcie __cmp__**: kiedyś, by uczynić obiekty jakiejś klasy porównywalnymi według własnej semantyki, wystarczyło nabazgrać jedną metodę o tejże nazwie. Dziś, dzięki genialnej decyzji o jej usunięciu, potrzebne są trzy metody: __lt__, __le__, __eq__. Ot tak, żeby uprościć życie. Ponadto ja osobiście zawsze najpierw piszę __lte__, dopiero jak interpreter zapłacze zmieniam na __le__. Ale to pewnie moja wina, że nie dostrzegam konsekwencji w nazewnictwie ;)

**Zmiana znaczenia operatora /**: wcześniej był on jak w C, teraz jest jak w Perlu... Oczywiście chodzi o to, że przy dzieleniu dwóch liczb całkowitych większość popularnych języków zwraca liczbę całkowitą, zaokrągloną w stronę zera. Jest to o tyle naturalne, że dokładnie takie działanie jest zaimplementowane sprzętowo w procesorach x86. Python od teraz zwraca jednak liczbę zmiennoprzecinkową, by uniknąć zaokrąglenia. Zupełnie jak Perl... Tylko o Perlu nikt nigdy nie mówił, że nadaje się do obliczeń.

**Wydajność**: dodatkowe 10% czasu działania za darmo. Jest to liczba obwieszczona w dokumentacji do Pythona 3.0, otrzymana z syntetycznych benchmarków. Potwierdzona przeze mnie na Pythonie 3.1.3. Python 3.2, po odtrąbieniu kolejnej rundy optymalizacji, działa 20% wolniej od Pythona 2.7.1. W obu przypadkach testuję na swoim projekcie w pracy. Oczywiście wszystko to smutny żart w porównaniu z wydajnością 2.6 + Psyco (które [sprawuje mi się lepiej niż PyPy](http://blog.lrem.net/2010/12/01/pypy-dziekuje-postoje/)).

**Wywalenie niekoszernych _builtinów_**: w większości do osobnych modułów, jak choćby _reduce_. W tym konkretnym przypadku dlatego, że pętla _for_ czytelniejsza. A _map_ czy _filter_ zostanie, bo tak... Niektóre rzeczy zniknęły całkowicie, jak choćby czasem użyteczne _callable_. Sugerowane obejście, _isinstance(f, collections.Callable)_, trudno uznać za krok naprzód.

**Brak "niektórych" _3rd party_ modułów**: najlepiej pokazał to już kto inny - [Python 3 wall of shame](http://python3wos.appspot.com/).

# Komentarze

* pecet (2011-02-21 18:18:22): <p>Dzięki za kolejny powód, dla którego wystarczy
  mi PHP do pisania skryptów :)</p>
* Stanisław 'dozzie' Klekot (2011-02-21 18:21:00): <p>To jeszcze przeczytaj
  artykuł "Python 3: The Good, the Bad, and the Ugly". Tak jak autor, David
  Beazley, mam wrażenie, że Python 3 nie nadaje się właściwie do używania.</p>
  <p>http://www.usenix.org/publications/login/2009-04/index.html</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-21 18:26:53): <p>Jakoś wątpię, by
  istniał odpowiednik pylab dla php…</p>
* Krystian (2011-02-21 18:51:53): <p>Jestem inżynierem, korzystam ze
  Pythona+NumPy+SciPy+matplotlib+Mayavi2 i bardzo sobie cenię to rozwiązanie.
  Nie mam potrzeby inwestowania w Matlaba, a Octave, Scilab wypadają średnio
  przy pylabie.</p>  <p>Mógłbyś rozwinąć kwestię</p>  <p>"Python od teraz zwraca
  jednak liczbę zmiennoprzecinkową, by uniknąć zaokrąglenia. Zupełnie jak
  Perl... Tylko o Perlu nikt nigdy nie mówił, że nadaje się do obliczeń." ?</p>
* pecet (2011-02-21 18:57:43): <p>lRem -- Do obliczeń numerycznych i naukowych
  lepiej użyć C i GSL IMHO ;)</p>
* Krystian (2011-02-21 19:08:31): <p>@pecet</p>  <p>Najlepiej użyć Fortrana;)
  Gdyby nie brak porządnego darmowego kompilatora pod Windows + Intel MKL to
  pewnie bym wybrał to rozwiązanie. </p>  <p>Podobnie wygląda sprawa z C/C++.
  Próbowałem C++ i Armadillo - wyglądało zachęcająco, ale znowu problemy z
  LAPACK-iem mnie przerosły, a sama wydajność tego rozwiązania (bez MKL) wypadła
  gorzej przy prostych obliczeniach na macierzach niż Python+NumPy.</p>
  <p>Python z NumPy (za ohloh: Mostly written in C) jest wystarczająco szybki, a
  przy tym bardzo wygodny i łatwo dostępny.</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-21 19:09:55): <p>Auuu, I/O prawie jak w
  Javie... Do tego według tego artykułu (dzięki Dozzie!) 40x wolniejsze. No i te
  nowe problemy z UTF...</p>  <p>@Krystian: Do czego w tym kombo służy
  Mayavi2?</p>  <p>Co do liczb zmiennoprzecinkowych, chodzi mi o to:</p>
  <p>Python 2.7:</p>  <pre><code>&gt;&gt;&gt; 17/3 5 </code></pre>  <p>Python
  3.2:</p>  <pre><code>&gt;&gt;&gt; 17/3 5.666666666666667 </code></pre>
  <p>Dodatkowe cudo przy zaokrągleniach:<br /> Python 2.7:</p>
  <pre><code>&gt;&gt;&gt; round(1.5) 2.0 &gt;&gt;&gt; round(2.5) 3.0
  </code></pre>  <p>Python 3.2:</p>  <pre><code>&gt;&gt;&gt; round(1.5) 2
  &gt;&gt;&gt; round(2.5) 2 </code></pre>  <p>Teraz dla odmiany nagła miłość do
  intów, do tego z dziwnym kierunkiem zaokrągleń...</p>  <p>@pecet: Jesteś
  pewien, że wiesz o czym mówisz?</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-21 19:19:10): <p>Wspomnę jeszcze jeden
  ciekawy dla naukowca pakiet (jedno wielkie kombo): <a
  href="http://www.sagemath.org/"
  rel="nofollow">http://www.sagemath.org/</a></p>
* Krystian (2011-02-21 19:37:17): <p>@Remigiusz 'lRem' Modrzejewski</p>    <p>Na
  czym polegają różnice to wiem, ale czy wynikają z tego jakieś konsekwencje?
  Pomijając ten round, który może zwyczajnie wprowadzić w błąd.</p>    <p>BTW:
  Sam Python nie służy do obliczeń, do tego celu lepiej skorzystać z Numpy.</p>
  <p>  Python 2.7:</p>    <pre><code>&gt;&gt;&gt; round(1.5)  2.0  &gt;&gt;&gt;
  round(2.5)  3.0  </code></pre>    <p>Python 3.2:</p>
  <pre><code>&gt;&gt;&gt; round(1.5)  2  &gt;&gt;&gt; round(2.5)  2
  </code></pre>      <p>Wszystko się zgadza. Liczba x.5 zaokrąglana jest do
  wartości parzystej.</p>    <p>http://docs.scipy.org/doc/numpy/reference/genera
  ted/numpy.around.html#numpy.around</p>    <p>"For values exactly halfway
  between rounded decimal values, Numpy rounds to the nearest even value. Thus
  1.5 and 2.5 round to 2.0, -0.5 and 0.5 round to 0.0, etc. Results may also be
  surprising due to the inexact representation of decimal fractions in the IEEE
  floating point standard [R9] and errors introduced when scaling by powers of
  ten."</p>    <p>Myślę, że zmiana w Pythonie 3 to ukłon w stronę scientific
  computing, w końcu SciPy jest jednym z najbardziej pożądanych pakietów
  http://www.python.org/3kpoll.</p>    <p>"Do czego w tym kombo służy
  Mayavi2?"</p>    <p>Do wykresów 3D. Mayavi2 wykorzystuje OpenGL i znacznie
  lepiej sobie radzi z wykresami 3D, chociaż z wykresów 3D matplotlib korzystam
  często do generowania EPS-ów do druku.</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-21 21:36:33): <p>Niby racja, da się to
  ładnie uzasadnić. Nie wiedziałem nawet, że zaokrąglanie w stronę parzystej
  również jest w IEE 754. Ale od zawsze popularniejszym sposobem jest
  zaokrąglanie z dala od zera, które poza IEE 754 jest też w ISO 9899. Tak więc
  ta zmiana jest co najmniej zadziwiająca.</p>
* PiotrLegnica (2011-02-21 21:58:29): <p>To zachowanie <code>/</code> jest od
  dawna (w 2.x jako future, bo kompatybilność) w <a
  href="http://www.python.org/dev/peps/pep-0238/" rel="nofollow">PEP 238</a>, do
  floor division jest <code>//</code>.</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-21 22:59:56):
  <p>event.cpython-32.pyc</p>  <p>Czyżby bajtkod nie był już przenośny między
  różnymi kompilacjami interpretera? Przedtem tak było <em>chyba</em> tylko
  między wersjami.</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-21 23:50:13): <p>Ale za to nie jest tak
  źle już z tym I/O. Z chałupniczych testów wychodzi mi, że różnica nie jest
  nawet trzykrotna.</p>
* PiotrLegnica (2011-02-22 06:24:57): <p>Also, 3.2 przywrócił callable,
  http://bugs.python.org/issue10518</p>  <blockquote>   <p>Czyżby bajtkod nie
  był już przenośny między różnymi kompilacjami interpretera?</p> </blockquote>
  <p>cpython-32 to tag dla CPythona 3.2, nie 32-bitowego. PEP 3147.</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-22 09:18:43): <p>A, niegłupie. Tylko
  trochę przy tej wersji mylące.</p>  <p>Perełka z podlinkowanej dyskusji:</p>
  <blockquote>   <blockquote>     <p>I don't like that we're heading into Perl's
  direction. that's all.</p>   </blockquote>      <p>Well, please deal with
  it.</p> </blockquote>  <p>:D</p>
* Game Compass (2014-09-26 06:18:37): <p>Grandioser Artikel. Genau so schön, wie
  zocken an sich.<br /> So verschrieen spielen auch sei, so ist experimentell
  erwiesen worden, dass daddeln, ein dem Alter des Spielers angemessenes <br />
  Spiel vorausgesetzt, förderlich für die Stressbewältigungskapazität des
  Spielers ist.<br /> Beim Spielen lernt der Spielende in höherer Frequenz zu
  Entscheiden und seine <br /> Handlungen zu priorisieren. Einige Videospiele
  vermitteln überdies auch noch Basics <br /> über Wirtschaftlichkeit und
  fördern die Logik des Spielers.<br /> Selbst die verschrieen Multiplayer
  können doch manchmal <br /> den falsch vermittelten Effekt der Abwendung von
  der Realität} umkehren. <br /> Der Spielende wird zwar schon vielen
  verkommenen Subjekten begegnen, jedoch findet der Spielende <br /> häufig just
  in seinem Favoriten Gleichgesinnte.<br /> Alles in allem: zocken ist genial!
  Ungeachtet des <br /> Games und ob PC,Konsole,Handy,etc. , Spielen ist
  Kultur.</p>
* jak najlepiej inwestowac pieniądze (2015-01-17 21:07:33): <p>When sweating
  don't be suprised if it doesn't work every time, <br /> usually when sweating
  only one out of ten attempts on average will begin the sweating process.</p>
  <p>Some of the investors might also go into gold and silver funds because they
  are better <br /> diversified and better managed. The leasee must <br /> pay
  monthly installments until the end of the <br /> lease.</p>
* jak najlepiej inwestowac pieniądze (2015-01-17 21:22:59): <p>When sweating
  don't be suprised if it doesn't work every time, <br /> usually when sweating
  only one out of ten attempts on average will begin the sweating process.<br />
  Some of the investors might also go into gold and silver <br /> funds because
  they are better diversified and better managed.<br /> The leasee must pay
  monthly installments until the end of the <br /> lease.</p>
* singing lessons london (2015-01-19 09:47:16): <p>Terl's boys were inspired to
  work even harder to honor the small part of the story they were telling and to
  <br /> send their own message of gratitude and a 'break a leg' back across the
  pond.<br /> 'So-and-so is such a disappointment to her parents,' or 'So-and-so
  is such a disappointment <br /> to his fans. otherwise you may use Alum and
  rub it over the armpits with or while not the <br /> lemon.</p>
* singing lessons london (2015-01-19 09:55:46): <p>Terl's boys were inspired to
  work even harder to honor the small <br /> part of the story they were telling
  and to send their own message of gratitude and <br /> a 'break a leg' back
  across the pond. 'So-and-so is such a disappointment to her parents,<br /> '
  or 'So-and-so is such a disappointment to his <br /> fans. otherwise you may
  use Alum and rub it over the armpits <br /> with or while not the lemon.</p>
* windows 8 activation key (2015-02-25 18:10:44): <p>It's remarkable to visit
  this web page and reading <br /> the views of all colleagues concerning this
  piece of writing, while I am also eager of getting <br /> experience.</p>
* best web host (2015-04-29 23:24:40): <p>Hello there! This post could not be
  written much better!<br /> Looking at this article reminds me of my previous
  roommate!</p>  <p>He always kept preaching about this. I am going to forward
  this post to him.<br /> Fairly certain he's going to have a great read.<br />
  I appreciate you for sharing!</p>
* therx per head (2015-05-25 09:56:50): <p>For over 15 years Real Bookies has
  pph therx effectively assisted bookmakers from all over the world to take
  wagers from a large number of players on the pay per head <br /> time
  frame.</p>  <p>Our cutting edge bookie software program and the commitment
  from all of our clerks, outlines people,<br /> supervisors and partners have
  made our price per head sportsbook solution among <br /> the fastest
  developing and most dependable bookmaking service <br /> agency names in the
  industry.</p>  <p>Word of mouth may be the number cause new here for the rx
  agencies sign up at RealBookies, which usually speaks towards <br /> the high
  quality associated with service offered to both agents and their <br />
  players.</p>  <p>Upon signing up for the Realbookies family, you are going to
  receive your own personal assistant who will be there <br /> to answer any
  queries you may have about the company <br /> and how to grow your business
  using our pay per head sportsbook.</p>  <p>Joining Realbookies will make your
  own operation become par plus level the <br /> playing therx per head field
  with the greatest online <br /> video gaming companies in the world. The
  gambling software you and your players will be getting may <br /> be the same
  from the biggest on the web sportsbooks today.</p>
* как сделать протеиновый коктейль (2015-05-26 02:35:21): <p>Протеин является
  самой пользующейся <br /> популярностью протеиновые коктейли для роста спорт
  <br /> добавкой посреди культуристов, бодибилдеров.<br /> Протеиновые
  комплексы представляют с лица провиантскую присадку с <br /> высоким
  содержанием белка, сосредоточение что достигает 70–95%.<br /> Эффект протеина
  состоит в том, что перевариваясь в организме, протеин распадается возьми
  аминоксилоты, изо каких именно синтезируются белковые молекулы <br />
  организма, в том числе и мышечная ткань.<br /> Аминокислоты изо протеина
  предупреждают поражение мускул в период <br /> интенсивных занятий и
  способствуют активному <br /> мышечному росту.</p>  <p>на данный момент
  сывороточный <br /> протеин является самой популярной протеиновой добавкой для
  набора массы.</p>  <p>Сывороточный протеин снабжает индивидуум такими
  неподменными <br /> аминокислотами, будто аминокислота, изолейцин и
  аминокислота, <br /> которые участвуют в синтезе мускульного белка опосля
  тяжелых <br /> физических нагрузок. Протеин снежной сыворотки, главная
  сочиняющая данного <br /> вида протеинов, является одним из самых <br />
  значимых белков и владеет воплощенными иммунными качествами.</p>  <p>Сообразно
  технологии производства и концентрации белка <br /> сывороточный созин можно
  разделить <br /> на два вида: концентрат сывороточного протеина и изолят
  протеина.<br /> Данные виды алейроновых <br /> добавок различаются друг от
  друга <br /> концентрацией белка и, соответственно, своей <br /> ценою. В
  экстракте оглавление белка доходит <br /> 80%, а в изоляте до 90-95%.</p>
  <p>Среди протеинов про роста мышц также очень распространены белок,
  канареечный протеин,<br /> которые на протяжении длинного медли могут
  подпитывать организм, мышцы аминокислотами.<br /> Про вегатарианцев создают
  соевый протеин, кой сообразно многим параметрам не уступает иным
  протеинам.</p>
* healthy weight loss tips after pregnancy (2015-06-16 22:23:17): <p>Many people
  while attempting to lose weight should <br /> remember fondly the significance
  of having a healthy diet <br /> since it accelerates the process of slimming
  down while supplying one's body with all the current necessary nutrient
  elements and <br /> vitamins any particular one should keep on together with
  his daily life.<br /> Losing weight and not regaining it is incredibly
  difficult for most people.<br /> With so many programs how we discover the
  engineered to be befitting for us.</p>
