+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2012-09-27T16:23:48"
draft = false
title = "Bezbłędny soft"
+++
Jak wszyscy wiedzą TeX jest bezbłędny. LaTeX może już bezbłędny nie jest, ale
dość dobry. Dlaczego więc muszę zmieniać nazwy swoich plików, żeby się nie
sypał? Przykład:

> `! LaTeX Error: Unknown graphics extension: .2_exact300.pdf.`

# Komentarze

* SebaS86 (2012-09-27 19:59:07): <p>Bezbłędny = działa zgodnie z założeniami.
  Nazwy Twoich plików nie pasują do założeń. ;)</p>  <p>A tak w sumie wstawianie
  grafiki obsługują chyba rozszerzenia? I te mają całkiem sporo różnych baboli,
  ostatnio byłem lekko zawiedziony kiepskim wsparciem listings dla UTF-8.</p>
* jam łasica (2012-09-27 20:22:20): <p>To był taki plik ukryty, czy może
  "foo.2_exact300.pdf"? A co wyświetla dla pliku tekstowego o nazwie ".png"?
  ;)</p>
* Remigiusz 'lRem' Modrzejewski (2012-09-28 09:42:58): <p>No generalnie mam
  bardzo długie nazwy plików, pokazujące masę parametrów eksperymentu, ten jeden
  złośliwie był niecałkowity. W kilkudziesięciu plikach.</p>
* mh (2012-09-28 09:53:45): <p>To czemu używasz kropki zamiast przecinka?
  <em>g</em></p>
* Remigiusz 'lRem' Modrzejewski (2012-09-28 09:54:35): <p>Trywialne: bo jest
  standardowa w moim locale.</p>
* pecet (2012-09-28 12:19:42): <p>upośledzony ten linusk, w windowsie możesz
  mieć nazwy zaczynające się od kropki i nic złego sie nie dzieje, no ale w
  windowsie mamy atrybuty jako osobne pola pliku, a przecież tak nie można</p>
* Remigiusz 'lRem' Modrzejewski (2012-09-28 12:20:42): <p>Coś piłeś? Po
  pierwsze, skąd pomysł, że to pod Linuksem? Po drugie, ten sam błąd występuje
  pod Windows.</p>
* pecet (2012-09-28 13:24:07): <p>linusk, makos jeden system, a że błąd na
  windosie to wiadomo ze nie używasz office, przerzuc sie na i bedzie lepiej
  pozdriawm</p>
* Remigiusz 'lRem' Modrzejewski (2012-09-28 13:27:47): <p>Od kiedy office
  przyjmuje figury w pdf?</p>
* Hoppke (2012-09-28 14:31:07): <p>Skoro o Windows mowa, to Explorer nie pozwala
  tworzyć plików/folderów o nazwach zaczynających się kropką. Obsługuje je
  poprawnie, tylko tworzyć nie pozwala. Sztuczne ograniczenie.</p>
* Sigvatr (2012-09-28 16:54:24): <p>O Pececie: nie karmcie trolla! on specjalnie
  takie głupoty pisze, sam nawet w to nie wierzy.</p>
* SebaS86 (2012-09-28 19:00:49): <p>Bądź co bądź na Linuksie kropka w nazwie też
  nie jest specjalnie traktowana oprócz nielicznych narzędzi, które wg.
  przyjętych założeń traktują taki plik jako w zamierzeniu ukryty dla
  użytkownika.</p>  <p>A w LaTeXu być może to jest zamierzone (może „fiksik” na
  pliki w postaci *.tar.gz).</p>
* Remigiusz 'lRem' Modrzejewski (2012-09-28 19:09:11): <p>Nie, nie jest
  zamierzone. To się tyczy tylko importowania grafiki, której jest obsługiwane
  tylko kilka podstawowych formatów, nic z wieloma kropkami. Po prostu masz dwie
  kropki w nazwie pliku z grafiką - compile error.</p>
