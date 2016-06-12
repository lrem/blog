+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2008-04-29T16:42:59"
draft = false
title = "Don't use borken hardware"
+++
Jakoś tak się złożyło, że wpadł w moje ręce kontroler **ITE 8212**. Jest to
kontroler _hardware raid_. W przeciwieństwie do obecnej dzisiaj w każdej
płytce _funkcji raid_ wykonywanej w sterowniku, IT8212 posiada własny procesor
RISC wykonujący wszystkie potrzebne operacje. Macierz widoczna jest dla reszty
komputera jako jeden zwykły dysk, wszystko działa szybko i stabilnie,
producent udostępnia sterownik również do Linuksa, wszyscy są szczęśliwi.
Szkoda, że tylko w reklamie.

Jak się okazuje, sterownik **Integrated Technologies** dostępny jest tylko dla
wersji 2.4. Nie jest to jednak powód do rozpaczy, bo w 2.6 można używać
całkowicie wolnego sterownika. Nawet dwóch.

Od momentu wprowadzenia nowego sterownika z [libata](http://linux-ata.org/)
próba jego użycia nieodmiennie kończy się komunikatem:  
`ata7.00: failed to IDENTIFY (INIT_DEV_PARAMS failed, err_mask=0x80)`  
Co od początku kwitowane było prostym ,,nie używaj _pata_it821x_''. Na wypadek
występowania jakiejś nadziei: [opiekunowie jądra tu nic nie
pomogą](http://www.mail-archive.com/linux-ide@vger.kernel.org/msg14452.html),
bo u nich działa i nie za bardzo wiadomo od czego ten błąd zależy.

Trzeba więc przejść na _blk_dev_it821x_. Tutaj i owszem, działa, ale jakoś tak
wolno... Poniższy kawałek mówi sam za siebie:

    
    
    lrem ~ # hdparm /dev/hda
    
    /dev/hda:
     multcount     =  0 (off)
     IO_support    =  0 (default 16-bit)
     unmaskirq     =  0 (off)
     using_dma     =  0 (off)
     keepsettings  =  0 (off)
     readonly      =  0 (off)
     readahead     = 256 (on)
     geometry      = 60801/255/63, sectors = 976773166, start = 0
    lrem ~ # hdparm -d1 /dev/hda
    
    /dev/hda:
     setting using_dma to 1 (on)
     HDIO_SET_DMA failed: Input/output error
     using_dma     =  0 (off)
    
    

Ten błąd jest już w jądrze dobrą chwilę. Jednak [nie zostanie
naprawiony](http://lkml.org/lkml/2007/5/15/113), bo po co tracić na to czas
jak pata_it821x działa bez zarzutu...

Sytuację mniej więcej ratuje cofnięcie się do starszej stabilnej wersji jądra,
w momencie pisania tego tekstu 2.6.16.60. Mniej więcej, bo ja akurat
potrzebuję patcha przygotowanego do znacznie nowszej wersji. Więc teraz sobie
radośnie backportuję... Ciekawe ile jeszcze takich niespodzianek kryje się w
jądrze?

# Komentarze

* D4rky (2008-04-29 18:28:45): <p>masakra :/</p>
* zen (2008-04-29 19:18:10): <p>ITE miały od zawsze dosyć złą opinię.
  Parafrazowałbym i powiedział: nieużywaj niesprawdzonego sprzętu ;)</p>
* lRem (2008-04-29 19:23:16): <p>Z pewnością całkiem zasłużyły na swoją opinię.
  Poza problemami ze sterownikiem jest jeszcze fajniejsza rzecz. Średnio raz na
  trzy rebooty wali toto błędem firmware'u i tylko odcięcie dopływu prądu jest w
  stanie pomóc.</p>
* omg (2008-04-29 22:13:53): <p>Co ma tytuł wpisu do treści?</p>
* lRem (2008-04-29 22:20:08): <p>To, że gdybyśmy się od razu zdecydowali na
  3ware to nie byłoby tych kłopotów. Ja wiem, że przedstawiłem tylko jeden
  aspekt jakim jest olanie sprawy przez twórców Linuksa. Ale błędy firmware'u,
  czy choćby bios w którym błędy językowe kłują w oczy, wskazują na ogólny
  poziom tego sprzętu.</p>
* trasz (2008-04-30 14:09:32): <p>To nie jest broken hardware, tylko broken
  sterownik.  Nie jestem pewien numerka, ale (chyba) taki sam kontroler pod
  FreeBSD i Windows sprawial dokladnie zero problemow.  Tytul powinien brzmiec
  &quot;Don't use broken operating systems&quot; ;-&gt;</p>
* lRem (2008-05-01 10:23:46): <p>Borken panie trasz, borken. I jednak hardware -
  znowu sypnął błędem w czasie ładowania biosu :/</p>  <p>Ale tak w sumie, to
  może zamiast walczyć z kernelem, powinienem pomyśleć o zmianie tego
  firmware?</p>
* lRem (2008-05-08 22:33:36): <p>No i wkręcony w tą samą maszynę, przy tym samym
  jądrze, 3ware Escalade zadziałał OOTB...</p>
