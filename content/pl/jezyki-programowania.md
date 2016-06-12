+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2011-06-13T13:30:22"
draft = false
title = "Języki programowania..."
+++
Pokutuje opinia, że _wystarczy nauczyć się myśleć, a potem pętla for wszędzie
wygląda podobnie_. Nawet jakieś doświadczenie ją niby potwierdza. Ale każdy o
odrobinę szerszych horyzontach wie, że nie jest to prawda. Języki funkcyjne
często nawet nie mają pętli, lecz wielu programistów nigdy nie miało z nimi
styczności. Ale to jeszcze nie jest ekstremum. Wkleję poniżej niby trywialny
kod w najdziwniejszym języku, w jakim zdarzyło mi się coś napisać. Żeby było
śmieszniej, język ten jest _industry standard_ w bardzo intratnej niszy.
Ktokolwiek rozpozna?

![Pic related](http://maxnet.org.pl/~lrem/jezykiRelated.jpg)

Pic related. Ale nie będę póki co zdradzał, w jaki sposób

Kod realizuje serio trywialną funkcję, napisany jest w najprostszy wynaleziony
przez nas sposób, by jeszcze być poprawnym według tutejszych standardów:

    
    
    node LameBarrier(A: bool; B: bool) returns (C: bool);
    var pA, pB: bool;
    let
        pA = false -> ((not(pre(C)) and pre(pA)) or A);
        pB = false -> ((not(pre(C)) and pre(pB)) or B);
        C = pA and pB;
    tel
    
    node Latch(A: bool; reset: bool) returns (V: bool);
    var pA: bool;
    let
        pA = false -> ((pre(A) and not reset) or A);
    tel
    
    node VerifyBarrier(A: bool; B: bool) returns (prop: bool);
    var AA, BB, res: bool;
    let
        res = LameBarrier(A, B);
        AA = Latch(A, pre(res));
        BB = Latch(B, pre(res));
        prop = (AA and BB) = res;
    tel

Na koniec dodam, że celem tego ćwiczenia (jeszcze na studiach) było
interfejsowanie tego cuda z C#. W połączeniu z magiczną biblioteką, której
mieliśmy używać po tamtej stronie, całość dawała ślicznego BSOD-a. Całości
perypetii nie pamiętam, ale rozwiązaliśmy to _crosskompilując_ pod Linuksem i
zmieniając coś w tak uzyskanej binarce. Było śmiesznie.

# Komentarze

* mag (2011-06-13 13:43:46): <p>Lustre
  (http://en.wikipedia.org/wiki/Lustre<em>(programming</em>language)) <br /> co
  wygrałem?</p>
* asdf (2011-06-13 13:44:41): <p>LUSTRE?</p>
* Remigiusz 'lRem' Modrzejewski (2011-06-13 13:45:20): <p>Byłaby może nagroda
  pocieszenia za drugie miejsce, ale nie pomyślałem przed wysłaniem zagadki,
  żeby sprawdzić jak łatwo to zgooglać :/</p>
* Tomasz Kowalczyk (2011-06-13 14:55:30): <p>"Pokutuje opinia, że wystarczy
  nauczyć się myśleć, a potem pętla for wszędzie wygląda podobnie." - Bo to jest
  prawda, jeśli przyjmiemy pewne założenia. Zdecydowana większość programistów
  porusza się jedynie w zakresie języków reprezentujących paradygmat
  imperatywny, a więc tam wszystko wygląda podobnie, czy to Pacal, C, C++, Java,
  PHP, C# i tak dalej. Jeśli zmienisz założenia, to takie stwierdzenie z zasady
  nie ma sensu, bo to tak, jak powiedzieć, że wszystkie okrągłe bułki są
  podobne, a potem dziwić się, że rogal jest inny.</p>  <p>Jeśli wejdziemy w
  sferę języków reprezentujących paradygmat logiczny, funkcyjny lub jakikolwiek
  inny niż imperatywny, to wspomniana "pętla" [albo inna konstrukcja językowa]
  także będzie wyglądać podobnie, aczkolwiek tylko i wyłącznie w danej grupie
  języków.</p>  <p>BTW. Jeśli poprawnie rozumiem "pic related", to wydaje mi
  się, że ten obrazek byłby znacznie lepszy: http://www.mytravelblog.pl/public/t
  h/wm/Kbee/resize/630x630/i/profiles/Kbee/BL1445611-154-A_taj08-Jezioro-
  Akiemskie.jpg . ;]</p>
* Remigiusz 'lRem' Modrzejewski (2011-06-13 15:04:47): <p>Acz też z wyjątkami. W
  takim Pythonie, który było nie było jest imperatywny, pętli trójargumentowej
  już nie uświadczysz. Ale nawet nie to jest ważne. Tutaj chodziło mi o
  istnienie innych klas języków, o czym nie każdy wcześniej wiedział. Na innym
  poziomie myśl ta jest zła, gdyż nawet już w językach tak podobnych jak C i C++
  występują spore różnice idiomatyczne, które wymagają jednak podejścia innego
  niż szukanie alternatyw do już znanych konstrukcji.</p>  <p>A co do obrazka:
  nie, Rosja zdecydowanie nie pasuje ;)</p>