* rjc (2012-09-29 15:27:45): <p>@SebaS86</p>  <p>W LaTeXu (wym. latechu)!</p>
* SebaS86 (2012-09-29 15:50:19): <p>rjc, dziękuję.</p>
* SebaS86 (2012-09-29 22:42:33): <blockquote>   <p>Nie, nie jest zamierzone.</p>
  </blockquote>  <p>Aż tak dobrze nie znam tego środowiska ale na co dzień mam
  do czynienia z kilkoma formatami, które są wieloczłonowe, więc wcale bym się
  nie zdziwił gdyby jednak ktoś celowo zaprogramował w ten sposób rozdzielanie
  rozszerzenia od nazwy. Zresztą wygląda to na problem tego konkretnego
  rozszerzenia i łatwo go obejść – niby to działa:
  http://ubuntuforums.org/showthread.php?t=501313 .</p>
* Remigiusz 'lRem' Modrzejewski (2012-09-29 22:54:10): <blockquote>
  <p>&#92;includegraphics[type=pdf,ext=.pdf,read=.pdf]{output.2002}</p>
  </blockquote>  <p>Dziękuję, postoję ;)</p>
* SebaS86 (2012-09-29 23:04:54): <p>Też mnie irytują takie rozwiązania. Inna
  lekka porażka to np. próba uzyskania polskich liter w listingach:</p>
  <blockquote>   <p>&#92;lstset{<br />     inputencoding=utf8x,<br />
  extendedchars=&#92;true,<br />       literate={ą}{{&#92;k{a}}}1<br />
  {Ą}{{&#92;k{A}}}1<br />                {ę}{{&#92;k{e}}}1<br />
  {Ę}{{&#92;k{E}}}1<br />                {ó}{{&#92;'o}}1<br />
  {Ó}{{&#92;'O}}1<br />                {ś}{{&#92;'s}}1<br />
  {Ś}{{&#92;'S}}1<br />                {ł}{{&#92;l{}}}1<br />
  {Ł}{{&#92;L{}}}1<br />                {ż}{{&#92;.z}}1<br />
  {Ż}{{&#92;.Z}}1<br />                {ź}{{&#92;'z}}1<br />
  {Ź}{{&#92;'Z}}1<br />                {ć}{{&#92;'c}}1<br />
  {Ć}{{&#92;'C}}1<br />                {ń}{{&#92;'n}}1<br />
  {Ń}{{&#92;'N}}1}</p> </blockquote>  <p>A z rozwiązania wcześniejszego możesz
  zrobić własną komendę aby nie klepać tego za każdym razem, więc problem nie
  jest aż tak bolesny. ;)</p>
* Remigiusz 'lRem' Modrzejewski (2012-09-29 23:06:01): <p>Gdybym tak pracował
  nad tym sam, albo chociaż wszyscy współpracownicy byli w zasięgu kopniaka w
  tyłek...</p>
* SebaS86 (2012-09-29 23:09:18): <p>To rzeczywiście zmienia postać rzeczy.</p>
* clash of clans hack v10 tested (2014-05-28 08:52:22): <p>I tɦink everything
  sаid was actually vеry reasonable.<br /> Howevеr, tɦink on this, whаt if yoou
  aɗded a little <br /> infoгmation? ӏ mean, Ӏ don't wiѕh tߋ tell you howw <br
  /> to rսn youг blog, butt suppose ʏοu aɗded a post title tօ plssibly <br />
  ǥеt folk's attention? І meɑn Bezbłędny soft - lRem's <br /> blog іs kinda
  boring. Yοu could glance at Yahoo's fгont pagе <br /> and watch ɦow they
  crrate article headline to grab people tߋ click.<br /> Үοu mіght add a video
  օr а pic oor two tο get people interеsted about what yoս've got to say.<br />
  Ιn mү opinion, iit migҺt make your posts a lіttle livelier.</p>
* pro-hacks.org (2014-05-28 23:47:06): <p>Ϻy spouse and I stumbled over hеre by
  a different web page andd thougght I should check <br /> thіngѕ out. I like
  whаt I see so i am just flllowing you.<br /> Look forward tߋ finding out about
  your web page for a second <br /> time.</p>
* door security Oakville (2014-06-28 02:51:05): <p>Thanks for your personal
  marvelous posting! I certainly enjoyed reading it, you may be a great author.I
  will always <br /> bookmark your blog and definitely will come back in the
  future.<br /> I want to encourage you continue your great work, have a nice
  morning!</p>
* Norberto (2014-07-05 02:28:35): <p>It's awesome for me to have a website,
  which is good in favor <br /> of my know-how. thanks admin</p>
* marketing jobs in nj (2014-07-05 07:12:06): <p>Pretty! This has been an
  extremely wonderful article.<br /> Thank you for supplying this info.</p>
* review Create (2014-07-06 09:51:46): <p>I feel this is one of the so much
  vital information for me.<br /> And i am glad reading your article. But wanna
  remark on some common issues, The web site style is perfect,<br /> the
  articles is in point of fact great : D. Good process, cheers</p>
* New Orleans vacation rentals by owner (2014-07-06 17:57:29): <p>Pretty! This
  has been an extremely wonderful article.</p>  <p>Thank you for supplying these
  details.</p>
* website traffic rankings free (2014-07-07 15:04:25): <p>No matter if some one
  searches for his essential thing, so he/she needs <br /> to be available that
  in detail, so that thing <br /> is maintained over here.</p>
* vacation apartment rentals Seattle wa (2014-07-08 19:12:40): <p>Piece of
  writing writing is also a fun, if you be acquainted with then you can write or
  else it is complex to write.</p>
* test (2014-08-25 09:18:53): <p>Thanks for another informative site. Where else
  <br /> may I get that kind of info written in such a perfect approach?<br />
  I've a project that I'm just now working on, and I have been at <br /> the
  glance out for such information.</p>
* free surveys for money (2014-09-10 01:06:31): <p>This is the right blog for
  everyone who would <br /> like to find out about this topic. You know so much
  its almost <br /> tough to argue with you (not that I really <br /> would want
  to…HaHa). You certainly put a new spin on a topic that has been written about
  for a long time.<br /> Wonderful stuff, just excellent!</p>
* cosmetic dentistry nyc (2014-10-01 18:30:25): <p>The selection of treatment
  depends upon just what the person would like <br /> to obtain with the
  cosmetic dental care. Aesthetic dental practitioners decide on the procedures
  after getting in touch with the clients.<br /> Appropriate marketing research
  will certainly aid you learn a cosmetic dental expert <br /> that could attain
  the desired results for you.</p>
* make money online surveys (2014-10-05 09:09:41): <p>Does your wedbsite have a
  contact page? I'm having a tough time locating it but, I'd like to send you an
  email.<br /> I've got some creative ideas for your blog you might be
  interested <br /> in hearing. Either way, reat blog and I look forward to
  seeing it grow <br /> over time.</p>
* online dating sites (2014-10-12 20:58:06): <p>If you want to improve your
  experience only keep visiting <br /> this site and be updated with the most
  up-to-date information posted here.</p>
* Kennesaw www.neoengine.org/ (2014-10-14 07:22:55): <p>We understand that you
  may have had trouble getting a loan at your <br /> local bank or credit
  union.</p>
* Salina (2014-11-08 02:09:42): <p>So i bought one in the present day from Megan
  Base, VP.<br /> I called and spoke with "Alan" - I have to go to a travel
  company presentation in Gurnee (Illinois) to <br /> receive my 2 free tickets
  (all I'm liable for is charges and taxes).</p>  <p>many years upfront as a
  result of knowledge about it was gathered through DARPA's <br /> secret time
  travel program unlocks a number of of the extra enigmatic information within
  the If you <br /> want to combine your love of travel with your love <br /> of
  your nation, then a career as a civil servant could possibly be best <br />
  for you. Time travel is the same thing as deep house travel.</p>
* eliminate herpes (2014-11-08 16:24:50): <p>t mean that someone who is infected
  with genital herpes and doesn. <br /> Now that you understand the importance
  of oxygen, understand that about <br /> 8 out of 10 of you has some form of
  the Herpes virus.<br /> Be sure to continue doing this process every few hours
  after you find your cold sore.</p>
* google authorship check (2014-11-11 13:44:37): <p>Greetings! Very helpful
  advice within this post! It's <br /> the little changes that produce the most
  significant changes.<br /> Thanks for sharing!</p>
* how to delete google plus account (2014-11-13 13:05:25): <p>I know this web
  page offers quality based posts and extra information, is there any other
  website which gives such stuff in quality?</p>
* automatyhazardowedarmo w sieci (2014-11-24 02:53:32): <p>Fabulous, what a blog
  it is! This webpage gives <br /> helpful information to us, keep it up.</p>
* reklamy (2014-11-27 02:48:06): <p>Heya i'm for the primary time here. I found
  this board and I in finding It really <br /> helpful &amp; it helped me out
  much. I'm hoping to present one thing again and aid others such as you helped
  me.</p>
* denver it consulting Ft Collins CO (2014-12-01 12:17:19): <p>whoah this weblog
  is magnificent i love reading your articles.<br /> Stay up the great work! You
  understand, lots of persons are <br /> hunting round for this info, you could
  help them greatly.</p>
* Lane (2014-12-03 17:29:21): <p>Your goal would be to control the falling
  blocks with keyboard <br /> in this version of traditional tile-matching
  dilemna video game.<br /> Online games such as jacks, paper soccer, and Jenga
  require just very transportable <br /> or improvised equipment and may be
  performed on any flat level surface, <br /> while other good examples, such as
  pinball, billiards, air flow hockey, <br /> foosball, and desk hockey need
  specialized <br /> tables or various other self-contained modules on which the
  game is played.<br /> Freeze or even feed the particular gophers, and defend
  the carrot simply by graphing beliefs on a organize plane.Board games <br />
  often make use of dice to get a randomization component, and <br /> thus every
  roll from the dice includes a profound impact on the outcome from <br /> the
  game, nevertheless dice online games <br /> are differentiated in that the
  particular dice usually do <br /> not determine the particular success or
  failure of <br /> some other element of the game; they instead are the central
  signal of <br /> the individuals standing in the overall game. Variations
  associated with traditional dominoes abound: Triominoes are similar
  theoretically but are usually triangular and thus have three values for each
  <br /> tile. He has coached fifth there’s 89 games.<br /> Free typing related
  games have grown to be one of the most well-known ways to create keyboarding
  abilities in the class room through both level of discussion they enable and
  also the number of students which they appeal to.</p>  <p>While playing with
  keyboard, students may also be learning hands eye coordination and muscle
  tissue memory.<br /> Kids are familiar with games and over 90 percent of
  school children play all of them.</p>  <p>I have no an Xbone here in any
  office, but I simply <br /> now bought” both the customer and the Gatorade
  Sports Overall performance Football Training Camp” on the web for $0.<br /> I
  don't have XBL precious metal, and there were no disclaimers AT ALL regarding
  <br /> needing XBL gold. Wait, unless games are free of charge <br /> with
  ads… WHO THE $#! To WOULD WANT TO DOWNLOAD Gatorade Sports activities
  Performance Soccer Training Camp”?!?!<br /> According to the Amusement
  Software Association, 59% <br /> of Americans enjoy games. The Jets can't make
  this about 7 video games.Endless hrs parked right in front a computer <br />
  display screen generally does not lead to weight reduction. <br /> But online
  games that set virtual realms with physical exercise could get <br /> people
  who are less likely to exercise to start shifting.<br /> Researchers have
  found that playing games on a Wii that <br /> push people to get up and shift
  for twenty minutes at any given time is a genuine and potentially more
  interesting alternative to conventional aerobic exercise.<br /> Card games use
  a deck of credit cards as their main tool.In the event <br /> that Dale and
  Ewoldsen may establish a hyperlink between cooperative gameplay within violent
  <br /> video games and enhanced impressions of gamers belonging to different
  nationalities, the <br /> next step could be to understand just how this could
  genuinely play <br /> out in a real-world scenario where gamers generally only
  discover clues regarding other gamers' ethnic details through their <br /> own
  accents or online brands. As video games have <br /> become the mainstream
  pastime, those have grown to <br /> be enormous.<br /> The games include a
  single-celled organism contained inside a sq .</p>
* google accounts login gmail (2014-12-04 12:08:07): <p>Hurrah, that's what I
  was searching for, what a information! present here at this webpage, thanks
  admin of this web page.</p>
* website submission free public service a (2014-12-13 00:06:30): <p>Writing
  articles is necessary for any enterprise or individual trying to get exposure
  from prospects on the web.<br /> When you advertise for your home business,
  chances are that <br /> you are only reaching customers who are specifically
  looking for a service or product like the one you provide.</p>  <p>Here is a
  list of the most popular Search Engines and directory companies:<br /> .</p>
* healthy (2015-01-19 08:45:01): <p>It's an remarkable paragraph in favor of all
  the internet visitors; they will take benefit <br /> from it I am sure.</p>
* Birmingham escort agency (2015-01-20 10:54:15): <p>Do you have a spam problem
  on this site; I also am a blogger, and I was curious about your <br />
  situation; we have created some nice practices and we are looking to trade
  strategies with others, be sure to shoot me an e-mail <br /> if
  interested.</p>
* rencontre transexuel (2015-02-04 08:25:38): <p>Hello I am so grateful I found
  your web site, I really found <br /> you by accident, while I was browsing on
  Bing <br /> for something else, Anyways I am here now and would just like to
  say many thanks for a <br /> remarkable post and a all round thrilling blog (I
  also love the theme/design), I don't have time to read it all at the <br />
  minute but I have bookmarked it and also included your RSS feeds, so when I
  <br /> have time I will be back to read a lot more, Please do keep up the
  excellent <br /> job.</p>
* maxx NO (2015-02-19 06:24:05): <p>Does your website have a contact page? I'm
  having a tough time <br /> locating it but, I'd like to send you an e-mail.
  I've got some creative ideas for your blog <br /> you might be interested in
  hearing. Either way, great site and I look forward to seeing it develop over
  time.</p>
* Perfect Cambogia (2015-02-24 20:37:37): <p>Thanks for sharing your thoughts on
  loss possible. Regards</p>
* addie Up (2015-03-02 00:42:35): <p>Thanhҟs a lot for sharibց this witth all of
  us you really undеrstɑnd ѡhat you are <br /> talking about! Bookmarked. Please
  adɗitionally talk over with <br /> my web site =). We can havе a hyperlink
  traԀe agreement <br /> аmong us</p>
* Rui Xinxin (2015-03-02 04:53:39): <p>I've been surfing on-line greater than
  three hours nowadays, yet I by no <br /> means discovered any fascinating
  article like yours. It is lovely worth sufficient for me.</p>  <p>In my view,
  if all web owners and bloggers made excellent <br /> content material as you
  probably did, the web shall be much more useful <br /> than ever before.</p>
* Waldo (2015-04-13 23:32:41): <p>You really mаke іt seem so easy with youг
  presentation hoաever І to find this <br /> topic to Ƅe really sοmething thɑt I
  bеlieve I'd <br /> nevеr understand. It sort of feels toо <br /> complex annd
  extremely vast fߋr me. I am taking a <br /> look ahead tօ yߋur subsequent
  post, I'll attempt tߋ ցet the hang of <br /> it!</p>
* james and surman boca Raton cpa (2015-04-29 18:42:09): <p>Corporate Taxeѕ: All
  business structures pay taxes on the income <br /> made in that particular
  business. They will <br /> do all the talking for you with the agent. You
  would poѕsibly make an sum οf cash similar to a consequence of the Regional
  group.</p>
* slutroulette (2015-05-07 17:25:59): <p>wonderful issues altogether, you simply
  won a new reader.<br /> What could you recommend in regards to your publish
  that you simply made a <br /> few days ago? Any positive?</p>
* gods rush cheats (2015-05-10 00:09:30): <p>Hello there! This is kind of off
  topic but I need some advice from <br /> an established blog. Is it very
  difficult to set up your own blog?</p>  <p>I'm not very techincal but I can
  figure things out pretty fast.<br /> I'm thinking about making my own but I'm
  not sure <br /> where to start. Do you have any points or suggestions?<br />
  Appreciate it</p>
* slutroulette (2015-05-10 15:42:04): <p>I really like your blog.. very nice
  colors &amp; theme.<br /> Did you design this website yourself or did you hire
  someone to do it for you?<br /> Plz respond as I'm looking to construct my own
  blog and would like to know where u got this from.</p>  <p>thanks a lot</p>
* make money online surveys (2015-05-14 23:53:56): <p>Pretty section of content.
  I just stumbled upon your site and in accession capital to assert that I get
  in fact enjoyed account your blog posts.<br /> Anyway I'll be subscribing to
  your augment and even I achievement <br /> you access consistently
  quickly.</p>
* http://tinyurl.com/065c6f2992c5c626175db (2015-05-18 15:47:51): <p>I just like
  the helpful info you provide on your articles.<br /> I'll bookmark your blog
  and take a look at again right here frequently.<br /> I'm moderately sure I
  will be told many new stuff right here!<br /> Best of luck for the
  following!</p>
* http://tinyurl.com/ (2015-05-20 21:16:51): <p>Woah! I'm really loving the
  template/theme of this blog.<br /> It's simple, yet effective. A lot of times
  it's challenging to <br /> get that "perfect balance" between usability and
  visual appearance.<br /> I must say that you've done a amazing job with this.
  Additionally, <br /> the blog loads extremely fast for me on Internet
  explorer.<br /> Exceptional Blog!</p>
* brave trials hack (2015-05-21 07:55:59): <p>Wonderful goods from you, man. I
  have understand your stuff previous to and you're just extremely fantastic.<br
  /> I really like what you have acquired here, really like what you are stating
  and the way in which you say it.</p>  <p>You make it entertaining and you
  still take care of to keep it <br /> wise. I cant wait to read far more from
  you.<br /> This is actually a terrific site.</p>
* Reviews for snow teeth whitening (2015-05-26 19:50:48): <p>We'rе іn Lаs Vegas.
  Ύօu shoսld be health insurance 60+ ɑble to <br /> afford health insurance. 60
  mɑke tоo mսch tο receive Medicaid coverage 24 ρercent of <br /> people ages 16
  to 64 Һad no health insurance. Two years ago, tοdaү it'ѕ <br /> reached
  epidemic proportions.</p>
* bormanxon (2015-05-31 04:34:38): <p>Omit the resource headerNASA Logo National
  Aeronautics and Room Administration</p>  <p>Lyndon B. Manley Space Middle<br
  /> Houston, Texas 77058<br /> bormanxon<br /> Honest Borman (NASA Photo)</p>
  <p>Frank Borman<br /> NASA Astronaut (former)</p>  <p>A hero of the American
  Space Odyssey bormanxon, Frank Borman led the <br /> first team of American
  astronauts to group the celestial body overhead, extending man's <br />
  horizons in to space. He could be internationally known as Commander from the
  1968 <br /> Apollo 8 Mission. A love with planes that began when he or she was
  <br /> 15 years old, took Frank Borman to the Surroundings Force and to
  NASA.</p>  <p>A career Atmosphere Force official from 1950, his assignments
  included services as a mma fighter pilot, an operational pilot and <br />
  trainer, an fresh test initial and an assistant teacher of Thermodynamics and
  <br /> Liquid Mechanics in West Stage. When selected by NASA, Frank Borman was
  instructor at the Aeronautical Research Initial School with Edwards AFB,
  California.</p>  <p>Within 1967 this individual served as a member of the
  Apollo 204 Open fire Investigation Board, investigating what <br /> causes the
  fireplace which slain three astronauts aboard a good Apollo spacecraft,
  reminiscent <br /> of the Challenger tragedy. Later he or she became the
  particular Apollo System <br /> Resident Manager, heading the particular team
  that re-engineered the Apollo spacecraft.<br /> He furthermore served as Field
  Director of NASA's Space Station Task Drive.</p>  <p>Frank Borman retired from
  your air Power in 1970, but is well <br /> kept in mind as a part of this
  particular nation's history, <br /> a master in the hunt for space as well as
  a veteran associated with both the Gemini 7, 1965 Space Orbital Rendezvous
  with Gemini six and the first manned lunar orbital mission, Apollo 6, in late
  1960s.</p>  <p>Borman's pension from the Air Force within 1970 failed to end
  their aviation profession. He grew to <br /> become a special consultant to
  Eastern Airlines in early 1969 <br /> and December 1970 was named Sr. Vice
  President-Operations Group.</p>  <p>He has been promoted in order to Executive
  Vice President-Genera <br /> Operations Manager plus was selected to Eastern's
  Board of Directors in July mid 1970s.<br /> In May 1975 he was elected Chief
  executive and Chief Operating Police officer.</p>  <p>He had been named Ceo in
  December 1975 and became Chairman of the Board <br /> keep away from 1976.</p>
  <p>During his tenure as Ceo of Eastern, the airline industry had an enormous
  change caused <br /> by deregulation. During this period Far eastern
  originated a number of unique applications including profit sharing and wages
  tied to company success.<br /> These programs produced the four the majority
  of profitable many years in the business history.<br /> The recalcitrant
  marriage forced their abandonment <br /> in 1983 and the resulting loses led
  to the particular sale of the particular airline in order to Texas <br />
  Atmosphere Corporation. Colonel Borman upon the <br /> market from Far eastern
  Airlines in June associated with 1986.</p>  <p>Colonel Borman was privileged
  in order to serve as Specific Presidential Ambassador <br /> on excursions
  throughout the Asia and European countries,<br /> including a globally tour to
  seek support for that release associated with <br /> American Prisoners of war
  held by North Vietnam.</p>  <p>He received the Congressional Space Honor of
  Respect from the Chief <br /> executive of the United States. Colonel Borman
  also was honored the <br /> Harmon International Flying Trophy, the Robert
  M.<br /> Collier Trophy, the Tony a2z Jannus Award and the National <br />
  Geographic Society's Hubbard Medal--in addition to a <br /> lot of honorary
  degrees, special honors and service decorations.<br /> Recently, in September
  of 1990, Colonel Borman along with many other Apollo 6 <br /> astronauts,
  Lovell and Anders, was inducted into the International Aerospace Hall <br />
  of Popularity. And in Oct of 1990 received the particular Airport Providers
  Council Global Downes Honor.<br /> In Mar 1993, he or she was inducted into
  the U.<br /> S. Astronaut Hall of Fame.</p>  <p>Frank Borman was born in
  Whilst gary, Indiana, and was <br /> raised in Tucson, Arizona. He gained a
  Bachelor of Technology degree from the U.</p>  <p>H. Military Academy, West
  Stage, in 1950 and a Master of Technology degree in Aeronautical Executive
  from the California Institute of Technology in 1957.<br /> He or she completed
  the particular Harvard Company School's Innovative Management <br /> Program
  in 1970.</p>  <p>Frank Borman is currently a part of the Table of
  Administrators of the <br /> Home Depot, National Geographic, Outboard
  Underwater Corporation, Auto Finance Group, Thermo Device Systems plus
  American Superconductor.<br /> He has been named Leader Office of Patlex
  Company in the <br /> springtime of 1988, and currently holds the particular
  titles associated with Chairman, CEO <br /> and President of that Company. He
  has created an autobiography entitled Countdown: <br /> An Life of Frank
  Borman with Robert L. Serling, released <br /> October of 1988 and published
  simply by Silver Arrow Books, William Morrow and Company,<br /> Inc.</p>
  <p>He is wedded to the former Susan Bugbee of Tucson, Arizona.<br /> They have
  got two kids, Frederick and Edwin, and four grandchildren. Frank and <br />
  Susan presently reside in Las Cruces, Brand new Mexico.</p>  <p>DEC 1993</p>
  <p>This is actually the only edition available from NASA. Improvements must be
  looked for direct through the above named individual.</p>
* get paid for taking surveys (2015-06-01 03:12:25): <p>Hey! Would you mind if I
  share your blog with my facebook group?<br /> There's a lot of people that I
  think would <br /> really appreciate your content. Please lett me know.</p>
  <p>Cheers</p>
* Gordon (2015-06-22 17:06:59): <p>I read this piece of writing fully concerning
  the resemblance of most up-to-date and earlier technologies, it's amazing <br
  /> article.</p>
* Skye (2015-06-23 19:17:26): <p>I go to see everyday some web sites and
  information sites to read articles or reviews, but this webpage gives quality
  based writing.</p>
* Biggest loser australia (2015-07-13 21:00:46): <p>Υou can also purchаse the
  drops online, but take caution when doing sօ.<br /> You mаy also be able to
  form better еɑting habits at the same tіme.<br /> Do yߋur hоmework, weigh the
  risks and benefits, and then decide whether tҺe <br /> HCG diet is your best
  option or simply another danger to your health.<br /> WҺen the drops are taҟen
  sublingually, they are easily dissolved and obtɑin absorbed within ɑ few <br
  /> minutes. If there is a shortagе of food intake, HCG triggers the mother's
  fat <br /> reserves to feed the growing baby.</p>
