+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-04-29T18:47:13"
draft = false
title = "C++ - monitory panoramiczne również dla programistów"
+++
Od zawsze twierdziłem, że monitor panoramiczny przy programowaniu jest tak
potrzebny, jak druga klawiatura. Myliłem się. Wystarczy chwilę pokodować w
C++, żeby wiedzieć, że panorama jest niezbędna do życia. I to najlepiej taka
160:10. Dla przykładu:

> 5.cpp:82: error: no matching function for call to
'remove_if(__gnu_cxx::__normal_iterator<__gnu_cxx::__normal_iterator > >*,
std::vector<__gnu_cxx::__normal_iterator > >,
std::allocator<__gnu_cxx::__normal_iterator > > > > >,
__gnu_cxx::__normal_iterator<__gnu_cxx::__normal_iterator > >*,
std::vector<__gnu_cxx::__normal_iterator > >,
std::allocator<__gnu_cxx::__normal_iterator > > > > >, pos >::dereferencer >
>, __gnu_cxx::__normal_iterator<__gnu_cxx::__normal_iterator > >*,
std::vector<__gnu_cxx::__normal_iterator > >,
std::allocator<__gnu_cxx::__normal_iterator > > > > >)'

Jest **jedną linijką** z wyniku kompilacji programiku na zaliczenie...

Przy okazji - zna ktoś może jakiś program który potrafi jakoś bardziej
strawnie pokazać takie brzydactwa? Konieczne jest zwijanie, a idealnie by było
jeszcze zobaczyć jakieś kolorki...

# Komentarze

* Caladan (2009-04-29 18:53:59): <p>vi? Code::Blocks? Kate? Emacs? <br />A może
  użyj programu do formatowania kodu -- indenta?</p>
* Moarc/J-23 (2009-04-29 18:54:07): <p>większość współczesnych emulatorów
  terminala zawija O_o</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-29 18:55:56): <p>Caladan: to przecież
  nie jest kod, tylko komunikat o błędzie kompilacji... <br /> <br />Moarc/J-23:
  ale mi nie chodzi o wyświetlenie wszystkiego na raz na monitorze, tylko o
  możliwość kliknięcia w '&lt;' i schowanie wszystko aż do odpowiadającego mu
  '&gt;'.</p>
* Moarc/J-23 (2009-04-29 18:56:20): <p>w edytorze tekstu? kwrite.</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-29 18:57:32): <p>Nie ma jak zwinąć,
  albo nie widzę...</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-29 18:58:24): <p>Może jakiś magiczne
  rozszerzenie trzeba nadać? Ale nie wiedziałem, że kwrite pozwala zwijać
  wewnątrz linijki...</p>
* Moarc/J-23 (2009-04-29 18:59:12): <p>Aa, wewnątrz linijki. Tak to jest jak się
  wpisów nie czyta ;)</p>
* Caladan (2009-04-29 19:00:05): <p>Ta, ja chyba też zacznę dokładniej. ;) A czy
  ten program musi mieć takie skomplikowane wywołanie? :&gt;</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-29 19:00:05): <p>Nawet wyboldowałem że
  problemem jest jedna linia na kilobajt tekstu ;)</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-29 19:01:39): <p>To nie jest jakieś
  wielce skomplikowane, raptem trzy razy zagnieżdżone cudo z STL i jedno własne.
  Widywałem dużo bardziej skompikowane... Ciekawe jak je debugowali ;)</p>
* sawyer (2009-04-29 19:25:41): <p>Mam nadzieję, że się przyda: <br
  />http://textfilt.sourceforge.net/ <br
  />http://www.bdsoft.com/tools/stlfilt.html</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-29 19:37:50): <p>Dzięki!</p>
* Crozin (2009-04-29 19:38:28): <p>Nie czytałem wszystkiego, ale panorama jest
  bardzo wygldna, gdy odwrócisz ją sobie o 90st - duży fragment kodu można łatwo
  objąć wzrokiem.</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-29 19:45:29): <p>Tylko jakoś wszystkie
  monitory panoramiczne które rozważałem i tak nie miały pivota. No i po prostu
  żal kasy, Choć widzę, że w końcu pojawiło się coś na pierwszy rzut oka
  interesującego poniżej 3000zł, muszę poszukać recenzji... Ale pivota i tak nie
  ma.   </p>
* IC0ffeeCup (2009-04-29 20:08:35): <p>Dziękuje za pomysł ;- ) Pozdrawiam.</p>
* night (2009-04-30 08:45:39): <p>Kolorowanie outputa gcc/g++ :
  grc//ccze//własny parser korzystający z ncurses (banalne do napisania, z
  boost'owym regexpem). <br />Zmniejszenie ilości śmieciowych info : TextFilt
  <br /> <br />Korzystam z takiego rozwiązania, errory na czerwono, warningi na
  żółto. Przy rozproszonym kodzie liczącym kilkadziesiąt tysięcy linii łatwiej
  się przebija przez błędy.</p>
* Michał Bachowski (2009-04-30 09:10:32): <p>Zacząłem używać monitora
  panoramicznego jakieś 2 miesiące temu dopiero, ale trudno się odzwyczaić- mogę
  spokojnie mieć otwarte oba boczne paski w eclipse i nadal mam sporo miejsca na
  kod :D <br /> <br />Póki co nie widzę sensu korzystania z pivota... ale kiedyś
  nie widziałem potrzeby kupna monitora w ogóle ;P <br /> <br />Pozdrawiam <br
  /> <br />p.s. może by tak informacja w stopce, że serwis jest &quot;Jogger
  powered&quot;? Wiesz, taki ukłon w stronę załogi Joggera oraz informacja dla
  userów, że mogą się logować na swoje konta Joggerowe...</p>
* Remigiusz 'lRem' Modrzejewski (2009-04-30 09:25:50): <p>Hmmm, kiedyś po prawej
  miałem, ale naszywka odpadła. Trzeba będzie nową wydziergać. Zaś co do
  monitora - fajnie, ale ja nie używam eclipse'a ;)</p>