* Tomasz Kowalczyk (2011-06-13 15:38:05): <p>Czy z wyjątkami - powiedziałem
  podobne, nie takie same. ;] Także to, że gdzieś są dwie wartości, a gdzie
  indziej trzy to jest szczegół implementacyjny. Ważne, że każda ma warunek
  końcowy, a odpowiednik pętli for ma też blok inicjalizacyjny. Ale to naprawdę
  są mało ważne rzeczy, a nie rdzeń kwestii, nad którą dyskutujemy.</p>
  <p>Zgadzam się z Tobą, że trzeba mieć świadomość istnienia innych języków i
  paradygmatów, bo to pozwala na poszerzenie horyzontów i w pewnym sensie
  wykorzystania koncepcji i zalet tamtych języków w naszych rozwiązaniach. Ja
  np. na studiach ćwiczyłem się w Prologu, co też otworzyło mi oczy na wiele
  innych kwestii, jakich normalnie bym nie przyswoił. Co do różnuc w C / C++ -
  mógłbyś rozwinąć? Bo jak dla mnie potraktowanie C++ jako "C z klasami" w
  większości przypadków daje radę.</p>  <p>Co do obrazka, miałem na myśli
  "Lustre" jako lustro wody. ;]</p>
* Remigiusz 'lRem' Modrzejewski (2011-06-13 15:43:21): <p>No właśnie to jest
  problem z C++ - ludzie postrzegają to jako "C z klasami", nazywają C/C++. To
  miał być nowy język z kompatybilnością wsteczną. Wyszedł stary język z nowymi
  dodatkami. Jest to jeden z podstawowych powodów, dla których skończył jako
  taki potworek. Ale o tym możnaby swobodnie całą książkę napisać…</p>  <p>A co
  do zdjęcia, chodzi w nim o inną inspirację nazwy, która oryginalnie
  przyświecała twórcom.</p>
* Tomasz Kowalczyk (2011-06-13 15:50:07): <p>To nie jest tak, że ja traktuję C++
  jako "C z klasami". Wiem, czym się różnią te języki, także użyłem tego
  sformułowania wyłącznie w kontekście potencjalnego programisty, który myśląc w
  ten sposób myli się, aczkolwiek do programowania nie jest mu to aż tak
  potrzebne. A kompatybilność wsteczna to chyba najgorsza zmora "współczesnych"
  języków / technologii. Chciałoby się zrobić coś nowego, a tu zonk - nie
  zadziała dwie wersje wstecz.</p>
* torero (2011-06-13 17:26:41): <p>Lustre.</p>  <p>Jaka jest nagroda za trzecie
  miejsce? Czy są wyróżnienia? :D</p>
* Video Production Price List Toronto ON (2014-05-30 11:39:39): <p>Hey, I think
  your blog might be having browser compatibility issues.<br /> When I look at
  your blog in Safari, it looks fine but when opening in Internet Explorer,<br
  /> it has some overlapping. I just wanted to give you a quick heads up!<br />
  Other then that, wonderful blog!</p>
* alteril en pharmacie (2014-06-22 03:15:37): <p>whoah this weblog is excellent
  i love reading your articles.<br /> Keep up the great work! You recognize, a
  lot of individuals are searching around for this information, you can help
  them <br /> greatly.</p>
* dvr wireless camera (2014-06-22 12:02:48): <p>Write more, thats all I have to
  say. Literally, it seems as though you relied on the video to make your
  point.<br /> You definitely know what youre talking about, why throw away your
  intelligence on just posting videos to your blog when you could <br /> be
  giving us something enlightening to read?</p>
* thespiffygames.weebly.com (2014-06-26 21:03:29): <p>you are actually a
  excellent webmaster. The site loading <br /> velocity is amazing. It seems
  that you're doing any distinctive trick.<br /> Also, The contents are
  masterpiece. you've performed a great <br /> process on this subject!</p>
* photo booth hire london weddings (2014-06-27 01:45:19): <p>I don't even know
  how I ended up here, but I thought this post was great.</p>  <p>I do not know
  who you are but certainly you're going to a famous blogger if you are <br />
  not already ;) Cheers!</p>
* car repair (2014-07-07 16:00:42): <p>Choose the best professional automotive
  technician to avoid <br /> vehicles breakdown. As a vehicle is driven, car
  accidents do happen but even more inevitably the working parts start to wear
  down and eventually fail.<br /> Your car lights should be in perfect working
  condition for driving out in the winter months, <br /> in order to avoid any
  accidents in the early dusk.</p>
* glass wall Etobicoke (2014-07-10 00:47:21): <p>It's truly very difficult in
  this busy life to listen news on Television, thus I <br /> simply use the web
  for that reason, and obtain the most <br /> recent news.</p>
* best hookah bars in nyc (2014-07-13 18:08:16): <p>Very good post. I'm
  experiencing a few of these <br /> issues as well..</p>
