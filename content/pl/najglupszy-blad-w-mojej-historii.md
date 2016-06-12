+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-01-09T21:53:56"
draft = false
title = "Najgłupszy błąd w mojej historii"
+++
No cóż, od dobrych kilku lat administruję za pieniądze bandą Linuksowych
maszynek. Jedna z nich robi za główny router dla _osiedlóweczki_ na kilka
tysięcy komputerów. A ostatnio przez kilka tygodni szukałem paskudnego błędu w
skryptach, które dla tejże zdziałałem. Błąd był nietypowy, nieuchwytny i
znalezienie go było problemem nie tylko dla mnie(link usunięty na życzenie
linkowanego)...

Zasada działania ogólnie pojętego oskryptowania routera Linuksowego jest
prosta jak konstrukcja cepa:

    
    
    
    1) Podnieś dodatkowe adresy IP na interfejsach
    2) Ustaw routing
    3) Ustaw masakarady
    4) Ustaw ograniczenia transferów
    
    

Co w praktyce przekłada się na dobre kilka tysięcy linijek dość schematycznego
_basha_. Oczywiście nikt tego ręcznie nie pisze, ale w tym konkretnym
przypadku sam schemat też ma z tysiąc linijek. No i oczywiście wkradł mi się
tam błąd.

Błąd straszliwy, bo jego debugowanie było dość uciążliwe. Otóż po odpaleniu
tych nowych skryptów _wszystko_ działało, zauważalnie z resztą lepiej niż
przed odpaleniem, przez około 20 minut. Po tych ~20 minutach, bez żadnego
ostrzeżenia, klienci tracili łączność ze światem. Żeby było fajniej, router
nie tracił połączenia z żadnym z łącz - można było choćby się na niego
zalogować z każdej strony. Ponadto klientom przechodził ruch ICMP (ping,
traceroute), jednak IP już nie. Z nasuwających się hipotez: nic się nie
zmieniało w żadnych ustawieniach około 20 minuty, nie ulegał również
przepełnieniu _conntrack_.

Kto zgadnie, co udało mi się spieprzyć? ;)

# Komentarze

* Jajcuś (2009-01-09 22:01:11): <p>W cronie gdzieś był &quot;konkurencyjny&quot;
  skrypt?</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 22:01:53): <p>Był, ale sam w porę
  wpadłem na to, by go stamtąd wyprosić. To nie to.</p>
* Jajcuś (2009-01-09 22:05:21): <p>Jakaś regułka powodowała zapętlenie pakietu,
  który zwykle wpadał po 20 minutach? <br />Albo nie, lepiej: limit transferu
  ustawiony jeden na całą sieć? Gdy wszyscy razem przepchali np. 10GB, to mieli
  sieć odciętą?</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 22:08:27): <p>Znowu nie zgadłeś. Nic
  się nie zapętlało, a w naszej osiedlóweczce nie ma limitów miesięcznych. Nie
  łapał ich też system antywirusowy.</p>
* DeeTah (2009-01-09 22:13:38): <p>Hm, a klienci podłączeni byli przez IP
  wklepane na sztywno, czy DHCP?</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 22:15:57): <p>Klienci mają IP z
  sieci wewnętrznej przydzielane przez DHCP. Ale to działało bez zarzutu.</p>
* Bartosz &quot;BTM&quot; Szczec (2009-01-09 22:24:27): <p>Jak ktoś zgadnie
  szybciej niż &quot;kilka tygodni&quot; to dostaje Twoją posadkę? ;-)</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 22:25:48): <p>Raczej <em>taką samą
  jak moja</em>. Albo szanse na kilka zleceń przy podobnych okazjach. Albo
  stwierdzę, że wywnioskował to z moich podpowiedzi.</p>
* Bartosz &quot;BTM&quot; Szczec (2009-01-09 22:26:35): <p>Ja to za miękki
  między uszyma jestem, tak tylko pytałem ;-)</p>
