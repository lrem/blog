+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2011-02-18T12:28:33"
draft = false
title = "Masz domenę .com lub .net? Możesz mieć problem..."
+++
Jak pokazuje dzisiejszy przykład, pewnego ranka możesz się obudzić i zamiast
swojej strony zobaczyć coś takiego: [![Seized](http://bishoe.com/IPRC_Seized_2
010_11.gif)](http://bishoe.com/IPRC_Seized_2010_11.gif) Jak podaje el reg,
spotkało to w tej chwili 84000 (osiemdziesąt cztery tysiące) domen. Bez prawa
do obrony, bez wiedzy, a w większości i bez winy właścicieli.

Co ich łączyło? Korzystali z tego samego darmowego DNS. Może więc to spotkać
każdego, kto korzysta z jakiegokolwiek FreeDNS w domenie pod jurysdykcją USA.
Podobnie może być z serwisami płatnymi, ale w pomniejszych firmach (zakładam,
że żaden urzędas nie nakaże zamknięcia GoDaddy). Jeśli masz domenę .pl, ale
korzystasz z jakiegoś darmowego DNS, to sprawdź też gdzie oni trzymają
DNS-y...

Źródło: <http://www.theregister.co.uk/2011/02/18/fed_domain_seizure_slammed/>

# Komentarze

* pecet (2011-02-18 13:01:13): <p>Ciekawy podejście do problemu, zastanawiam się
  czy to ich HSI wie że zablokowanie samej domeny gówno daje ;)<br /> Po za tym
  domyślam się, że chodzi tylko o domeny z szkodliwą dla USA treścią, więc ja
  się bać czego raczej nie mam, nie mniej podejście od dupy strony.</p>
* Anonim (2011-02-18 13:02:22): <p>Jak masz domenę .pl to zgłaszasz do nasku
  spór i oni od razu blokują operacje na tej domenie (typu zmiana dns)! Bez
  rozponania tematu.</p>  <p>To dopiero jest fajne :&gt;</p>
* pecet (2011-02-18 13:07:25): <p>Anonim -- otwarli teraz rejestrację domen .so,
  może warto się zaopatrzyć? ;)</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-18 13:08:11): <p>Pecet - szkodliwą dla
  USA treścią są również linki do rapidshare czy megavideo...</p>
* zammer (2011-02-18 15:02:09): <p><a
  href="http://www.mywot.com/pl/scorecard/bishoe.com"
  rel="nofollow">http://www.mywot.com/pl/scorecard/bishoe.com</a><br /> Fyszyng,
  skam...</p>
* Marsjanin (2011-02-18 18:00:26): <p>Usiłuję zrozumieć, o co chodzi i jaxię ma
  korzystanie z zewnętrznego DNS podpiętego pod domenę do treści w jakiś tam
  sposób szkodliwych czy zabronionych. o_O</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-18 18:09:19): <p>Załóżmy, że korzystasz
  z darmowego dns pod adresem freedns.internetz.com (wpisane po domenie, nie
  tylko po IP). Kto inny ma stronkę w freehosting.internetz.com. I tamże
  zapostuje linka do najnowszego odcinka Teletubisów na megavideo. Przyciąga to
  furię MPAA, które następnie załatwia akcję OIOUS przeciw tej stronie. Ale jest
  to tak zrobione, że leci *.internetz.com, więc i freedns… Teraz ktoś chce
  wejść na Twoje filatelistyka.pl. Pytanie najpierw leci do root serwerów, które
  oddelegowują to do root serwera dla *.com, który oddelegowuje to do dns-a dla
  *.internetz.com… Tyle, że teraz tym dns-em jest coś, co odpowiada na wszystkie
  zapytania tą stronką "Site seized". I teraz ktokolwiek zechce poczytać u
  Ciebie o zbieraniu znaczków, dowie się zamiast tego że za jakieśtam
  przestępstwa można iść na x lat do pierdla. Fajnie, nie?</p>