* ceiling fan repair (2014-08-14 22:08:18): <p>Write more, thats all I have to
  say. Literally, it seems as though you relied on the video to make your
  point.<br /> You clearly know what youre talking about, why throw away your
  intelligence on just posting videos <br /> to your site when you could be
  giving us something informative <br /> to read?</p>
* karatbars login (2014-08-18 11:11:57): <p>I'm really inspired along with your
  writing skills as <br /> well as with the structure for your weblog. Is that
  this a paid theme or did you customize it your <br /> self? Either way keep up
  the nice quality writing, it's uncommon to peer a nice weblog like this one
  today..</p>
* ip phone service business New York City (2014-09-01 19:56:54): <p>Hi there!
  This is my first visit to your blog!<br /> We are a collection of volunteers
  and starting a new project in a community <br /> in the same niche. Your blog
  provided us useful information to work on. You have done a marvellous job!</p>
* tiles (2014-09-03 12:26:40): <p>Very good post! We will be linking to this
  particularly great content on our site.<br /> Keeep up the good writing.</p>
* Visit Wikipedia For More Uk Information (2014-09-07 20:34:07): <p>Its like you
  read my mind! You seem to know a lot about this, like you wrote <br /> the
  ebook in it or something. I think that yoou simply can ddo with some percent
  to <br /> power the message home a bit, bbut instead of that, this is great
  <br /> blog. An excellent read. I'll certainly be back.</p>
* shockingoptimis74.blogs.experienceprojec (2014-09-15 02:59:39): <p>Be sure to
  live with the color a few days before making your decision. <br /> Lighting
  perform an enormous function in setting up your theme, <br /> and the latest
  fashion calls for hanging lamps throughout the home.<br /> Instead of mixing
  different colors together, you can select contrasting finishes and textures
  for <br /> various items.</p>
* buy acne no more (2014-09-15 09:58:34): <p>Just desire to say your article is
  as surprising.The clearness to <br /> your post is just cool and i could think
  you're an expert on this <br /> subject. Fine along with your permission allow
  me to grasp your RSS eed to stay updated with approaching post.<br /> Thanks a
  million and please carry on the rewarding work.</p>
* voip phone for business New York City (2014-09-19 10:20:03): <p>Hi mates, good
  paragraph and pleasant urging commented at <br /> this place, I am genuinely
  enjoying by these.</p>
* social media event (2014-09-20 09:38:37): <p>For hottest information you have
  to go to see the web and on internet <br /> I found this website as a most
  excellent web page for most recent updates.</p>
* best dating sites (2014-09-24 09:47:50): <p>Thanks to my father who shared
  with me about this web site, <br /> this website is really remarkable.</p>
* local seo services (2014-09-30 01:46:16): <p>Do you have any video of that?
  I'd love to find out some additional <br /> information.</p>
* business phones system New York City (2014-09-30 09:15:33): <p>Everyone loves
  what you guys tend to be up too.<br /> This kind of clever work and exposure!
  Keep up the good works guys I've incorporated you guys to our <br />
  blogroll.</p>
* 24 hour heating and cooling repair north (2014-10-05 10:48:15): <p>Thank you a
  bunch for sharing this with all folks you actually understand what you are <br
  /> speaking about! Bookmarked. Please also visit my website =).<br /> We will
  have a link change arrangement between us</p>
* convert language into english (2014-10-06 06:20:05): <p>Hi, always i used to
  check web site posts here early <br /> in the daylight, because i love to find
  out more and <br /> more.</p>
* convert to english (2014-10-09 01:39:54): <p>Useful information. Lucky me I
  found your web site <br /> by chance, and I am shocked why this coincidence
  didn't came about earlier!<br /> I bookmarked it.</p>
* take paid surveys (2014-10-11 06:25:11): <p>Wonderful blog! Do you have any
  tips and hints for aspiring writers?<br /> I'm hoping to start my own blog
  soon but I'm a little lost on everything.<br /> Would you suggest starting
  with a free platform like Wordpress or go for a paid option? There are so many
  choices out there that I'm <br /> completely overwhelmed .. Any tips? Bless
  you!</p>
* paid surveys (2014-10-13 08:59:53): <p>Normally I don't learn post on blogs,
  however I would like to say that this write-up very compelled <br /> me to
  take a look at and do it! Your writing taste has been surprised me.<br />
  Thanks, very great article.</p>
* tefal tefal tefal (2014-10-16 06:48:23): <p>Greate pieces. Keep posting such
  kind of information on your site.</p>  <p>Im really impressed by your blog.<br
  /> Hey there, You have performed a fantastic job. I will certainly digg it and
  in my view recommend to <br /> my friends. I am confident they will be
  benefited from this website.</p>
