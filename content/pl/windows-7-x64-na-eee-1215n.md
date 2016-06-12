+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-10-20T00:23:53"
draft = false
title = "Windows 7 x64 na EEE 1215N"
+++
MLP zakupiła w dniach ostatnich dniach netbooka Asus EEE 1215N. Sprzęt dość
zacny, zwłaszcza biorąc pod uwagę cenę... Której składnikiem był brak
preinstalowanego systemu. Stąd też na mnie spadł zaszczyt użerania się z
władowaniem na toto Windowsa 7. W ramach masochizmu w wersji 64bit, z którą
nie lubi się Asusowy instalator sterowników. Mimo wszystko udało się zakończyć
pełnym sukcesem. Poniżej prawidłowa lista czynności, które należało wykonać
(osiągnięte metodą prób i błędów).

### Instalacja Windows 7

Ja miałem to szczeście, że mogłem pożyczyć od siostry nagrywarkę DVD na USB i
bez zbędnego kombinowania skorzystać z obrazu płyty z MSDNAA. Acz ponoć
Windows 7 nie stwarza problemów przy instalacji z pendrive'a, więc nie trzeba
szukać dziwnego sprzętu.

### Instalacja sterowników z płyty

Asus dołącza płytę pozwalającą na instalację wszystkich bajerów jednym
kliknięciem… O ile systemem jest W7 **32bit**. W przypadku systemu o
prawidłowej szerokości słowa odmawia on współpracy. _Mimo to_ znaczna część
sterowników jest w wersji pod **x64**.

Lista sterowników do wyklikania z płyty ma się jakoś tak:

  * drivers/ahci/install/setup.exe
  * drivers/kbfilter/hotkeyservice/setup.exe
  * drivers/bluetooth/install/setup.exe - trzeba wyklikać BT on (Fn+F2 kilka razy )
  * drivers/chipset/setup.exe
  * drivers/lan/atheros/setup.exe
  * drivers/touchpad/setup.exe
  * drivers/wlan/ne785h_ge112h/install_cd/setup.exe
  * software/suphybridengine/setup.exe

W tym miejscu niezbędny już był _reboot_ systemu. Po którym system **sam
postanowił zrestartować się jeszcze raz**, by dokończyć instalację. Cóż...

### Sterowniki z Windows Update

Z tego miejsca poszło z góry. Windows Update samo pociągnęło resztę
potrzebnych rzeczy, wliczając w to sterowniki do obu kart graficznych. Warto
przy tej okazji przyjrzeć się ustawieniom w Nvidia Control Panel. Optimus
fajny jest, ale warto przypilnować, by nie zeżarł nam zbytnio baterii. I
pamiętać, że jeśli grafika się tnie, to trzeba jednak tą lepszą kartę
uruchomić.

### Programy

Małżonka zażyczyła sobie skromnej listy, dość osobiste, ale nie chce mi się w
razie czego szukać w różnych miejscach ;)

  * Firefox
  * Putty
  * WinSCP
  * VLC
  * 7zip
  * Gajim
  * Visual Studio 2008
  * QT Creator
  * OpenCV
  * TortoiseSVN
  * VIM
  * Inkscape
  * GIMP
  * Hugin
  * TeXlive
  * OpenOffice.org
  * Antywirus

# Komentarze

* Zal (2010-10-20 00:39:14): <p>Podzielicie się za jakiś czas wrażeniami
  dotyczącymi użytkowania tego sprzętu?</p>  <p>Swoją drogą, dostarczona lista
  jest bardziej osobista niźli by się mogło to wydawać - nie tylko geek chic,
  ale też wyznawczyni VI VI VI ;]</p>
* Remigiusz 'lRem' Modrzejewski (2010-10-20 00:49:16): <p>Podzielimy się o ile
  się przypomnisz. Z pierwszych wrażeń najbardziej pozytywne było, że w końcu
  jej gry działają bez cięcia (miała 15" HP z GMA 950 - kloc na którym o World
  of Goo nie ma co marzyć), najbardziej narzekała na touchpada (który i tak jest
  największym touchpadem z dotychczasowych EEE).</p>
