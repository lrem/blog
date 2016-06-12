+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2012-07-19T10:19:18"
draft = false
title = "Ośmiowątkowość"
+++
Wpis ten przeleżał zdecydowanie za długo jako szkic...

Albo, by być w zgodzie z technikaliami, ośmioprocesowość. Otóż symuluję sobie
działanie sieci _peer-to-peer_. Algorytmy sterujące zrobiły się trochę
zasobożerne, więc już przy 100 maszynach w rzeczonej sieci czas w symulacji
płynie wolniej niż na zegarze ściennym. Mając sporo godzinnych symulacji do
zrobienia, niespodzianka, uruchamiam je równolegle. Przy okazji zyskałem
możliwość pochwalenia się, co potrafi 8 wątków sprzętowych w i7 zainstalowanym
w MacBook Pro.

![Ośmiowątkowość](http://maxnet.org.pl/~lrem/osmiowatkowosc.png)

Nie będę się rozpisywał o tym, jak działają owe wątki sprzętowe. Ważna jest
informacja, że procesor zawiera cztery równorzędne rdzenie. Każdy rdzeń zaś
zawiera zdublowany _pipeline_ (jak to właściwie powiedzieć po Polsku?), jednak
tylko z jedną kompletną _ALU_. W efekcie w danym momencie wykonywana jest
tylko jedna operacja. Zysk pojawia się, gdy potrzebny jest dostęp do pamięci,
kiedy to jedna operacja czeka i można wykonywać drugą. Więcej poczytać można
na [Wikipedii](http://en.wikipedia.org/wiki/HyperThreading). Tutaj
zaprezentuję szybkie spojrzenie na to, jak to działa w moim przypadku.

Mam więc program który potrafi rozdzielać robotę między pulę procesów.
Działania programu nie będę teraz opisywał, poza dwoma ważnymi szczegółami. Po
pierwsze, procesy pracują zupełnie niezależnie, łączenie wyników ich działań
następuje w masterze po zakończeniu obliczeń. Po drugie, można kontrolować ich
liczbę z linii poleceń.

Bez owijania w bawełnę, oto wyniki:

    
    
    
    $ echo yes | time ./streaming/script/run_series.py \
    	streaming/config/prime.py out -C -p 1 -l 100000
    
    Removing out, continue? 
    ./streaming/script/run_series.py 
    streaming/config/prime.py out -C -p 1 -l  
    178.37s user 0.22s system 100% cpu 2:58.52 total
    
    $ echo yes | time ./streaming/script/run_series.py \
    	streaming/config/prime.py out -C -p 4 -l 100000
    
    Removing out, continue? 
    ./streaming/script/run_series.py 
    streaming/config/prime.py out -C -p 4 -l  
    200.00s user 0.31s system 357% cpu 56.065 total
    
    $ echo yes | time ./streaming/script/run_series.py \
    	streaming/config/prime.py out -C -p 8 -l 100000
    
    Removing out, continue? 
    ./streaming/script/run_series.py 
    streaming/config/prime.py out -C -p 8 -l  
    338.27s user 0.57s system 684% cpu 49.516 total

Dodałem trochę białych znaków dla czytelności...

Jak widać HT działa. W tym konkretnym przypadku obliczenia wykorzystując HT
idą 11.68% czasu krócej niż po prostu używając wszystkich rdzeni. Czysty efekt
HT oceniałbym jednak trochę wyżej, z dwóch powodów. Po pierwsze, test
wykonałem na laptopie, na którym działo się kilka innych rzeczy. Po drugie, z
wyników można się domyślać, że każdy proces ma _overhead_. Odejmując czas
procesora dla jednego procesu od czasu dla czterech procesów i dzieląc przez
te trzy dodatkowe procesy, widzimy że wychodzi 7 dodatkowych sekund na proces.
Gdyby odjąć te 7 sekund od ostatecznego czasu HT, wyszłoby nam około 25% zysku
z użycia HT. Czyli z grubsza tyle, ile sugeruje Intel.

# Komentarze

* Caladan (2012-07-19 10:26:37): <p>Pipeline w procesorze to potok.<br /> To
  ciekawe, może i ja zrobię test czasu wykonywania obliczeń przez mój soft w
  wersji n i 2*n wątkowej na i7-920 i i5-25xx?</p>
* Remigiusz 'lRem' Modrzejewski (2012-07-19 10:27:00): <p>i5 chyba nie ma
  HT?</p>
* Caladan (2012-07-19 10:27:58): <p>MacBook Air 13' z 2011 ma core i5 i ma
  HT.</p>
* Caladan (2012-07-19 10:29:39): <p>O taki:
  http://ark.intel.com/products/54620</p>
* Zal (2012-07-19 11:09:20): <p>W naszym projekcie, który realizuje intensywne
  obliczenia na strumieniach audio-wideo przyrost wydajności z tytułu HT nigdy
  nie przekroczył 10%. Ale i tak lepiej mieć te 10%, niż ich nie mieć. </p>
  <p>PS. Na każdym węźle korzystamy z dwóch procesorów Xeon L5640 (po 6 rdzeni
  fizycznych) taktowanych zegarem 2.27GHz.</p>
* Caladan (2012-07-19 11:10:32): <p>@Zal: pewnie dlatego, że robicie obliczeń
  dużo, a skoro jest tylko jedno ALU (a więc pewnie i jedna jednostka MMX/SSE),
  to czego się spodziewać? A co dokładnie robicie z tymi danymi AV?</p>
* Zal (2012-07-19 11:16:54): <p>@Caladan: Kodowanie i dekodowania audio-wideo
  plus wszelkiego rodzaju analiza poszczególnych klatek pod kątem interesujących
  nas elementów. Przy czym staramy się oddzielić węzły obsługujące kodeki od
  węzłów dokonujących analizy.</p>  <p>Musiałbym poszukać raportów z testów
  wydajnościowych, ale w ogólności, w naszym przypadku sporą rolę odgrywa
  również właściwe wykorzystanie cache i pamięci operacyjnej. Szczególnie jednak
  cache.</p>
* lrem (2012-07-19 12:10:19): <p>No to jednak spora różnica wynika z problemu.
  Ja tutaj mam przede wszystkim masę dostępów do pamięci, prawie zerowa
  lokalność...</p>
* sprae (2012-07-19 17:26:34): <p>Ja nie wiem czy można dziś mówić o potokach.
  Są 3 dekodery instrukcji, a jednostek wykonawczych jest 5 (2x ALU, FPU, LOAD,
  STORE).<br /> Wydaje mi się że dużo większą rolę gra w HT wyższa abstrakcja
  mapowania rejestrów. :-)</p>
* rozie (2012-07-19 22:51:56): <p>Nawet i3 ma HT...</p>
* tee shirts online australia (2014-05-18 13:07:28): <p>I really like what yoou
  guys are usually up too.</p>  <p>Thhis type of clever work and coverage! Keep
  up the amazing works guys <br /> I've included you guyus tto my blogroll.</p>
* Koishop (2014-08-29 13:27:29): <p>Howdy I am so excited I founnd your blog, I
  really found you by mistake, while I was looking on Aol for something else,
  Nonetheless I am here now <br /> and would just like to say thank you for a
  fantastic post andd a alll round <br /> thrilling blog (I also love tthe
  theme/design), I don't have <br /> time to browse it all at the minute but I
  have saved it and alxo added your RSS feeds, so when I have time I will be
  back to read more, Please <br /> doo kep up the excellent work.</p>
* Stegplatten kaufen (2014-08-29 14:08:19): <p>I got this web site from my buddy
  who told me about this <br /> website annd at the moment this time I amm
  visiting this sie and reading very informative content here.</p>
* LKW Transport (2014-09-20 20:12:47): <p>Wonderful beat ! I wish to apprentice
  while you amend your website, how can i subscribe for a weblog <br /> website?
  The account aided me a applicable deal.</p>  <p>I were a little bit familiar
  of this your broadcast offered vivid clear concept</p>
* maxi skirt (2014-11-03 02:02:07): <p>The pattern firms have made it pretty
  easy for starting sewers.</p>
* m88 (2014-11-10 18:27:49): <p>Howdy! Someone in my Myspace group shared this
  site with us <br /> so I came to take a look. I'm definitely loving the
  information. I'm book-marking and will be tweeting this to my followers!<br />
  Excellent blog and terrific design and style.</p>
* dragon city hack tool (2014-11-10 21:33:00): <p>In playing the video game you
  will certainly be breeding <br /> dragons.</p>
* rencontre (2014-11-12 23:36:37): <p>First of all I would like to say awesome
  blog! I had a quick <br /> question that I'd like to ask if you don't mind. I
  was interested to find out <br /> how you center yourself and clear your
  thoughts before <br /> writing. I have had a tough time clearing my thoughts
  in getting my <br /> thoughts out. I do enjoy writing however it just seems
  like the first 10 to 15 minutes <br /> are lost just trying to figure out how
  to begin. Any suggestions or tips?<br /> Thanks!</p>
* http://clubpenguincodefree.com (2014-11-22 10:51:17): <p>You're actually still
  wearing the items you place on previously when you're viaing this.<br />
  They're presented as Shadow Ninja things only for you.</p>
* How Can I Get Fifa 14 Coins (2014-11-23 21:55:19): <p>Today, I went to the
  beach front with my kids.</p>  <p>I found a sea shell and gave it to my 4 year
  old daughter <br /> and said "You can hear the ocean if you put this to your
  ear." She placed the shell to <br /> her ear and screamed. There was a hermit
  crab inside and it pinched her ear.<br /> She never wants to go back! LoL I
  know this is totally off topic but I had to tell someone!</p>
* Cheat Tool (2014-12-18 17:19:36): <p>Woah! I'm really loving the
  template/theme <br /> of this site. It's simple, yet effective.</p>  <p>A lot
  of times it's challenging to get that "perfect balance" between usability and
  visual appeal.</p>  <p>I must say that you've done a great job with this.<br
  /> In addition, the blog loads super quick for me on Opera.<br /> Excellent
  Blog!</p>
* Cheat Tool (2014-12-18 17:19:47): <p>Woah! I'm really loving the
  template/theme of this site.<br /> It's simple, yet effective. A lot of times
  it's challenging to get <br /> that "perfect balance" between usability and
  <br /> visual appeal. I must say that you've done a great job with this.</p>
  <p>In addition, the blog loads super quick for me on Opera.</p>  <p>Excellent
  Blog!</p>
* hack facebook accounts (2014-12-21 23:23:07): <p>A boyfriend or girlfriend
  might want to see exactly what their counterpart is doing behind their
  back.</p>
* boom beach hack no download (2014-12-23 10:26:32): <p>All the questions are
  simple as well as take just around 1-2 minutes to finish.<br /> So If you
  actually wish to be the most effective, then attacked the button to download
  and install.<br /> I'm very sure numerous of you will post below why we've
  submitted the <br /> hack cheat by quiz?</p>
* Daily Deal Websites (2014-12-30 08:09:33): <p>The company also follows the
  sustainable practices they expect from their vendors by utilizing recycled
  packaging material,<br /> recycled and unbleached paper, encourage deliveries
  over the usps, <br /> etc. Touuching to the maiin goal of the dailly deal
  aggregator website, be thhe one stop shop for <br /> all daily deals, a
  primary goal that yyou can have iss tto continually <br /> make a geo-targeted
  listing of prospects interested to listen forr abojt the <br /> dels featured
  on your internet site. The daily dea sites charges the vendors a hefty <br />
  commission (typically) when deals arre sold.</p>
* Jasmine (2015-01-09 05:08:48): <p>Hello there! This is my first visit to your
  blog! We are a group <br /> of volunteers and starting a new initiative in a
  community in the same niche.<br /> Your blog provided us useful information to
  work on. You have done <br /> a extraordinary job!</p>
* get the facts (2015-01-14 17:59:32): <p>You're so cool! I don't think I've
  read anything like that before.<br /> So good to find someone with some
  original <br /> thoughts on this issue. Really.. many thanks for starting this
  up.<br /> This website is one thing that is needed on the web,<br /> someone
  with a little originality!</p>
* fur Coats (2015-01-17 23:54:52): <p>Can Ӏ simply just say what a rеlief to fin
  an individual who rеally knows what they are discussing on the web.</p>
  <p>You certainly understand how tо bring a problem to <br /> light and make it
  important. Moгe and more peоple should reaԀ this <br /> and undеrstand this
  side of thhe story. I աas sսrprised you aren't more popular <br /> giѵen thɑt
  you definitely have the gift.</p>
* google apps fresno state (2015-01-20 07:16:33): <p>It is in reality a great
  and useful piece of <br /> info. I'm happy that you simply shared this useful
  info with <br /> us. Please stay us informed like this. Thanks for
  sharing.</p>
* hack a facebook account online (2015-01-28 11:28:04): <p>If you have returned
  for your online messenger, you find that you aren't access to your
  webmail.</p>
* paid for online surveys (2015-02-05 15:33:34): <p>Your mode of telling the
  whole thing in this post is genuinely nice, all be capable of easily <br />
  understand it, Thanks a lot.</p>
* cash paid surveys (2015-02-06 12:45:06): <p>Your style is really unique
  compared to other folks Ihave <br /> read stuff from. Many thanks for posting
  when you have the opportunity, Guess I will just book mark this page.</p>
* מנעולן פורץ (2015-02-12 16:36:05): <p>Excellent site. Plenty of useful info
  here. I'm sending it to <br /> some buddies ans additionally sharing in
  delicious. And <br /> naturally, thanks on your sweat!</p>
* מנעולן גבעתיים והסביבה יצאת צדיק (2015-02-17 10:33:05): <p>Yes! Finally
  something about locksmith.</p>
* צילינדר באזור הוד השרון (2015-02-17 10:50:14): <p>You have made some good
  points there. I checked on the internet <br /> for more information about the
  issue and found <br /> most people will go along with your views on this web
  site.</p>
* small business internet marketing (2015-02-18 11:19:15): <p>My brother
  suggested I might like this blog. He was entirely right.</p>  <p>This submit
  truly made my day. You can not believe simply how so much time I had spent for
  this info!<br /> Thanks!</p>
* professional microphones for singing liv (2015-02-18 17:04:25): <p>The signal
  path is the path that the audio takes from the microphone to get <br /> into
  the computer, and what occurs along the way.</p>
* generic cialis in canada (2015-02-18 22:52:07): <p>Hi there it's me, I am also
  visiting this website daily, this site is really nice and the visitors are
  actually sharing nice thoughts.</p>
* Wellington Workout (2015-02-19 07:13:43): <p>Highly energetіc post, I enjoyed
  tɦat a lot. Wіll <br /> tɦеre be a pqrt 2?</p>
* קורס מנעולנים גבעת-שמואל (2015-02-20 04:21:55): <p>Appreciating the
  persistence you put into your blog <br /> and in depth information you
  provide. It's nice to come across <br /> a blog every once in a while that
  isn't the same old rehashed information. Fantastic read!<br /> I've saved your
  site and I'm including your RSS feeds to my Google account.</p>
* CASINO (2015-02-20 04:28:47): <p>This post presents clear idea in favor of the
  new people of blogging, that actually how to do running a blog.</p>
* clash of clans cheat (2015-02-20 22:54:46): <p>It's a shame you don't have a
  donate button! I'd certainly donate to this brilliant blog!</p>  <p>I guess
  for now i'll settle for book-marking and adding your RSS feed to my Google
  account.<br /> I look forward to brand new updates and will share this website
  with <br /> my Facebook group. Talk soon!</p>
* hotel discount codes holiday inn express (2015-02-22 08:46:55): <p>If it does,
  be sure that the breakfast is good enough in any other case you'll find
  yourself paying for the breakfast and <br /> never consuming it too.</p>
* model train sets walmart (2015-02-23 03:43:55): <p>In this series of free
  pastime videos, you'll learn to create your individual mannequin path
  village.</p>
* timmyejgc.wordpress.com (2015-02-27 04:28:18): <p>What i do not realize is in
  truth how you are not really much more neatly-appreciated than you might be
  <br /> now. You're very intelligent. You realize thus significantly on the
  subject <br /> of this topic, produced me in my view imagine it from a lot <br
  /> of various angles. Its like men and women don't seem to be interested
  unless it's something to do with Girl gaga!</p>  <p>Your own stuffs nice.
  Always take care of it up!</p>
* you could try these out (2015-02-27 07:35:39): <p>I'm truly enjoying the
  design and layout of your website.<br /> It's a very easy on the eyes which
  makes it much more <br /> pleasant for me to come here and visit more often.
  Did you hire out a designer <br /> to create your theme? Superb work!</p>
* Wagnermbcx.Wordpress.Com (2015-02-27 09:40:20): <p>What's up to all, how is
  the whole thing, I think every one is getting more from <br /> this website,
  and your views are pleasant <br /> for new visitors.</p>
* m88 (2015-02-27 22:30:06): <p>Heya i am for the first time here. I came across
  this board and I to find It truly useful &amp; it helped me out <br /> much. I
  am hoping to give one thing back and aid others uch as you aired me.</p>
* momporn (2015-02-28 07:51:50): <p>Link exchange is nothing else except it is
  simply placing <br /> the other person's website link on your page at suitable
  <br /> place and other person will also do similar for you.</p>
* click here for more (2015-02-28 19:31:14): <p>if you want free cheat and codes
  of brave frontier get hack here.</p>
* brave frontier (2015-02-28 19:32:35): <p>i am always there  for you and i
  would feel nice by helping you for gems and coins of the game.</p>
* sample cialis (2015-03-02 11:04:41): <p>I'm extremely pleased to uncover this
  site. I want to to thank <br /> you for ones time due to this wonderful read!!
  I definitely appreciated every part of it and i also have you bookmarked to
  look at new stuff on your <br /> web site.</p>
* borrow money till payday (2015-03-03 05:13:53): <p>Spot on with this write-up,
  I truly think this website <br /> needs a lot more attention. I'll probably be
  back again to see more, thanks for <br /> the advice!</p>
* m88 (2015-03-03 05:51:24): <p>I’m not that much off a internet reader to bbe
  honest but your <br /> blogs really nice, keep it up! I'll go ajead and
  bookmark your <br /> site to come back in tthe future. Many thanks</p>
* ninja saga hack cheat engine 6.3 2015 (2015-03-06 04:06:25): <p>Woah! I'm
  really enjoying the template/theme of this blog.<br /> It's simple, yet
  effective. A lot of times it's tough to get that "perfect balance" between
  usability and visual <br /> appearance. I must say you've done a very good <br
  /> job with this. Also, the blog loads very fast <br /> for me on Firefox.
  Excellent Blog!</p>
* thermal dynamics plasma cutter rebelmous (2015-03-08 15:18:34): <p>This is
  accomplished by starting with a super solid, fully <br /> welded base. The
  online retailer recently uploaded a picture of the bundle (which has now been
  taken down).</p>  <ul> <li>During plasma cutting operations do not move the
  work clamp.</li> </ul>
* canadian viagra (2015-03-12 13:15:06): <p>Excellent goods from you, man. I've
  understand your stuff <br /> previous to and you're just extremely
  wonderful.</p>  <p>I actually like what you've acquired here, really <br />
  like what you're saying and the way in which you say it.<br /> You make it
  enjoyable and you still care <br /> for to keep it smart. I can't wait to read
  much more from you.<br /> This is really a tremendous site.</p>
* Firoz Patel (2015-03-20 08:19:09): <p>I've been exploring for a bit for any
  high quality articles <br /> or weblog posts in this sort of area . Exploring
  in Yahoo I eventually stumbled upon this web <br /> site. Studying this info
  So i am glad to exhibit that I have an incredibly excellent uncanny feeling I
  came upon just what I needed.<br /> I most no doubt will make sure to do not
  fail to remember this site and give it a glance regularly.</p>
* organic skin care (2015-03-21 08:58:15): <p>Admiring the persistence you put
  into your blog and in epth information you present.<br /> It'sgood to come
  acrss a blog every once iin a while thgat isn't the same out of date rehashed
  information. Fantastic read!<br /> I've saved your site and I'm injcluding
  your RSS feeds <br /> to my Google account.</p>
* e-cigarette (2015-03-21 18:18:37): <p>Hello there! This post could not be
  written any better!</p>  <p>Looking through thiis post reminds me of my
  previous roommate!</p>  <p>He constantly kept preaching about this. I'll
  forward <br /> this post to him. Fairly certain he will have a great read.<br
  /> Thanks for sharing!</p>
* wiki.cubenation.tv (2015-03-22 10:42:07): <p>It's actually a great and useful
  piece of info.</p>  <p>I'm satisfied that you simply shared this helpful
  information with us.<br /> Please stay us up to date like this. Thanks for
  sharing.</p>
* windows 7 genuine activator (2015-03-24 09:27:20): <p>Really no matter if
  someone doesn't be aware of afterward its up to other people that they <br />
  will assist, so here it occurs.</p>
* Firoz Patel (2015-03-26 15:57:18): <p>I'm curious to find out what blog system
  you have been utilizing?<br /> I'm experiencing some small security problems
  with my latest <br /> website and I would like to find something <br /> more
  secure. Do you have any recommendations?</p>
* Master Agen Betting Terpercaya | Winenlo (2015-03-26 22:10:53): <p>Quality
  articles or reviews is the secret to interest the viewers to pay a <br />
  visit the website, that's what this website is <br /> providing.</p>
* Ken Fisher (2015-03-27 06:37:30): <p>Hello friends, fastidious post and nice
  urging commented here,<br /> I am truly enjoying by these.</p>
* cellulite (2015-03-27 07:01:35): <p>Greetings! Very useful advice within this
  article! It's the little changes which will make the most significant
  changes.<br /> Thanks a lot for sharing!</p>
* artlist.tw (2015-03-30 00:14:44): <p>Ik wil sowieso even reageren. Een betoog
  over de <br /> stoel lift.</p>
* Sanford (2015-03-30 21:24:05): <p>I have read so many articles or reviews
  about the blogger lovers but <br /> this post is truly a nice post, keep it
  up.</p>
* painter tampa fl (2015-04-03 03:32:44): <p>You could definitely see your
  skills in the article you write.<br /> The arena hopes for even more
  passionate writers like you who are not afraid to mention how they
  believe.</p>  <p>Always go after your heart.</p>
* &lt;a href=&quot;https://vn.answers.yahoo.com/qu (2015-04-09 05:12:26): <p>You
  are participating in club penguin game and want to become a member? We offer
  you a free code so you can is Membership, you will easily Access all features
  in Club Penguin apps, Play more mini-game levels and earn rare quest Prizes,
  Collect clothing, items, and adopt up to 75 pets and Unlimited access to new
  content every month. You will be arbitrarily selected as a member free 1
  Month, 6 Month and 12 months.<br /> &lt;a href="https://vn.answers.yahoo.com/q
  uestion/index?qid=20150408195402AAEiyTz"&gt;Free Club Penguin Membership
  Codes&lt;/a&gt;</p>
* Reefs2Go (2015-04-11 15:54:46): <p>Thanks for a marvelous posting! I actually
  enjoyed reading it, you <br /> could be a great author.I will always bookmark
  your blog and <br /> may come back later in life. I want to encourage you to
  continue your great work, have a <br /> nice afternoon!</p>
* car title loans (2015-04-12 20:01:58): <p>We encourage responsible borrowing
  website traffic <br /> loans carry a fast payoff schedule. Make sure you are
  clear as to the method that you will get them the pink slip and whether or
  otherwise not they wish <br /> to physically see the vehicle.</p>
* title loans san antonio texas (2015-04-13 18:42:33): <p>Generally loan amounts
  and interest levels are determined about the basis of market value <br /> with
  the car and past driving history. If you answer "no" to <br /> at least one in
  the questions, it will be better to postpone obtaining car <br /> loans.</p>
* ft lauderdale CPAs (2015-05-01 16:19:06): <p>Сorporate Taxes: All business
  structures pay taxes on the income made in that particular business.<br /> If
  you havе received IRS taҳ notice, you need not tо be panic.<br /> This method
  pts are crսcial inside working <br /> with a defined talent management
  strategy.</p>
* займы онлайн (2015-05-16 09:22:16): <p>Работая со всеми в обращениимир
  финансово сильные удары ,идея надлежит только<br /> о всех, чтобы оценить
  темпычеловека и смотреть их , таких , как ястреб.</p>
* online prescription (2015-05-29 23:18:22): <p>I take pleasure in, lead to I
  found just what I was looking for.<br /> You've ended my 4 day long hunt! God
  Bles you man. Have a <br /> great day. Bye</p>
* epsetkd.dr.beta.ekt.gr (2015-06-19 10:46:32): <p>Set up Outlook to deliver and
  receive emails and <br /> customize it.</p>
* wonder clicks reviews (2015-07-08 12:17:19): <p>When I originally commented I
  clicked the "Notify me when new comments are added" checkbox and <br /> now
  each time a comment is added I get several e-mails with the same comment.<br
  /> Is there any way you can remove me from that service?<br /> Thanks a
  lot!</p>
* nufinity skin cream trial (2015-07-21 08:07:21): <p>What's up Dear, are you
  genuinely visiting this website on a regular <br /> basis, if so then you will
  without doubt take fastidious know-how.</p>
* free amazon gift card (2015-07-22 09:48:59): <p>I really loved reading your
  blog Thanks for searing it.</p>
* free amazon gift card (2015-07-22 09:51:08): <p>It was very well authored and
  easy to understand.</p>