* new 4 bedroom hall kitchen bunglow for s (2014-10-18 22:12:54): <p>If theey
  don't really have one, it is a pretty <br /> clear indication if you ask me
  that should things get tough they'll buckle annd quit.<br /> If I were to give
  three essential tips that guarantee making money <br /> online in real estate
  today, it can be these:. Hence it's important that you should diligently
  discharge all of your duties from <br /> quoting an affordable price for the
  home till checking thoroughly the returns the <br /> accountant files for you
  personally. From here you are able to start to move towards the more expensive
  properties and find out what the rental demand is similar to for this form of
  property.<br /> Education likewise helps to eliminate unnecessary risk.<br />
  One with the appreciable facts is how the outskirts of the city are <br />
  developing in a rapid rate, making the projects fruitful investments <br />
  throughout the city. You must be attentive for the language and terms utilized
  within the real-estate investment planet.<br /> The Real Estate market of
  Botswana presents such particularities.<br /> Public records at local county
  or city offices give you the most accurate and reliable data because your <br
  /> own resources, since these will also be the data used for tax assessments
  in the <br /> locality. Good real agents persuade one to <br /> sell or buy
  your premises at good rates.</p>
* lawyers in corpus christi (2014-10-20 11:30:02): <p>I do not even understand
  how I finished up here,<br /> but I thought this submit was great. I don't
  recognise who you're but certainly <br /> you are going to a famous blogger
  when you are not already.<br /> Cheers!</p>
* Alysa (2014-10-24 00:01:52): <p>It's noot my first time to go to see this web
  page, i am visiting this wweb page dailly <br /> and get good information from
  here everyday.</p>
* turmeric pills side effects (2014-10-24 04:22:36): <p>It's really a cool and
  helpful piece of info. I am <br /> satisfied that you just shared this useful
  information with us.</p>  <p>Please stay us up to date like this. Thank you
  for sharing.</p>
* Old 1 Bedroom Hall Kitchen For Rent Seaw (2014-10-29 16:57:56): <p>Despite
  escalating demand, you'll be able to still buy property aat a comparatively
  low price.<br /> We cannot, however, make more earth; there is a finite,
  limited availability of it.<br /> Real estate is one from the most expensive
  investments <br /> somebody can make. The following lists some tax deductions
  which can be available to real-estate investors.<br /> The state of Ohio using
  its vast population has something to thrill everyone; whether <br /> it be job
  or outdoor recreation. If you simply <br /> have one bedroom and something
  bathroom, you might market <br /> it to single people. The real estaye
  property market of India ensures <br /> a dynamic workforce, liberalized
  economy, robust housing demand in all sectors and <br /> strong investment
  opportunities. The city has become become the recent spot for Non Residential
  Indian investment.<br /> Public records at local county or city offices givee
  you the most accurate and reliable <br /> data since your oown resources,
  since these may also be the data useful for tax assessments inside the
  locality.<br /> The battery's down, and I'll contact you whenever I get a
  signal.</p>
* antalaktika piaggio (2014-11-03 17:00:27): <p>Excellent post. Keep writing
  such kind of information on your page.<br /> Im really impressed by it.<br />
  Hi there, You have performed an incredible job.<br /> I will definitely digg
  it and for my part recommend to my friends.<br /> I am confident they will be
  benefited from this site.</p>
* 91 مليون مستخدم يستخدم تطبيق bbm والنسخة (2014-11-06 10:54:19): <p>I'm not
  sure exactly why but this weblog is loading <br /> very slow for me. Is anyone
  else having this issue or is <br /> it a issue on my end? I'll check back
  later and see if the problem still exists.</p>
* pay day loan uk in ireland (2014-11-07 20:27:32): <p>I claimed for Shiny Hub
  on Select ( blank ) USA which is simply <br /> a poor idea and involves firms
  bidding about government <br /> legal agreements and supplying products or
  services intended for government exclusively use to <br /> receive taxes
  credits.</p>
* get paid survey (2014-11-13 07:31:53): <p>What i do nnot realize is in reality
  how you're no longer actually much <br /> more smartly-appreciated than you
  might be right <br /> now. You are so intelligent. You realize thus <br />
  significantly when it comes to this subject, produced <br /> me personally
  believe it from numerous variwd angles.<br /> Its like women and men don't
  seem to be interested unless it is something to do with Lady gaga!<br /> Your
  personal stuffs outstanding. Always tak care of it up!</p>
* hausfrauen sex (2014-11-14 22:41:45): <p>Unquestionably believe that which you
  stated. Your favorite <br /> reason appeared to be on the internet the easiest
  thing to be aware of.<br /> I say to you, I certinly get irked while people
  consider wkrries that tgey plainly don't know about.<br /> You managed to hit
  the nail upon the top and defined out the whole thing <br /> without having
  side-effects , people could take a <br /> signal. Willl probably be back to
  get more.<br /> Thanks</p>
* hacked server (2014-11-15 20:31:26): <p>Hello, I think your blog might be
  having browser compatibility issues.<br /> When I look at your website in
  Firefox, it looks fine but when opening in Internet Explorer, it has <br />
  some overlapping. I just wanted to give you a quick heads up!<br /> Other then
  that, terrific blog!</p>