* Grzegorz (2010-10-20 08:12:19): <p>Od dłuższego czasu nie szukam już
  sterowników na płytach, korzystam z DriverMagic, który pozwala pobrać
  najnowsze wersje z internetu, a później wydobyć je z systemu i zintegrować z
  obrazem dysku instalacyjnego systemu, który w razie potrzeby można nagrać lub
  zapisać na pendrive'ie ;)</p>  <p>Dodam, że DM potrafi przygotować zestaw
  sterowników niezbędnych przy migracji z jednej wersji systemu na inny, np. z
  Windows XP x86 na Windows 7 x64, czy potrafi uprzyjemnić instalację systemu na
  nieco starszych maszynach.</p>
* Ktos (2010-10-20 09:15:13): <p>Instalacja Windows 7 z pendrive to proste -
  jest programik od Microsoftu, który sobie z ISO sam zrobi bootowalnego
  pendrive.</p>  <p>Ja jednak od kilku instalacji robię coś bardziej geekowego -
  mam pendrive z Windows PE x64. Z niego startuję, montuję zasób sieciowy z
  zawartością płyty instalacyjnej i wydaję komendę "setup.exe". Instalacja leci
  po sieci. Różne systemy, w różnych wersjach. Nawet na Fast Ethernecie nie trwa
  to zbyt długo.</p>  <p>Swoją drogą normalna instalacja z pendrive jest
  znacznie szybsza od instalacji z płyty.</p>
* Remigiusz 'lRem' Modrzejewski (2010-10-20 10:34:51): <p>No właśnie z tą
  szybkością pendrive'ów widzę jakieś jaja. Tuż po zakupie są niby szybkie, ale
  te kilka które mam w domu spadło już z prędkością do około 1-2MB/s. To jednak
  trochę wolniej niż DVD.</p>
* GiM (2010-11-01 10:53:44): <p>VS2008 - RESCEPT!<br /> vim na liście - TLP jest
  lepsza niż jakieś 70% znajomych z (mojej) pracy ;-)</p>  <p>Co do penów, to
  podpisuję się pod tym co lRem pisze, chyba że to kwestia tego, że ten z
  którego aktualnie korzystam, to jakiś badziewny noname :]</p>
* Remigiusz 'lRem' Modrzejewski (2010-11-05 14:49:52): <p>Ona ma Corsair
  Voyager, który po chyba roku zaczął walić w dmesgu błędami... Lepiej niż mój
  Corsair Survivor, który po niecałym roku po prostu przestał działać (zero
  odzewu po wepchnięciu w port). Zdecydowanie wolę dyski twarde na USB, jeszcze
  żaden mnie nie zawiódł.</p>
* ej (2010-11-19 16:11:24): <p>Cześć, tez mama 1215n i windows 7 64bit i kicha:(
  .Pomocy,  nie mogę uruchomić bluetooth'a. Sterowniki na płycie nie chcą
  pracować z tą wersją. Ja sobie poradziliście z tym?</p>
* Remigiusz 'lRem' Modrzejewski (2010-11-19 18:28:19): <p>W notce stoi:</p>
  <blockquote>   <p>drivers/bluetooth/install/setup.exe - trzeba wyklikać BT on
  (Fn+F2 kilka razy )</p> </blockquote>  <p>Miałem przez to na myśli to, że
  najpierw trzeba klikać Fn+F2 aż do włączenia BlueTootha. Dopiero gdy jest on
  włączony można zainstalować sterownik z podanego katalogu na płytce. U nas w
  każdym razie zadziałało.</p>
* KaiserWaltzer (2010-12-09 19:23:07): <p>Działa!!!!<br /> Chłopie, jesteś
  Wielki, jesteś Mistrzu i moja MLP na pewno nie będzie wyrażała głębokiego
  niezadowolenia w dobitnych trzech słowach ...<br /> :-)</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-09 20:43:26): <p>Miło mi :)</p>
* ASz (2010-12-27 15:54:02): <p>Zrobiłem install od nowa wersji 64 bitowej,
  zainstalowałem ręcznie te sterowniki które Pan wskazał, nie mogłem sobie
  poradzić tylko z grafika ION2. Update Win zrobiłem ale dalej nic... więc
  wybrałem ręcznie co ma Update pościągać i widzę, że są stery on ION-a. Super!
  Wszystko śmiga!</p>  <p>Dziękuję bardzo za pomoc! Gdybym, tego nie czytał, to
  dalej tkwiłbym w 32 bitowej wersji.</p>  <p>Polecam 64 bitową, widzę różnicę w
  działaniu! Aż miło się pracuje!<br /> 4 GB Ramu robi swoje!</p>
  <p>Pozdrawiam.</p>