* D4rky (2009-01-09 22:42:41): <p>jakis timeout po 20 minutach?</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 22:45:53): <p>No samo to, że po 20
  minutach przestawało działać, można nazwać timeoutem... Ale jeśli o to pytasz,
  to nie, żaden czas w /proc nie był ustawiony na 20 minut. Do tego - to nie
  było równe 20 minut, a coś między 18 a 25, ze średnią w okolicach 20.</p>
* anonim (2009-01-09 22:59:29): <p>Defaultowy czas połączenia był ustawiony na
  20 minut? Tak jest w moim ASUS AP-WiFi solo który potrafi przełączyć kartę
  Realteka w trym AccessPointa?</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 23:00:27): <p>Nie wiem co tutaj
  rozumiesz przez ten defaultowy czas połączenia. Możesz doprecyzować?</p>
* Michał Górny (2009-01-09 23:05:08): <p>Po ~20 minutach aktywował się
  botnet!</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 23:05:42): <p>Weź mi proszę nic o
  botnetach nie pisz...</p>
* urban (2009-01-09 23:08:21): <p>zablokowana szeroka, dosc wysoka ranga portow?
  ;)</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 23:09:04): <p>Nie, tylko Microsoft
  trio i może z dwa inne porty.</p>
* D4rky (2009-01-09 23:09:53): <p>Ograniczenie transferu ścinało łącze?</p>
* urban (2009-01-09 23:12:08): <p>to nie mam pojecia co, ja kiedyś tak
  zablokowałem użytkowników windows, ktorych porty zrodlowe po kilkunastu
  minutach byly strasznie wysokie i akurat wpasowywaly sie w moja regulke. a ja
  sie dziwilem, ze u mnie na linuksie dziala ;)</p>