* no credit check personal loans (2014-11-16 10:51:35): <p>money lenders hob
  instant online loans y1r quick loans u1g instant loans <br /> pdj payday loans
  no credit check c5f cash loans jk4 cash advance <br /> ukf installment loans
  6rw loans for bad credit ntx quick <br /> cash jmu small loans w36 personal
  loans wv1 title <br /> loans ho1 car title loans 5hk car title loans 600
  online <br /> gambling fiy online casino 9z6 slot machines ld0 online roulette
  <br /> px6 casino games ezz casino bonus j43 online casino bonus 6z5 best <br
  /> online casino t78 online gambling casino cf3 play casino http://money--
  lenders.com money lenders http://instantonline-loan.com instant online loans
  http://quick--loans.net quick loans http://instant--loans.net instant loans
  http://paydayloans--nocreditcheck.net payday loans no credit check <br />
  http://cash--loans.net cash loans http://cash--advance.net cash advance
  http://installment--loans.net installment loans <br /> http://loansfor--
  badcredit.com loans for bad credit http://quick--cash.net quick cash
  http://small--loans.com small loans http://personal--loan.info personal <br />
  loans http://title--loans.net title loans http://car-title-loans.info car
  title loans http://title-loans-on-cars.net car title loans
  http://onlinegamblings.info online gambling http://online-casino777.info
  online casino http://slot--machines.net slot machines http://roulette--
  online.com online roulette http://casino--games.net casino games http://casino
  --bonus.com casino bonus http://online--casino-bonus.com online casino bonus
  http://best--online-casino.net best <br /> online casino http://online-
  gambling-casino.org online <br /> gambling casino http://play--casino.com play
  casino</p>
* ios 7 applications waiting (2014-11-18 22:01:58): <p>I'm not sure why but this
  site is loading very <br /> slow for me. Is anyone else having this problem or
  is it a issue on my end?<br /> I'll check back later and see if the problem
  still exists.</p>
* fast money (2014-11-21 03:11:18): <p>money lenders mwf instant online loan t3r
  quick loans g16 instant loans njt <br /> payday loans no credit check 9yj bad
  credit loans pvv cash <br /> loans nsf cash advance 04r installment loans 33u
  loans for bad credit <br /> ud9 quick cash cv6 small loans xhz personal loans
  <br /> lu1 borrow money bk8 loans for people with bad credit 6z6 <br /> bad
  credit loans guaranteed approval sfe personal loans <br /> for bad credit oc9
  no credit check loans zk2 online payday loans 2r8 same day loans ovr payday
  loans direct lenders only i7f bad credit personal loans car personal loans for
  people with bad credit <br /> p01 loans with no credit check 248 short term
  <br /> loans l9z installment loans for bad credit be2 unsecured personal loans
  ncu i need money siy unsecured loans bjj fast cash yzj online loans no <br />
  credit check rly cash advance loans khu fast money spt mobile loans nb3 no <br
  /> credit check personal loans iib no credit check payday <br /> loans oyl
  cheap loans e92 direct lender payday loans 3d5 http://s3.amazonaws.com/money-
  lenders/money-lenders.html money lenders<br />
  http://s3.amazonaws.com/instantonlineloan/instantonlineloan.html instant
  online loan<br /> http://s3.amazonaws.com/quick-loans/quick-loans.html quick
  loans<br /> http://s3.amazonaws.com/instant-loans/instant-loans.html instant
  loans<br />
  http://s3.amazonaws.com/paydayloansnocreditcheck/paydayloansnocreditcheck.html
  payday <br /> loans no credit check<br /> http://s3.amazonaws.com/bad-credit-
  loans/bad-credit-loans.html bad credit <br /> loans<br />
  http://s3.amazonaws.com/cash--loans/cash--loans.html cash loans<br />
  http://s3.amazonaws.com/cash-advance/cash-advance.html cash advance<br />
  http://s3.amazonaws.com/installment-loans/installment-loans.html installment
  <br /> loans<br /> http://s3.amazonaws.com/loans-for-bad-credit/loans-for-bad-
  credit.html loans for bad credit<br /> http://s3.amazonaws.com/quick--
  cash/quick--cash.html quick cash<br /> http://s3.amazonaws.com/small-
  loans/small-loans.html small loans<br /> http://s3.amazonaws.com/personal-
  loans/personal-loans.html personal loans<br /> http://s3.amazonaws.com/borrow-
  money/borrow-money.html borrow money<br /> http://s3.amazonaws.com/loans-for-
  people-with-bad-credit/loans-for-people-with-bad-credit.html loans for people
  with bad credit<br /> http://s3.amazonaws.com/badcreditloansguaranteedapproval
  /badcreditloansguaranteedapproval.html bad credit loans guaranteed approval<br
  /> http://s3.amazonaws.com/personalloansforbadcredit/personalloansforbadcredit
  .html personal loans for bad credit<br />
  http://s3.amazonaws.com/nocreditcheckloans/nocreditcheckloans.html no credit
  check <br /> loans<br /> http://s3.amazonaws.com/online-paydayloans/online-
  paydayloans.html online payday loans<br /> http://s3.amazonaws.com/same-day-
  loans/same-day-loans.html same day loans<br /> http://s3.amazonaws.com/paydayl
  oansdirectlendersonly/paydayloansdirectlendersonly.html payday loans direct
  lenders only<br />
  http://s3.amazonaws.com/badcreditpersonalloans/badcreditpersonalloans.html bad
  credit personal loans<br /> http://s3.amazonaws.com/personalloansforpeoplewith
  badcredit/personalloansforpeoplewithbadcredit.html personal loans for people
  with bad credit<br />
  http://s3.amazonaws.com/loanswithnocreditcheck/loanswithnocreditcheck.html
  loans <br /> with no credit check<br /> http://s3.amazonaws.com/short-term-
  loans/short-term-loans.html short term loans<br /> http://s3.amazonaws.com/ins
  tallmentloansforbadcredit/installmentloansforbadcredit.html installment loans
  for bad credit<br />
  http://s3.amazonaws.com/unsecuredpersonalloans/unsecuredpersonalloans.html
  unsecured personal loans<br />
  http://s3.amazonaws.com/ineedmoney/ineedmoney.html i need money<br />
  http://s3.amazonaws.com/unsecured-loans/unsecured-loans.html unsecured
  loans<br /> http://s3.amazonaws.com/fast--cash/fast--cash.html fast cash<br />
  http://s3.amazonaws.com/onlineloansnocreditcheck/onlineloansnocreditcheck.html
  online loans no credit check<br /> http://s3.amazonaws.com/cash-advance-
  loans/cash-advance-loans.html cash advance loans<br />
  http://s3.amazonaws.com/fast-money/fast-money.html fast <br /> money<br />
  http://s3.amazonaws.com/mobile-loans/mobile-loans.html mobile loans<br /> http
  ://s3.amazonaws.com/nocreditcheckpersonalloans/nocreditcheckpersonalloans.html
  no <br /> credit check personal loans<br />
  http://s3.amazonaws.com/nocreditcheckpaydayloans/nocreditcheckpaydayloans.html
  no credit check payday loans<br /> http://s3.amazonaws.com/cheap--loans/cheap
  --loans.html cheap loans<br />
  http://s3.amazonaws.com/directlenderpaydayloans/directlenderpaydayloans.html
  direct lender payday loans</p>
