+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-03-06T12:33:43"
draft = false
title = "Microsoft znów zepsuł Internet?"
+++
Microsoft, jak wiadomo, czołowym innowatorem jest. Jak również ściśle
przestrzega standardów... No przynajmniej tych, które sam ustalił. Jak na
przykład RFC 3484. Zawiera ono zasadę, która ma w sumie dobry cel: wybieranie
przy translacji adresu tego wpisu, który odpowiada najbliższemu serwerowi.
Przydatne jeśli ktoś na poziomie DNS robi load balancing poprzez podanie kilku
wpisów A dla jednej domeny. Ale cóż, chcieli dobrze, wyszło jak zawsze.

Problemem jest algorytm wyboru najbliższego serwera - ten, z którym nasz IP ma
najwięcej wspólnych bitów prefiksu. W IPv6 jest to bardzo dobry pomysł. Jednak
w IPv4 wystarczy rzut oka na mapkę: [![XKCD map of the internet](http://imgs.x
kcd.com/comics/map_of_the_internet.jpg)](http://imgs.xkcd.com/comics/map_of_th
e_internet.jpg) Albo z własnego doświadczenia: mamy na tym samym łączu
podniesione adresy w klasach 78.x.x.x, 89.x.x.x, 91.x.x.x, mieliśmy wcześniej
62.x.x.x, a na zapasowym jeszcze 193.x.x.x. A o NAT przez litość nie
wspomnę...

Żeby nie było, że problem wyssany z palca, to proszę: [opis kogoś, komu spsuli
w ten sposób load
balancing](http://drplokta.livejournal.com/109267.html?thread=597203) Nie
ukrywam, że jest to w sumie źródło tego wpisu. Ciekawe jak teraz Google
zgwałcą standardy, żeby jednak działało dobrze :)

# Komentarze

* Remigiusz 'lRem' Modrzejewski (2009-03-06 12:37:50): <p>Żeby nie było - wiem,
  Microsoft tylko zaproponował to RFC, ustala IETF. Ale przypomnijcie sobie
  OOXML...</p>
* Dodek (2009-03-07 22:42:37): <p>Jak linkujesz do xkcd to linkuj do strony
  komiksu, a nie do samego obrazka - na xkcd ważny jest alt-text.</p>
* Remigiusz 'lRem' Modrzejewski (2009-03-08 20:52:53): <p>W tym przypadku
  zupełnie bez związku.</p>