* Michał Górny (2009-01-09 23:14:35): <p>Właśnie, to mi przypomina, że miałem
  sprawdzić, czy Windows da sobie pozajmować wszystkie porty po UPnP.</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 23:15:32): <p>D4rky: nie. Również
  ściągnięcie ograniczeń nie pomagało. <br /> <br />urban: nie działało również
  użytkownikom korzystającym z Linuksa/OSX/*BSD/telefonu/tostera... No, z tych
  ostatnich to żaden nie zdążył się poskarżyć ;)</p>
* Zal (2009-01-09 23:19:18): <p>@lRem: To nie była kwestia czegoś, co z
  założenia miało chronić, a przez błędy w realizacji po prostu się sypało?
  ;]</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 23:21:19): <p>Nie. Podpowiem
  szerzej: nie było to nic z okolic firewalla (rozumianego jako wycinanie portów
  wirusów, ograniczanie spamu, wycinanie kontrolerów botnetów czy inne tego typu
  dziwactwa).</p>
* mateyko (2009-01-09 23:30:11): <p>Jakiś czynnik ludzki miał wpływ? Ponoć to
  człowiek jest najbardziej zawodny.</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 23:31:25): <p>Czynnik ludzki w
  postaci pani Zosi od zamiatania potykającej się o kabel - nie. Czynnik ludzki
  w postaci błędu piszącego/wdrażającego skrypty - tak.</p>
* Bartosz &quot;BTM&quot; Szczec (2009-01-09 23:32:50): <p>Może gdzieś jakąś
  zmienną wykorzystałeś do różnych celów? :&gt;</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 23:34:05): <p>Nie. Nie była to też
  żadna literówka (acz dużo czasu spędziłem szukając takowej).</p>
* D4rky (2009-01-09 23:35:15): <p>A moze to sie wywalalo jak skrypt konczyl
  dzialanie?</p>
* Zal (2009-01-09 23:39:27): <p>@lRem: Te okolice 1200s są istotne? :P</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-09 23:44:14): <p>D4rky: zależy który
  skrypt, bo było rozbite na kilka funkcjonalnych... Ale to by było albo 8, albo
  około 40 sekund. <br /> <br />Zal: tak, ale sam jeszcze nie doszedłem do tego
  czemu to akurat okolice 1200s są.  <br /> <br />Ale powoli zbliżamy się do
  końca przesłanek, które odkryłem w czasie szukania tego błędu ;)</p>
* talen (2009-01-10 00:02:52): <p>Co prawda już dano iptables się nie bawiłem,
  ale moją niepewność wzbudzają alternatywne adresy IP, przynajmniej ja bym je
  sprawdził w pierwszej kolejności - pamiętam, że kiedyś z nimi miałem spore
  problemy :-)</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-10 00:16:35): <p>Co rozumiesz przez
  alternatywne? I co byś sprawdził?</p>
* talen (2009-01-10 00:25:28): <p>Alternatywne adresy IP (tzw. aliasy): <br
  />192.168.0.1 - eth0 <br />192.168.1.1 - eth0:1 <br />192.168.2.1 - eth0:2 <br
  /> <br />Z tego co pamiętam, to lubią być problemy przy ustawianiu limitów
  przepustowości - albo domyślnie wszystko było przepuszczane przez eth0 (chyba
  htb, albo hfsc nie pozwalało na ustawienie na aliasach, albo dziwnie to
  obliczało). Możliwe, że błąd konfiguracji był tutaj i na początku wszystko
  działało, a jak 'żetony' się skończyły, to ruch zamierał. Stąd różny czas, ale
  oscylujący wokół 20 minut. <br /> <br />Obstawiam, że tutaj coś mogło by być
  nie tak. Ale to tylko moje domysły, bo ostatnio tą tematyką zajmowałem się
  dobre 2 lata temu :-)</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-10 00:27:38): <p>Nie używamy aliasów,
  nie ma to związku z HTB (nie używamy HFSC). Ale podpowiem - jesteś na razie
  najbliżej z wszystkich tutaj i na IRC-u.</p>
* talen (2009-01-10 00:31:33): <p>trochę to nie uczciwa zgaduj zgadula, ale
  spróbuję 'strzelić' raz jeszcze. Może to kwestia ustawień stosu tcp/ip na
  serwerze ? <br /> <br />Jakie były ustawienia tych parametrów ? (wycinek z
  orginalnego rc.firewall - www.inet.ll.pl): <br />--------------------- <br />
  # Limitowanie sesji tcp <br />      /bin/echo &quot;30&quot; &gt;
  /proc/sys/net/ipv4/tcp_fin_timeout <br />      /bin/echo &quot;2400&quot; &gt;
  /proc/sys/net/ipv4/tcp_keepalive_time <br />      /bin/echo &quot;0&quot; &gt;
  /proc/sys/net/ipv4/tcp_window_scaling <br />      /bin/echo &quot;0&quot; &gt;
  /proc/sys/net/ipv4/tcp_sack <br />      /bin/echo &quot;20480&quot; &gt;
  /proc/sys/net/ipv4/ip_conntrack_max <br />      /bin/echo &quot;20&quot; &gt;
  /proc/sys/net/ipv4/ipfrag_time <br />      /bin/echo &quot;1280&quot; &gt;
  /proc/sys/net/ipv4/tcp_max_syn_backlog <br /> <br />    # Tcp timestamps
  protection <br />      /bin/echo &quot;1&quot; &gt;
  /proc/sys/net/ipv4/tcp_timestamps <br />--------------</p>
* alchemyx (2009-01-10 00:34:31): <p>Powiedz i nie trzymaj nas w niepewności, bo
  sam jestem ciekaw :)</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-10 00:35:08): <p>talen: Poszedłeś w
  maliny...</p>
* talen (2009-01-10 00:35:30): <p>iRem: no to idę spać :-)</p>
* marsjaninzmarsa (2009-01-10 00:50:42): <p>Zbyt niski typ zmiennej zliczającej
  transfer? W sensie, że jak się wyczerpały ograniczenia np. Integer'a (nie
  wiem, jakie tam są typy zmiennych), to kończyło połączenie? Albo z innej
  beczki - nie wgrałeś wszystkich plików na serwer ;)</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-10 01:02:13): <p>Dobra, to rozwiązaniem
  zagadki jest: punkt 1 załączonego pseudokodu.  <br /> <br />Dokładniej: adresy
  najpierw czyszczę, potem dodaję. Przez błąd rzeczowy jeszcze w bazie danych w
  ogóle nie dodawałem adresów wykorzystywanych przez klientów. Czyli w wyniku
  komendy /ip a l/ widziane były tylko te ip, na których odpowiada router.
  Jednak mimo to, przez ~20 minut Linux pozwala przepychać ruch przez numery IP
  które nie są już przypisane   (ale wcześniej były) do kart. Po tych ~20
  minutach wszystkie kilka tysięcy zdjętych ip w tym samym momencie milknie. <br
  /> <br />Te kilkadziesiąt komentarzy w próbie odgadnięcia przynajmniej mnie
  trochę pocieszyło. Widać przeanalizowanie wyjścia /ip a l/ nie jest typowym
  pierwszym pomysłem przy tych objawach :) <br /> <br />Ponadto odpowiadam na
  jeszcze jedno pytanie spoza bloga: nie wystarczyło zrobić diffa między nowymi
  a starymi ustawieniami, bo nie miały linijek wspólnych. Działają na różnych
  ogólnych zasadach, inaczej wykonane jest prawie wszystko.</p>
* Scout (2009-01-10 11:38:18): <p>IRem, założę się, że rozwiązanie przyszło Ci
  do głowy wtedy, gdy przestałeś o tym myśleć.</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-10 11:41:39): <p>Heh, nie do końca.
  Generalnie to studiuję na dwóch kierunkach i przestać o tym myśleć miałem
  duuużo okazji w międzyczasie.  <br /> <br />Tak przy okazji: ta pierwsza
  literka mojego nicku to nie jest 'I'...</p>
* wikiyu (2009-01-10 15:44:29): <p>tak poczytałem doszedłem do końca i mam
  dylemat: <br />w tych cudzysłowach na końcu masz <br />duże &quot;i&quot; czy
  małe &quot;L&quot;?</p>
* BeteNoire (2009-01-10 17:37:53): <p>&quot;Ale podpowiem - jesteś na razie
  najbliżej z wszystkich tutaj i na IRC-u.&quot; <br /> <br />Że tak offtopowo
  pozwolę sobie spytać: na jakim kanale? :] (i w jakiej sieci)</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-10 17:46:15): <p>Na IRCNecie, ale nie
  powiem więcej, bo znowu będzie awantura ;)</p>
* BeteNoire (2009-01-10 17:59:25): <p>Jakie znowu? Jaka awantura? ;-)</p>
* Michał Górny (2009-01-10 18:49:09): <p>…i ktoś tam odpowidział? O o.</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-10 18:51:16): <p>Na poprawną odpowiedź
  wpadła jedna osoba - mlp. Prawdopodobnie dlatego, że zamiast wytężać swoją
  znajomość sieci komputerowych (których zna tyle, na ile ją na studiach
  zmusili), przeczytała treść zagadki i przeprowadziła logiczną eliminację z
  użyciem komentarzy...</p>
* Void (2009-01-11 22:59:32): <p>Miałem kiedyś problem taki sam w skutkach, z tą
  tylko różnicą, że: 1) było to na FreeBSD 2) routing blokował się nie po 20
  minutach, tylko po jakichś 2 tygodniach (i weź tu sobie człowieku zdebugguj
  coś takiego...). <br /> <br />Problemem była stara wersja ipfilter, tj. nowsza
  w jądrze, starsza w zainstalowanym oprogramowaniu.</p>