* search engine optimisation costs (2014-11-22 00:04:16): <p>I think that is one
  of the most importat information for me.<br /> And i'm glad studying your
  article. But wanna observation on some general things, Thee web site style is
  wonderful, <br /> the articles is inn point of fact great : D. Good process,
  cheers</p>
* vrouwen ontmoeten,enjoy dating (2014-11-22 15:26:46): <p>Amenities: Tinder is
  actually a flip-book of people vaguely connected on Facebook to you.<br /> You
  turn through click heart” and photos if you prefer everything <br /> you
  discover and x” should younot. Since Tinder sees me ending up using a
  gentleman, although the thought of ending up with a man makes me internally
  scream, I spent <br /> 99% of the time demanding x.” if you like to view more
  about somebody, it <br /> is possible to examine their not a lot of profile to
  determine five photos, a brief summary of how <br /> chill they're, and what
  likes” you discuss.</p>
* flacher bauch tipps (2014-11-30 19:30:45): <p>Mit Pilates Du entspannen,
  geschmeidiger werden, die <br /> Wirbelsäule stärken und Dir die gleichzeitig
  antrainieren that is perfekte.<br /> Mit unseren Yoga Zuhause trainierst Du
  die Muskeln that is tiefliegenden, die den Körper formen und ihm die und
  Wendigkeit Dancer <br /> verleihen that is ästhetisch.</p>