* Maciasz (2011-03-12 00:29:49): <p>Mam problem z instalacją Windows 7 x86 Pro
  ściągniętą z MSDNAA, ponieważ instalator nie widzi dysku twardego. Może ktoś
  spotkał się z podobnym problemem?</p>
* Carley (2014-10-07 09:46:59): <p>It is the best time to make some plans for
  the future and it is time to be happy.<br /> I have read this post and if I
  could I desire to <br /> suggest you some interesting things or advice. Maybe
  you can write next articles referring to this <br /> article. I wish to read
  more things about it!</p>
* clash of clans hack android apk (2015-01-03 12:28:56): <p>I believe that is
  one of the so much significant information for me.<br /> And i'm glad studying
  your article. But want to commentary on some normal issues, The site style <br
  /> is perfect, the articles is in reality great : D. Good activity, cheers</p>
* facebook (2015-01-09 22:01:33): <p>Spot on with this write-up, I absolutely
  feel this site needs far more attention. I'll probably be returning to read
  more, thanks <br /> for the info! ﻿facebook<br /> ﻿facebook</p>
* instagram (2015-01-18 23:59:33): <p>You really make it seem so easy with your
  presentation but I find this topic to be actually something <br /> that I
  think I would never understand. It seems too complex and extremely broad for
  me.<br /> I'm looking forward for your next post, <br /> I will try to get the
  hang of it! instagram<br /> instagram<br /> instagram</p>
* youtube (2015-01-20 08:23:11): <p>Thanks on your marvelous posting! I really
  enjoyed <br /> reading it, you could be a great author.I will always bookmark
  your blog and will often come back from now on. I <br /> want to encourage you
  continue your great posts, have a nice afternoon! youtube<br /> youtube<br />
  youtube</p>
* youtube (2015-02-25 00:47:15): <p>I just could not leave your web site before
  suggesting that I extremely loved the usual info an individual provide to your
  guests?<br /> Is going to be back ceaselessly to check out new posts.<br />
  youtube<br /> youtube<br /> youtube</p>
* instagram (2015-03-05 10:20:33): <p>I do not even know how I ended up here,
  but I thought this <br /> post was good. I do not know who you are but
  definitely you are going to a famous blogger if you are not <br /> already ;)
  Cheers! instagram<br /> instagram</p>
* facebook (2015-03-08 01:13:30): <p>Wow, superb weblog layout! How long have
  you ever been running a <br /> blog for? you make blogging look easy. The
  entire <br /> look of your website is excellent, let alone the content
  material!</p>  <p>﻿facebook<br /> ﻿facebook</p>
* jasa copy vcd (2015-04-02 20:26:04): <p>Nice replieѕ in return of this
  difficulty with firm arguments and telling all on the topic of that.</p>
* copy vcd (2015-04-03 16:54:20): <p>I know this іf off topіc but I'm looking
  іnto starting my own weblog and <br /> was curious what all is needed to get
  setup? I'm assuming having a <br /> blog lіke yours աoսld cost a pretty penny?
  I'm <br /> not very internet savvy so I'm not 100% suгe. Any suggestions or
  adѵice would be greatly appreciated.<br /> Kudos</p>
* Health (2015-05-24 07:49:52): <p>I don't know if it's just me or if everyone
  else experiencing problems with your blog.<br /> It seems like some of the
  text on your posts are running <br /> off the screen. Can somebody else please
  comment and let me know if this <br /> is happening to them too? This might be
  a issue with my <br /> browser because I've had this happen previously.
  Appreciate it</p>
* buy instagram (2015-05-26 07:40:18): <p>I'm extremely inspired together with
  your writing <br /> talents and also with the structure in your blog. Is that
  this a paid subject or did you customize it your self?<br /> Either way keep
  up the nice quality writing, it is rare to look <br /> a nice weblog like this
  one these days..</p>
* weight loss acupuncture reviews (2015-06-17 06:29:31): <p>This is definitely a
  practical and convenient strategy to <br /> lose pounds for those who will
  always be for the go. It's <br /> the mental picture you have of how you think
  that you peer to others.<br /> My wife hasn't in their previous 40 years of
  life ever struggled with your ex weight.</p>
* get thousands of instagram likes (2015-06-30 12:01:48): <p>Pretty! This has
  been an extremely wonderful article.<br /> Thanks for supplying these
  details.</p>
