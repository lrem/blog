+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2008-04-22T16:16:01"
draft = false
title = "TclDtrace - zaakceptowane na GSoC"
+++
Wczoraj ogłoszone zostały zaakceptowane aplikacje na [Google Summer of
Code](http://code.google.com/soc/2008/). Znalazło się wśród nich moje [**TclDt
race**](http://code.google.com/soc/2008/tcl/appinfo.html?csaid=969545BEF27D3B8
B). Przyjęte zostały również wszystkie inne osoby z mojego roku (III rok
Informatyki na ETI PG): Krzysztof Blicharski z [Tcl/Tk Printing Support](http:
//code.google.com/soc/2008/tcl/appinfo.html?csaid=A338E58CC4F21F9B) oraz Anna
Pawelczyk z [Update Tk test system project](http://code.google.com/soc/2008/tc
l/appinfo.html?csaid=D951E0E919036ACB).

Dla świata oznacza to, że już w sierpniu będzie można Dtrace oskryptowywać
bezpośrednio w Tcl. Jak osoby zainteresowane technikalniami pewnie wiedzą,
[Dtrace](http://en.wikipedia.org/wiki/DTrace) jest całkiem nowym podejściem do
profilowania i instrumentacji w ogóle, zaimplementowanym już od jakiegoś czasu
w Solarisie i Mac OSX. Tcl zaś jest prostym językiem skryptowym, znanym
głównie ze swojego (dostępnego także dla innych języków) toolkitu o krótkiej
nazwie _Tk_. Razem daje to niemalże pewność, że tego lata zanczą się pojawiać
całkiem wygodne GUI do sprawdzania ,,co w serwerze piszczy''.

Przy okazji drobne spostrzeżenie: Solaris **z wewnątrz VMware** jest w stanie
zabić mi Linuksa. Nigdy wcześniej mi się to nie zdarzyło. Tutaj zaś wyznaczona
empirycznie szansa, że uda się powrócić z full screena, wynosi około 50%...
Korzystam z VMware server w wersji 1.0.4.56528.

# Komentarze

* Zal (2008-04-22 18:07:18): <p>Witaj Remik! ;D Gratuluję akceptacji aplikacji
  :] <br /> <br />Co do samego VMware to zauważyłem, iż u mnie (wersja ta sama,
  co u Ciebie) przed taką &quot;zwiechą&quot; pożera całą dostępną systemowi
  pamięć (a jest jej z 3 GiB) plus swapa ;&gt; Po kilku minutach można jednak
  nawet kursorem pomachać.</p>
* lRem (2008-04-22 18:17:27): <p>Dzięki :)</p>  <p>Pamięci nie pożera, właściwie
  wszystko działa pięknie ślicznie, poza ekranem. Ubicie wszystkiego dookoła
  VMware nie pomaga, dopiero ubicie X-ów daje szanse na zobaczenie
  czegokolwiek.</p>
* Radarek (2008-04-23 13:55:16): <p>A czy jest odpowiednik Dtrace pod linuksa?
  Albo czy planowany jest port tego narzędzia?</p>
* lRem (2008-04-23 21:03:41): <p>Opisywałem to chyba w którymś L+, może teraz
  napiszę coś więcej. W każdym razie trwają prace nad mechanizmem <em>kernel
  markers</em> który pozwoli na całkiem podobną instrumentację. Czy będzie to
  kompatybilne z DTrace - pojęcia na ten moment nie mam. Ale pewnie i to
  obadam.</p>
* jazz-standards.com (2014-08-11 04:30:54): <p>Hi, I check your new stuff on a
  regular basis.</p>  <p>Your story-telling style is witty, keep doing what
  you're doing!</p>
* easy way to gain Instagram followers (2014-08-12 18:27:42): <p>Hello there, I
  found your site by means of Google even as looking for <br /> a related
  matter, your site got here up, it appears to be like good.<br /> I've
  bookmarked it in my google bookmarks.</p>  <p>Hi there, simply changed into
  alert to your blog via Google,<br /> and found that it's really informative.
  I'm gonna watch out for brussels.<br /> I will be grateful should you continue
  this in future.<br /> A lot of other people can be benefited from your
  writing.</p>  <p>Cheers!</p>