* money lenders (2014-12-07 13:10:44): <p>money lenders xxg instant online loan
  md3 quick loans o3d instant loans 13w payday loans no credit check svu bad
  credit loans qqg cash loans y11 <br /> cash advance i2b installment loans epb
  loans for bad credit <br /> 9vy quick cash 4eu small loans dux personal loans
  ysd borrow <br /> money 8om loans for people with bad credit 0mz bad credit
  loans guaranteed approval en7 personal loans for bad credit sgu no credit
  check <br /> loans 2kl online payday loans w0v same day loans gwc payday loans
  direct lenders only w3n bad credit personal <br /> loans 2e4 personal loans
  for people with <br /> bad credit xwf loans with no credit check 791 short
  term loans qr5 installment loans for bad credit <br /> wxc unsecured personal
  loans 34l i need money xoe unsecured loans xze fast cash wwf online <br />
  loans no credit check hrg cash advance loans 82n fast money wxb mobile loans
  1zu no credit check personal loans 0aj no credit <br /> check payday loans 2ee
  cheap loans s2s direct lender payday loans yb5 http://s3.amazonaws.com/money-
  lenders/money-lenders.html money lenders<br />
  http://s3.amazonaws.com/instantonlineloan/instantonlineloan.html instant
  online loan<br /> http://s3.amazonaws.com/quick-loans/quick-loans.html quick
  loans<br /> http://s3.amazonaws.com/instant-loans/instant-loans.html instant
  loans<br />
  http://s3.amazonaws.com/paydayloansnocreditcheck/paydayloansnocreditcheck.html
  payday <br /> loans no credit check<br /> http://s3.amazonaws.com/bad-credit-
  loans/bad-credit-loans.html bad credit loans<br />
  http://s3.amazonaws.com/cash--loans/cash--loans.html cash loans<br />
  http://s3.amazonaws.com/cash-advance/cash-advance.html cash advance<br />
  http://s3.amazonaws.com/installment-loans/installment-loans.html installment
  <br /> loans<br /> http://s3.amazonaws.com/loans-for-bad-credit/loans-for-bad-
  credit.html loans for bad credit<br /> http://s3.amazonaws.com/quick--
  cash/quick--cash.html quick cash<br /> http://s3.amazonaws.com/small-
  loans/small-loans.html small loans<br /> http://s3.amazonaws.com/personal-
  loans/personal-loans.html personal loans<br /> http://s3.amazonaws.com/borrow-
  money/borrow-money.html borrow <br /> money<br />
  http://s3.amazonaws.com/loans-for-people-with-bad-credit/loans-for-people-
  with-bad-credit.html loans for people with bad credit<br /> http://s3.amazonaw
  s.com/badcreditloansguaranteedapproval/badcreditloansguaranteedapproval.html
  bad credit loans guaranteed approval<br /> http://s3.amazonaws.com/personalloa
  nsforbadcredit/personalloansforbadcredit.html personal loans for bad credit<br
  /> http://s3.amazonaws.com/nocreditcheckloans/nocreditcheckloans.html no
  credit check loans<br /> http://s3.amazonaws.com/online-paydayloans/online-
  paydayloans.html online payday loans<br /> http://s3.amazonaws.com/same-day-
  loans/same-day-loans.html same day loans<br /> http://s3.amazonaws.com/paydayl
  oansdirectlendersonly/paydayloansdirectlendersonly.html payday loans direct
  lenders only<br />
  http://s3.amazonaws.com/badcreditpersonalloans/badcreditpersonalloans.html bad
  credit <br /> personal loans<br /> http://s3.amazonaws.com/personalloansforpeo
  plewithbadcredit/personalloansforpeoplewithbadcredit.html personal <br />
  loans for people with bad credit<br />
  http://s3.amazonaws.com/loanswithnocreditcheck/loanswithnocreditcheck.html
  loans with no credit check<br /> http://s3.amazonaws.com/short-term-
  loans/short-term-loans.html short term loans<br /> http://s3.amazonaws.com/ins
  tallmentloansforbadcredit/installmentloansforbadcredit.html installment loans
  for bad credit<br />
  http://s3.amazonaws.com/unsecuredpersonalloans/unsecuredpersonalloans.html
  unsecured personal loans<br />
  http://s3.amazonaws.com/ineedmoney/ineedmoney.html i need money<br />
  http://s3.amazonaws.com/unsecured-loans/unsecured-loans.html unsecured <br />
  loans<br /> http://s3.amazonaws.com/fast--cash/fast--cash.html fast cash<br />
  http://s3.amazonaws.com/onlineloansnocreditcheck/onlineloansnocreditcheck.html
  online loans no <br /> credit check<br /> http://s3.amazonaws.com/cash-
  advance-loans/cash-advance-loans.html cash advance loans<br />
  http://s3.amazonaws.com/fast-money/fast-money.html fast money<br />
  http://s3.amazonaws.com/mobile-loans/mobile-loans.html mobile loans<br /> http
  ://s3.amazonaws.com/nocreditcheckpersonalloans/nocreditcheckpersonalloans.html
  no credit <br /> check personal loans<br />
  http://s3.amazonaws.com/nocreditcheckpaydayloans/nocreditcheckpaydayloans.html
  no credit check payday loans<br /> http://s3.amazonaws.com/cheap--loans/cheap
  --loans.html cheap loans<br />
  http://s3.amazonaws.com/directlenderpaydayloans/directlenderpaydayloans.html
  direct lender payday loans</p>
* cheats candy crush soda saga booster (2014-12-11 21:45:40): <p>Does your site
  have a contact page? I'm having trouble locating it but,<br /> I'd like to
  send you an e-mail. I've got some creative ideas for your <br /> blog yyou
  might be interested in hearing. Either way, great bloog and I look forward <br
  /> tto seeing it develop over time.</p>
* attract women binaural (2014-12-18 15:33:39): <p>Fantastic blog you have here
  but I was wanting to know <br /> if you knew of any discussion boards that
  cover the same topics <br /> discusased in this article? I'd really love to be
  a part of group where I can get comments from other experienced people that
  share the same interest.<br /> If you have any suggestions, please let mee
  know.<br /> Bless you!</p>
* Filomena (2014-12-19 04:09:43): <p>I just like the valuable info you supply to
  your articles.<br /> I'll bookmark your weblog and check again here
  frequently.<br /> I'm reasonably certain I'll be told a loot oof new stuff
  proper right here!<br /> Good luck for the next!</p>
* laffita.com (2014-12-21 00:16:49): <p>My "personal" model ran less than $70
  and my older unit ran about <br /> $250 at the time, but has come down in
  price over the years <br /> and is around $200-$220 range now. PDF may contain
  XFA (in XDP format), but also XFA may contain PDF.<br /> As the name implies
  this is where you put things you need to discuss with someone else.</p>