* Marsjanin (2011-02-18 18:38:01): <p>Aaa, no tak. Ja mam domenę na Tokelau,
  będącego pod jurysdykcją brytyjską, a DNS w freedns.42.pl – miejmy nadzieję,
  że polski rząd nie zajmie się wycinaniem w pień wszystkiego, włącznie z
  prezydent.pl, po odkryciu zwierzęcego porno w jakimś tam *.pl…</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-18 18:40:56): <p>42.pl ma oba DNS-y
  własne (*.42.pl), więc rzeczywiście w tym przypadku nie ma się o co
  martwić.</p>
* pecet (2011-02-18 18:43:01): <p>Zastanawia mnie jaki sens jest używać
  zewnętrznych DNSów jak większość hostingów takie coś oferuje? A jak ktoś ma
  VPS/RPS to przecież również może sobie sam postawić...</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-18 18:43:48): <p>Nie wszyscy mający
  domenę mają od razu hosting. Zresztą spytaj Marsjanina ;)</p>
* Marsjanin (2011-02-18 18:43:49): <p>Dodam, że <em>mea</em> bardzo wielka
  <em>culpa,</em> bo źle zrozumiałem wpis – sądziłem, że wedle tych Jeźdźców
  Apokalipsy Internetu samo korzystanie z danego DNS jest przestępstwem i
  „personalnie” poblokowali domeny z USA korzystające z danego serwera DNS,
  zamiast dajmy na to „jakiegoś swojego”.</p>
* Marsjanin (2011-02-18 18:47:29): <p><em>@<strong>pecet</strong>:</em> Otóż
  „hosting” to pojęcie spore. Dla jednych wystarczy 12 MB na WWW z wciśniętymi
  reklamami, za to bez MySQL ani PHP, inni są bardziej wybredni. Jeszcze inni
  (jak ja) miewają takie kaprysy, by np. kolejna przesiadka z XMPP była ostatnią
  ciągnącą za sobą zmianę JID-a.</p>
* pecet (2011-02-18 20:16:05): <p>Marsjanin -- no to ustawiasz odpowiednie DNSy
  w swoim hostingu tyle, zmieniasz hosting, możesz zmienić DNSy na inne itd. Nie
  rozumiem idei ;) No chyba, że chcesz korzystać z czegoś typu hosted.im a nie
  chcesz hostować www przy okazji, to może się faktycznie przydać.</p>
* Marsjanin (2011-02-18 20:20:48): <p>Otóż to. XMPP jest właśnie na hosted.im (a
  jak to padnie to są inne, wystarczy mieć backup rostera i dostęp do DNS). Z
  kolei ciężko, żebym płacił za hosting mojej strony WWW, skoro mam tam jedynie
  coś w rodzaju wizytówki do zamieszczania na forach czy innych takich. A
  domena? Hmm, no mam ją od już dość dawna… albo i dłużej. :)</p>
* KP (2011-02-18 21:09:54): <p>No to czekam aż uznają któregoś bloga na joggerze
  za szkodzącego dobrobytowi USA :-)</p>
* Anonim (2011-02-20 22:25:56): <p>jogger.pl to domena polska, więc mogą uznawać
  co chcą.</p>
* Remigiusz 'lRem' Modrzejewski (2011-02-20 22:29:03): <p>Mylisz się. Jogger.pl
  z racji używanych DNS-ów jest pod jurysdykcją Niemiecką ;)</p>
* seo vps (2014-09-24 06:42:28): <p>Excellent beat ! I would like to apprentice
  even as <br /> you amend your web site, how could i subscribe for a weblog <br
  /> website? The account helped me a applicable deal. <br /> I have been a
  little bit familiar of this your broadcast offered vivid transparent
  concept</p>
* water softener-- lusting (2014-10-29 18:29:41): <p>Hello! Do you use Twitter?
  I'd like to follow you if that would be okay.<br /> I'm absolutely enjoying
  your blog and look forward to new updates.</p>
* Sophie (2014-12-18 19:44:38): <p>I'm truly enjoying the design and layout of
  your site.</p>  <p>It's a very easy on the eyes which makes it much more
  enjoyable for me <br /> to come here and visit more often. Did you hire out a
  <br /> developer to create your theme? Fantastic work!</p>