* salad chef as seen on tv (2014-12-22 12:31:38): <p>It's actually a nice and
  helpful piece of info.</p>  <p>I am glad that you just shared this helpful
  information with us.<br /> Please keep us up to date like this. Thanks for
  sharing.</p>
* Www.pinterest.com (2014-12-24 02:35:56): <p>Adopting a child is an important
  decision that requires careful <br /> consideration. If a coaching
  relationship interests you, please contact a certified professional coach.</p>
  <p>Both steps are integral in helping the professionals and the adoption
  agency <br /> determine if you are ready to adopt.</p>
* quick food (2014-12-24 05:57:46): <p>Hello, I log on to your new stuff like
  every week.</p>  <p>Your writing style is witty, keep it up!</p>
* คอนกรีตพิมพ์ลาย (2014-12-24 15:40:33): <p>Hey! Do you use Twitter? I'd like to
  follow you if that would be ok.<br /> I'm definitely enjoying your blog and
  look forward to new posts.</p>
* link homepage buy facebook likes (2014-12-26 03:10:54): <p>Parаgraрh writing
  is also a excitement, if you be familiar with after thаt you <br /> can write
  or else it is complex to write.</p>
* tannpleie (2014-12-30 23:59:22): <p>Yes! Finally someone writes about dental
  plans.</p>
* dragon city astuce pour avoir dragon leg (2014-12-30 23:59:48): <p>I all the
  time used to study piecee of writing in news papers but now <br /> as I am a
  user of net therefore from nnow I am using net for articles or reviews, thanks
  to web.</p>
* house dj (2015-01-10 19:33:15): <p>When you're car keeps dj equip pulling to
  the increasing number <br /> of observations 36 monthsb = beta of the public
  something they should get up <br /> and there is not only be available
  elsewhere.<br /> Get Jeep-quality headlights from a train that is no quick fix
  solution to a pensions service outlines what these numbers may sound a
  bit.</p>
* paid survey (2015-01-17 12:09:19): <p>After exploring a handful of the blog
  articles on your web <br /> site, I honestly like your technique of
  blogging.<br /> I added it to my bookmark site list and will be checking back
  soon. Please visit my website too and let me know how you feel.</p>
* Ted (2015-01-31 02:56:29): <p>For a foal born to parents already registered
  with our Association that trail has, of course,<br /> already been established
  and the registration is straightforward.</p>  <p>In years past, people were
  smaller in stature and so were the horses that they rode.<br /> They can read
  our moods and they seek our companionship and praise and bond to their person
  like dogs do.</p>
* This Hostgator Coupon will save you mone (2015-02-01 06:50:07): <p>I think the
  admin of this site is actually working hard in favor of his website, as here
  every information is quality based material.</p>
* Hostgator 1 cent coupon (2015-02-08 19:54:13): <p>My programmer is trying to
  convince me to move to .net from <br /> PHP. I have always disliked the idea
  because of the costs.<br /> But he's tryiong none the less. I've been using
  WordPress on a variety <br /> off websites for about a year and am worried
  about switcching to <br /> another platform. I have heard xcellent things
  about blogengine.net.<br /> Is thdre a way I can import all my wordpress
  content into it?</p>  <p>Any kid of help woulpd be really appreciated!</p>
* Online Tv Indonesia (2015-02-22 10:28:36): <p>My partner and I absolutely love
  your blog and find almost all of your post's to be exactly what I'm looking
  for.<br /> Would you offer guest writers to write content for you? I wouldn't
  mind writing <br /> a post or elaborating on most of the subjects you write
  with regards to here.<br /> Again, awesome weblog! Tv indonesia</p>
* www.youtube.com (2015-03-05 10:10:50): <p>What's thrilling is that their
  product does work and delivers some amazing results.<br /> If you want to
  build a considerable business, you'll have to be able to come up <br /> with
  constant leads. What is fascinating is that their shakes actually works and
  delivers some wonderful results.</p>
* Katlyn (2015-03-07 11:27:20): <p>?</p>
* spartawarofempire.tumblr.com (2015-03-08 16:07:36): <p>If you want to grow
  your experience just keep visiting <br /> this website and be updated with the
  most up-to-date news update <br /> posted here.</p>
* mn website design (2015-06-14 22:47:19): <p>Unquestionably believe that which
  you stated. Your favourite justification seemed to be at the internet the
  easiest factor to <br /> be aware of. I say to you, I certainly get annoyed
  even as folks think about issues that they just don't realize about.<br /> You
  managed to hit the nail upon the highest and outlined out the whole thing
  without having side effect , other people can take a signal.<br /> Will likely
  be again to get more. Thank you</p>
* jewel kade (2015-06-16 19:58:15): <p>Most protein shakes are loaded with
  sugar, fat, and other ingredients that <br /> aren't even necessary for the
  body. Food being part of the physiologic needs of <br /> people should be
  taken with some sort of discipline. It helps <br /> increase immunity to aid
  in fighting colds.</p>
