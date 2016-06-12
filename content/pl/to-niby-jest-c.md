+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-12-05T17:13:19"
draft = false
title = "To <em>niby</em> jest C"
+++
Właśnie [opublikowałem](http://dev.lrem.net:8004/) jedno z dziwniejszych
przeżyć programistycznych. Niby jest to stare dobre C... Jednak sami
powiedzcie, jak to Wam wygląda.

Plik poniższy wprowadza do [Fossila](http://fossil-scm.org/) możliwość
rejestracji użytkownika przez HTTP.

    
    
    /*
    ** Copyright (c) 2010 Remigiusz Modrzejewski 
    **
    ** This program is free software; you can redistribute it and/or
    ** modify it under the terms of the Simplified BSD License (also
    ** known as the "2-Clause License" or "FreeBSD License".)
    
    ** This program is distributed in the hope that it will be useful,
    ** but without any warranty; without even the implied warranty of
    ** merchantability or fitness for a particular purpose.
    **
    ** Author contact information:
    **   Firstname.Lastname@gmail.com
    **   <http://lrem.net/>
    **
    *******************************************************************************
    **
    ** This file contains code for generating the register screen.
    **
    */
    #include "config.h"
    #include "register.h"
    #if defined(_WIN32)  
    #  include <windows.h>           /* for Sleep */
    #  if defined(__MINGW32__) || defined(_MSC_VER)
    #    define sleep Sleep            /* windows does not have sleep, but Sleep */
    #  endif
    #endif
    #include <time.h>
    
    /*
    ** WEBPAGE: register
    **
    ** Generate the register page.
    **
    */
    void register_page(void){
      const char *zUsername, *zPasswd, *zConfirm, *zContact, *zCS, *zPw, *zCap;
    
      style_header("Register");
      zUsername = P("u");
      zPasswd = P("p");
      zConfirm = P("cp");
      zContact = P("c");
      zCap = P("cap");
      zCS = P("cs"); /* Captcha Secret */
    
      /* Try to make any sense from user input. */
      if( P("new") ){
        zPw = captcha_decode((unsigned int)atoi(zCS)); /* If zCS == null this will
                                                          kill the page, what is in
                                                          fact good, as the request
                                                          is forged.*/
        if( !(zUsername && zPasswd && zConfirm && zContact) ){
          @ <p><span class="loginError">
          @ All fields are obligatory.
          @ </span></p>
        }else if( strcmp(zPasswd,zConfirm)!=0 ){
          @ <p><span class="loginError">
          @ The two copies of your new passwords do not match.
          @ </span></p>
        }else if( strcasecmp(zPw, zCap)!=0 ){
          @ <p><span class="loginError">
          @ Captcha text invalid.
          @ </span></p>
        }else{
          /* This almost is stupid copy-paste of code from user.c:user_cmd(). Meh. */
          Blob passwd, login, contact;
    
          blob_init(&login, zUsername, -1);
          blob_init(&contact, zContact, -1);
          blob_init(&passwd, zPasswd, -1);
    
          if( db_exists("SELECT 1 FROM user WHERE login=%B", &login) ){
            /* Here lies the reason I don't use zErrMsg - it would not substitute
             * this %s(zUsername), or at least I don't know how to force it to.*/
            @ <p><span class="loginError">
            @ %s(zUsername) already exists.
            @ </span></p>
          }else{
            char *zPw = sha1_shared_secret(blob_str(&passwd), blob_str(&login));
            db_multi_exec(
                "INSERT INTO user(login,pw,cap,info)"
                "VALUES(%B,%Q,'u',%B)", /* u - register as reader, not developer! */
                &login, zPw, &contact
                );
            free(zPw);
    
            /* The user is registered, now just log him in. */
            int uid = db_int(0, "SELECT uid FROM user WHERE login=%Q", zUsername);
            char *zCookie;
            const char *zCookieName = login_cookie_name();
            const char *zExpire = db_get("cookie-expire","8766");
            int expires = atoi(zExpire)*3600;
            const char *zIpAddr = PD("REMOTE_ADDR","nil");
    
            zCookie = db_text(0, "SELECT '%d/' || hex(randomblob(25))", uid);
            cgi_set_cookie(zCookieName, zCookie, 0, expires);
            db_multi_exec(
                "UPDATE user SET cookie=%Q, ipaddr=%Q, "
                "  cexpire=julianday('now')+%d/86400.0 WHERE uid=%d",
                zCookie, zIpAddr, expires, uid
                );
            redirect_to_g();
    
          }
        }
      }
    
      /* Prepare the captcha. */
      unsigned int uSeed = captcha_seed();
      char const *zDecoded = captcha_decode(uSeed);
      char *zCaptcha = captcha_render(zDecoded);
    
      /* Print out the registration form. */
      @ <form action="register" method="post">
      if( P("g") ){
        @ <input type="hidden" name="g" value="%h(P("g"))" />
      }
      @ <p><input type="hidden" name="cs" value="%u(uSeed)" />
      @ <table class="login_out">
      @ <tr>
      @   <td class="login_out_label">User ID:</td>
      @   <td><input type="text" id="u" name="u" value="" size="30" /></td>
      @ </tr>
      @ <tr>
      @   <td class="login_out_label">Password:</td>
      @   <td><input type="password" id="p" name="p" value="" size="30" /></td>
      @ </tr>
      @ <tr>
      @   <td class="login_out_label">Confirm password:</td>
      @   <td><input type="password" id="cp" name="cp" value="" size="30" /></td>
      @ </tr>
      @ <tr>
      @   <td class="login_out_label">Contact info:</td>
      @   <td><input type="text" id="c" name="c" value="" size="30" /></td>
      @ </tr>
      @ <tr>
      @   <td class="login_out_label">Captcha text (below):</td>
      @   <td><input type="text" id="cap" name="cap" value="" size="30" /></td>
      @ </tr>
      @ <tr><td></td>
      @ <td><input type="submit" name="new" value="Register" /></td></tr>
      @ </table>
      @ <div class="captcha"><table class="captcha"><tr><td><pre>
      @ %s(zCaptcha)
      @ </pre></td></tr></table>
      @ </form>
        ;
      style_footer();
    
      free(zCaptcha);
    }
    
    // vim: set ts=2 sw=2 sts=2 et :
    

# Komentarze

* airborn (2010-12-05 17:31:47): <p>prawie jak bym widział swoją
  magisterkę...</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-05 17:37:15): <p>Współczuję... Ja do
  swojej kodowałem w Pythonie, acz i to było małym dodatkiem do teorii.</p>
* Bartek (2010-12-06 14:46:56): <p>W C jest operator @ ? co on robi?</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-06 14:48:22): <p>To jest magia
  preprocessingu. W którymś momencie procesu kompilacji jest to tłumaczone na
  coś printf-o-podobnego wysyłającego do klienta html.</p>
* pecet (2010-12-06 21:51:31): <p>Taki postprocessing tylko zaciemnia kod. C
  lubię za prostotę i dość dużą kontrolę nad tym co się dzieje, to jest niestety
  przeciwieństwem tego :/</p>
* lRem (2010-12-07 13:32:17): <p>No sam nie wiem. Co jest jaśniejsze. Wersja z
  tym dzikim preprocesingiem:</p>  <pre><code>@ &lt;input type="hidden" name="g"
  value="%h(P("g"))" /&gt; </code></pre>  <p>Czy bez niego:</p>
  <pre><code>cgi_printf("&lt;input type=\"hidden\" name=\"g\" value=\"%h\"
  /&gt;\n",P("g")); </code></pre>
* SebaS86 (2010-12-07 18:44:50): <p>Ale to chyba jakiś zewnętrzny
  preprocesor?</p>
* pecet (2010-12-07 20:32:55): <p>lrem -- pomijając konieczność escapowania " "
  " to wydaje się całkiem czytelna wersja z printf IMHO</p>
* Remigiusz 'lRem' Modrzejewski (2010-12-08 15:38:56): <p>SebaS86: ta, to jest w
  ogóle dziki makesystem gdzie make wywołuje skrypt w TCL-u który tworzy
  następny Makefile, wszystkie źródła są przemielone przez dodatkowy
  preprocesor, który również jest kompilowany w międzyczasie, na koniec nawet
  tworzy toto paczki. Część plików .c tworzonych jest podczas budowania na
  podstawie informacji zaszytych w komentarzach innych plików. Jak dodasz do
  tego jeszcze natywną obsługę <em>cross-compile</em>, to wyobrazisz sobie z
  jakim monstrum ma się do czynienia chcąc cokolwiek dodać.</p>
* dafabet (2014-05-22 15:37:58): <p>Hello i am kavin, its my first time to
  commenting anyplace, when i read this <br /> article i thought i could also
  create comment due to this good piece <br /> of writing.</p>
* magnapress mx (2014-05-27 00:37:38): <p>I am not sure where you're getting
  your information, but good topic.<br /> I needs to spend some time learning
  much more or understanding more.<br /> Thanks for fantastic information I was
  looking for this <br /> info for my mission.</p>
* megajoker (2014-06-15 00:24:38): <p>Heya i am for the primary time here. I
  found this board and I find It really helpful &amp; <br /> it helped me out
  much. I'm hoping to give one thing again and help others like you aided <br />
  me.</p>
* netticasino bonus (2014-06-17 13:20:48): <p>Hello, I enjoy reading all of your
  article post. I wanted to write <br /> a little comment to support you.</p>
* Horse Rubber Mats (2014-06-26 21:24:27): <p>Depending on how you intend to use
  your new racking system, different optional extras may be appropriate.</p>
  <p>A cement floor, slippery tile or brick wall can quickly end the laughter
  <br /> if a child falls or bumps their head into such types of <br /> hard
  surfaces. Apparently, there must be some kind of psychic <br /> connection
  between the concept of rubbery floor surfaces and colors <br /> that seem to
  belong in a kindergarten.</p>
* gokkastenpaleis.nl (2014-07-08 22:54:52): <p>hello!,I really like your writing
  so much! proportion we communicate more approximately your article on AOL?<br
  /> I need an expert in this house to resolve my problem.<br /> May be that is
  you! Looking forward to see you.</p>
* exclusive bouncy castle (2014-07-12 03:00:53): <p>Every weekend i used to go
  to see this web site, as i wish for enjoyment, for the reason that this <br />
  this site conations actually nice funny information too.</p>
* Norgesautomaten Spill (2014-07-12 03:27:09): <p>Hi, its good piece of writing
  concerning media print, we all understand media is a enormous source <br /> of
  facts.</p>
* spillemaskiner (2014-09-02 12:03:05): <p>This is very attention-grabbing,
  You're a very skilled blogger.</p>  <p>I've joined your feed and stay up for
  in search of more of your great post.<br /> Additionally, I've shared your
  site in my social networks</p>
* google (2014-09-04 16:15:49): <p>We are a bunch of volunteers and opening a
  new scheme in our <br /> community. Your website offered us with valuable
  information to work on. You've performed a formidable task and our whole group
  will likely be <br /> thankful to you.</p>
* Foosball Table Guide (2014-09-11 01:00:00): <p>Hmm is anyone else experiencing
  problems with the images on this blog loading?<br /> I'm trying to find out if
  its a problem on my end <br /> or if it's the blog. Any feedback would be
  greatly appreciated.</p>
* school leaver hoodies (2014-09-17 21:14:56): <p>My programmer is trying to
  persuade me to move to .net <br /> from PHP. I have always disliked the idea
  because of thhe <br /> expenses. But he's tryiong none the less. I've been
  using WordPress on a variety of websites for about a year <br /> and am
  concerned about switching to another platform.<br /> I have heard fantastic
  things about blogengine.net.<br /> Is there a way I can transfer all my
  wordpress content into it?</p>  <p>Any help would bbe greatly appreciated!</p>
* nashville seo services (2014-09-25 07:18:35): <p>Hi, after reading this
  amazing post i am also <br /> cheerful to share my knowledge here with
  mates.</p>
* Bit.ly (2014-09-29 09:24:33): <p>Ini adalah pic terkeren yang pernah ambo
  pantau selama ini .<br /> gw juga sukaa hasil sepakbolawebsite cepat lihat ke
  Www.NuGoal.com</p>
* http://tr.anpasia.com/track?t=c&amp;mid=1902 (2014-10-07 19:25:36): <p>Good
  web site you have here.. It's hard to find quality <br /> writing like yours
  these days. I seriously appreciate individuals like you!<br /> Take care!!</p>
* Does Fibroids Miracle Work (2014-10-09 20:54:20): <p>You actually make it seem
  so easy together with your <br /> presentation however I in finding this
  matter to be actually something which <br /> I feel I might never understand.
  It seems too complicated and very broad for me.</p>  <p>I am taking a look
  ahead to your next post, I'll try to get the cling of it!</p>
* judi bola (2014-10-17 02:27:13): <p>RajaJudi88.ϲom ialah sebuah website judi
  online yang menawarkan permainan judi bola ɗan berbagai permainan lain yang
  menarik yang bisa Anda ikuti.Sebagai Bandar <br /> Bola Ԁan Agen Bola
  terpercaya Ԁan sudah memiliki banyak <br /> pengalaman dalam mengelola website
  pemainan judi,kami akan memberikan pelayanan terbaik untuk Anda,sehingga Anda
  akan dapat menikmati taruhan bola atau berbagai pemainan menarik lainnya <br
  /> dengan perasaan nyaman ɗan aman selama bermain melalui website kami.</p>
  <p>Melalui website taruhan bola RajaJudi.сom ini,Anda akan dapat mengikuti
  berbagai <br /> permainan yang seru ԁan menarik deengan kenyamanan dan
  keamanan dalam haal bermain ԁan juga bertransaksi<br /> Dengan pengalaman kami
  selama ini dalam melayani semua mеmber-mеmber setia kami,kini kami telah <br
  /> menjadi salah sau bandar bola atau agen bola terbaik Ԁi Indonesia.Bisnis
  Judi Online adalah bidang yang sudah sangat kami kuasai sejak lama,<br />
  sehingga kami kini berani menjamin jika Anda akan mendapatkan pelayanan
  memuaskan apabila Anda mendaftar <br /> menjadi mеmber kami,maka Anda akan
  mendapatkan pelayananan yzng super <br /> nyaman karena keramahan Ԁan
  professionalisme yamg di berikan oleh staff Customer Service <br /> kami yang
  akan selalu sizp melayani Annda selama 24 Jam penuh,khusus untuk Anda!</p>
  <p>Silahkan hubungi Customer Service kami kapan saja <br /> jika Annda
  memiliki pertanyaan seputar pemainan Judi Online yang <br /> kami persembahkan
  ɗi website ini.Teima Kasih.</p>
* SEO Company (2014-10-17 02:46:29): <p>Thanks for one's marvelous posting! I
  actually enjoyed <br /> reading it, you may be a great author.I will always
  bookmark your blog and definitely will come back someday.<br /> I want to
  encourage that you continue your great work,<br /> have a nice evening!<br />
  I absolutely love your blog and find the majority of your post's <br /> to be
  just what I'm looking for. can you offer guest writers to write content for
  <br /> you personally? I wouldn't mind publishing a post or elaborating <br />
  on a number of the subjects you write regarding here.<br /> Again, awesome
  weblog!<br /> My spouse and I stumbled over here coming from a different page
  and <br /> thought I should check things out. I like what I see so now i am
  following you.<br /> Look forward to finding out about your web page
  repeatedly.</p>  <p>I enjoy what you guys tend to be up too. This sort of
  clever work and coverage!<br /> Keep up the good works guys I've you guys to
  my blogroll.</p>  <p>Howdy I am so delighted I found your weblog, <br /> I
  really found you by accident, while I was looking on Aol for something
  else,<br /> Anyways I am here now and would just like to say many <br />
  thanks for a marvelous post and a all round exciting blog (I also love the
  theme/design), I don’t have <br /> time to read it all at the moment but I
  have saved it and <br /> also added in your RSS feeds, so when I have time I
  will be back to read more, <br /> Please do keep up the superb job.<br />
  Admiring the time and energy you put into your site and in depth information
  you <br /> provide. It's good to come across a blog every once in a while that
  isn't the <br /> same old rehashed material. Excellent read! I've saved your
  site and I'm including your RSS <br /> feeds to my Google account.<br /> Hey
  there! I've been following your blog for a long time now and finally <br />
  got the bravery to go ahead and give you a shout out from Lubbock Tx!<br />
  Just wanted to mention keep up the excellent job!<br /> I'm really loving the
  theme/design of your site. Do you ever run into <br /> any web browser
  compatibility problems? A small <br /> number of my blog audience have
  complained about my website not operating correctly in Explorer but <br />
  looks great in Chrome. Do you have any ideas to help fix this problem?</p>
  <p>I'm curious to find out what blog platform you are working with?<br /> I'm
  having some small security problems with my latest website and I'd <br /> like
  to find something more safeguarded. Do you have any suggestions?</p>  <p>Hmm
  it appears like your site ate my first comment (it was extremely <br /> long)
  so I guess I'll just sum it up what I wrote and say, I'm thoroughly enjoying
  your blog.<br /> I too am an aspiring blog blogger but I'm still new to <br />
  everything. Do you have any recommendations for novice blog <br /> writers?
  I'd definitely appreciate it.<br /> Woah! I'm really enjoying the
  template/theme of this website.</p>  <p>It's simple, yet effective. A lot of
  times it's very difficult to get that "perfect balance" between usability and
  <br /> visual appearance. I must say that you've done a amazing job with
  this.<br /> Additionally, the blog loads extremely fast for me on Opera.<br />
  Excellent Blog!<br /> Do you mind if I quote a couple of your posts as long as
  I provide credit and sources back <br /> to your site? My blog site is in the
  exact same area of interest as yours and my users would genuinely benefit from
  some of the information you <br /> present here. Please let me know if this
  okay with you.<br /> Appreciate it!<br /> Hey would you mind letting me know
  which webhost you're using?</p>  <p>I've loaded your blog in 3 completely
  different web browsers and I must say this blog loads <br /> a lot quicker
  then most. Can you recommend a good hosting provider at a honest price?<br />
  Many thanks, I appreciate it!<br /> Fantastic site you have here but I was
  wondering <br /> if you knew of any forums that cover the same topics talked
  about here?<br /> I'd really love to be a part of online community where I can
  get suggestions from other knowledgeable people that share the same
  interest.</p>  <p>If you have any recommendations, please let me know.<br />
  Thanks!<br /> Howdy! This is my first comment here so I just wanted to give a
  <br /> quick shout out and tell you I really enjoy reading your posts.<br />
  Can you recommend any other blogs/websites/forums that go over the same
  subjects?<br /> Thanks a ton!<br /> Do you have a spam issue on this site; I
  also am a blogger,<br /> and I was curious about your situation; we have
  developed some nice procedures and we are looking to <br /> swap solutions
  with others, why not shoot me an e-mail if interested.</p>  <p>Please let me
  know if you're looking for a article writer for <br /> your weblog. You have
  some really great articles and I think I would <br /> be a good asset. If you
  ever want to take some of the load off, I'd love to write some content for <br
  /> your blog in exchange for a link back to mine.<br /> Please send me an
  e-mail if interested. Thanks!</p>  <p>Have you ever considered about adding a
  little bit more than just <br /> your articles? I mean, what you say is
  fundamental and all.<br /> However just imagine if you added some great photos
  or video clips to give your posts more, "pop"!<br /> Your content is excellent
  but with images and video clips, this <br /> site could definitely be one of
  the very best in its field.<br /> Excellent blog!<br /> Cool blog! Is your
  theme custom made or did you download it from somewhere?<br /> A theme like
  yours with a few simple adjustements would really make my blog stand out.<br
  /> Please let me know where you got your theme. Thanks<br /> Hi would you mind
  sharing which blog platform you're working with?</p>  <p>I'm planning to start
  my own blog in the near future but <br /> I'm having a hard time selecting
  between BlogEngine/Wordpress/B2evolution and Drupal.<br /> The reason I ask is
  because your design and style seems different then most blogs <br /> and I'm
  looking for something completely unique. P.S <br /> Apologies for getting off-
  topic but I had to ask!<br /> Hello just wanted to give you a quick heads up.
  The text in your post seem to be <br /> running off the screen in Safari. I'm
  not sure if this is a <br /> formatting issue or something to do with browser
  compatibility but I <br /> figured I'd post to let you know. The design look
  great though!<br /> Hope you get the issue resolved soon. Many thanks<br />
  With havin so much content and articles do you ever run into any problems of
  plagorism or copyright infringement?<br /> My blog has a lot of unique content
  I've either created myself or outsourced but <br /> it looks like a lot of it
  is popping it up all <br /> over the web without my agreement. Do you know any
  solutions to help prevent content <br /> from being ripped off? I'd truly
  appreciate it.<br /> Have you ever thought about creating an e-book or guest
  authoring <br /> on other blogs? I have a blog based upon on the same ideas
  you <br /> discuss and would love to have you share some stories/information.
  <br /> I know my viewers would appreciate your work. If <br /> you're even
  remotely interested, feel free to send me an email.</p>  <p>Hi there! Someone
  in my Facebook group shared this site with us so I <br /> came to check it
  out. I'm definitely loving the information. <br /> I'm book-marking and will
  be tweeting this to my followers!<br /> Fantastic blog and wonderful style and
  design.<br /> Wonderful blog! Do you have any recommendations for aspiring
  writers?<br /> I'm planning to start my own blog soon but I'm a little <br />
  lost on everything. Would you propose starting with a free platform like
  Wordpress or <br /> go for a paid option? There are so many options out there
  that <br /> I'm completely confused .. Any recommendations?<br /> Cheers!<br
  /> My developer is trying to persuade me to move to .net from <br /> PHP. I
  have always disliked the idea because of the expenses.<br /> But he's tryiong
  none the less. I've been using <br /> Movable-type on a variety of websites
  for about <br /> a year and am concerned about switching to another
  platform.<br /> I have heard very good things about blogengine.net. Is there a
  way I <br /> can import all my wordpress content into it? Any kind of help
  would be really appreciated!</p>  <p>Does your website have a contact page?
  I'm having trouble locating it but, I'd like to <br /> shoot you an email.
  I've got some recommendations for your blog you might be interested <br /> in
  hearing. Either way, great blog and I look forward to seeing <br /> it grow
  over time.<br /> It's a pity you don't have a donate button! I'd <br />
  certainly donate to this brilliant blog! I suppose for now i'll settle for
  book-marking and adding your RSS feed to my Google account.<br /> I look
  forward to fresh updates and will talk about this website with my Facebook
  group.<br /> Chat soon!<br /> Greetings from Carolina! I'm bored to tears at
  work so I decided to browse your website on my iphone during lunch break.<br
  /> I enjoy the knowledge you provide here and can't wait <br /> to take a look
  when I get home. I'm shocked at how quick your blog loaded on my mobile ..<br
  /> I'm not even using WIFI, just 3G .. Anyways, very good blog!</p>
  <p>Greetings! I know this is kinda off topic however I'd figured I'd ask.</p>
  <p>Would you be interested in exchanging links or maybe guest authoring a blog
  post or vice-versa?<br /> My blog addresses a lot of the same subjects <br />
  as yours and I believe we could greatly benefit from each other.<br /> If
  you're interested feel free to send me an email.<br /> I look forward to
  hearing from you! Terrific blog by the way!</p>  <p>Right now it looks like
  Expression Engine is the best blogging platform available right now.<br />
  (from what I've read) Is that what you're using on your blog?</p>  <p>Good
  post but I was wondering if you could write a litte more on this subject?<br
  /> I'd be very grateful if you could elaborate a little <br /> bit more.
  Thanks!<br /> Hi there! I know this is kind of off topic but I was wondering
  if you knew where I could get <br /> a captcha plugin for my comment form? I'm
  using the same <br /> blog platform as yours and I'm having trouble finding
  one?<br /> Thanks a lot!<br /> When I initially commented I clicked the
  "Notify me when new comments are added" checkbox and now <br /> each time a
  comment is added I get four emails with the same comment.<br /> Is there any
  way you can remove people from that service?<br /> Thank you!<br /> Howdy!
  This is my first visit to your blog! We are a collection of volunteers and
  starting a <br /> new project in a community in the same niche.</p>  <p>Your
  blog provided us useful information to work on. You have done a <br />
  outstanding job!<br /> Hey there! I know this is kind of off topic but I was
  wondering which <br /> blog platform are you using for this site? I'm <br />
  getting tired of Wordpress because I've had issues with hackers and I'm
  looking at options for another platform.</p>  <p>I would be great if you could
  point me in the direction of a good platform.</p>  <p>Good day! This post
  could not be written any better!<br /> Reading through this post reminds me of
  my old room mate!</p>  <p>He always kept talking about this. I will <br />
  forward this write-up to him. Fairly certain he will have a good read.<br />
  Thank you for sharing!<br /> Write more, thats all I have to say. Literally,
  it seems as though <br /> you relied on the video to make your point. You
  clearly know what youre talking about, <br /> why waste your intelligence on
  just posting videos to your blog <br /> when you could be giving us something
  informative to <br /> read?<br /> Today, I went to the beach with my kids. I
  found a sea shell and gave it to my 4 year old daughter and said "You can hear
  the ocean if you put this to your ear." She put the shell to her ear <br />
  and screamed. There was a hermit crab inside and it pinched <br /> her ear.
  She never wants to go back! LoL I know this is entirely off topic but I had to
  tell someone!</p>  <p>The other day, while I was at work, my cousin stole my
  iphone and <br /> tested to see if it can survive a 40 foot drop, just so she
  can be a youtube sensation. My iPad is now destroyed and she <br /> has 83
  views. I know this is totally off topic but I had to share it with
  someone!</p>  <p>I was curious if you ever thought of changing the layout of
  your site?<br /> Its very well written; I love what youve <br /> got to say.
  But maybe you could a little more in the way of <br /> content so people could
  connect with it better.<br /> Youve got an awful lot of text for only having
  one or 2 images.<br /> Maybe you could space it out better?<br /> Hi, i read
  your blog occasionally and i own a similar one and i was just wondering if you
  get a lot of spam responses?</p>  <p>If so how do you prevent it, any plugin
  or anything you can advise?<br /> I get so much lately it's driving me mad so
  any help <br /> is very much appreciated.<br /> This design is steller! You
  certainly know how to keep a reader amused.</p>  <p>Between your wit and your
  videos, I was almost <br /> moved to start my own blog (well, almost...HaHa!)
  Great job.<br /> I really loved what you had to say, and more than that, how
  <br /> you presented it. Too cool!<br /> I'm really enjoying the design and
  layout of your <br /> site. It's a very easy on the eyes which makes it <br />
  much more pleasant for me to come here and visit more often. Did <br /> you
  hire out a developer to create your theme? Excellent work!</p>  <p>Hey there!
  I could have sworn I've been to this website before but after <br /> checking
  through some of the post I realized it's new to me.<br /> Anyways, I'm
  definitely glad I found it and I'll be bookmarking and checking back often!<br
  /> Good day! Would you mind if I share your blog with my twitter <br /> group?
  There's a lot of people that I think would really enjoy your content.<br />
  Please let me know. Thank you<br /> Hey, I think your website might be having
  browser compatibility issues.<br /> When I look at your blog site in Chrome,
  it looks <br /> fine but when opening in Internet Explorer, it has some
  overlapping.</p>  <p>I just wanted to give you a quick heads up! Other then
  that, very good blog!</p>  <p>Wonderful blog! I found it while searching on
  Yahoo News.<br /> Do you have any tips on how to get listed in Yahoo News?</p>
  <p>I've been trying for a while but I never seem to get there!<br /> Cheers<br
  /> Hey there! This is kind of off topic but I need some help from <br /> an
  established blog. Is it very hard to set up your own blog?</p>  <p>I'm not
  very techincal but I can figure things out <br /> pretty quick. I'm thinking
  about making my own but I'm not sure where <br /> to begin. Do you have any
  tips or suggestions?<br /> Many thanks<br /> Greetings! Quick question that's
  totally off topic.<br /> Do you know how to make your site mobile friendly? My
  weblog looks weird <br /> when browsing from my iphone4. I'm trying to find a
  <br /> theme or plugin that might be able to fix this problem.<br /> If you
  have any suggestions, please share. Many thanks!<br /> I’m not that much of a
  internet reader to be honest but your <br /> blogs really nice, keep it up!
  I'll go ahead and bookmark your website to <br /> come back later. Cheers<br
  /> I love your blog.. very nice colors &amp; theme. Did you design this
  website yourself or did you hire someone <br /> to do it for you? Plz respond
  as I'm looking to construct my own blog <br /> and would like to know where u
  got this from. thanks<br /> Amazing! This blog looks exactly like my old one!
  It's on a entirely <br /> different subject but it has pretty much the same
  layout and design. Wonderful choice of colors!</p>  <p>Hello just wanted to
  give you a brief heads up and let you know a few of the images aren't loading
  properly.<br /> I'm not sure why but I think its a linking issue.<br /> I've
  tried it in two different internet browsers and both <br /> show the same
  outcome.<br /> Hey are using Wordpress for your site platform?<br /> I'm new
  to the blog world but I'm trying to get started and create my own. Do you
  require any coding expertise to make your own blog?<br /> Any help would be
  really appreciated!<br /> Hey there this is kind of of off topic but I was
  wondering if blogs use WYSIWYG editors or if <br /> you have to manually code
  with HTML. I'm starting a blog soon but have no coding know-how so I wanted to
  get guidance from <br /> someone with experience. Any help would be greatly
  appreciated!</p>  <p>Hey there! I just wanted to ask if you ever have any
  issues with hackers?<br /> My last blog (wordpress) was hacked and I ended up
  losing several weeks of hard work due <br /> to no backup. Do you have any
  methods to prevent hackers?</p>  <p>Hello there! Do you use Twitter? I'd like
  to follow you if that would be <br /> okay. I'm undoubtedly enjoying your blog
  and look forward to new posts.</p>  <p>Hey there! Do you know if they make any
  plugins to <br /> protect against hackers? I'm kinda paranoid about losing
  everything I've worked hard on. Any suggestions?</p>  <p>Hi! Do you know if
  they make any plugins to help with SEO?<br /> I'm trying to get my blog to
  rank for some targeted keywords but I'm not <br /> seeing very good success.
  If you know of any please share.<br /> Many thanks!<br /> I know this if off
  topic but I'm looking into starting my own blog and was curious what all <br
  /> is needed to get setup? I'm assuming having a blog like yours would cost a
  <br /> pretty penny? I'm not very internet savvy so <br /> I'm not 100%
  certain. Any tips or advice would be greatly appreciated.<br /> Many thanks<br
  /> Hmm is anyone else having problems with the pictures on this <br /> blog
  loading? I'm trying to determine if its a problem on my <br /> end or if it's
  the blog. Any feed-back would be greatly appreciated.</p>  <p>I'm not sure why
  but this site is loading incredibly slow for me.<br /> Is anyone else having
  this problem or is it a problem on my end?</p>  <p>I'll check back later on
  and see if the problem still exists.</p>  <p>Hey there! I'm at work browsing
  your blog from my new iphone!<br /> Just wanted to say I love reading through
  your blog and look forward to all your posts!<br /> Keep up the fantastic
  work!<br /> Wow that was odd. I just wrote an really long comment but <br />
  after I clicked submit my comment didn't show up. Grrrr... <br /> well I'm not
  writing all that over again. Anyhow, just wanted to say wonderful blog!</p>
  <p>Hey superb blog! Does running a blog like this require a great deal of
  work?<br /> I have very little expertise in coding but I was hoping to start
  my own blog in the near future.</p>  <p>Anyways, if you have any suggestions
  or tips for new blog owners please share.</p>  <p>I understand this is off
  topic but I simply had to ask. Cheers!</p>  <p>Hey there! I realize this is
  sort of off-topic but I needed to ask.</p>  <p>Does running a well-established
  website such as yours require a lot of work?<br /> I'm completely new to
  writing a blog but I do write in my diary daily.<br /> I'd like to start a
  blog so I can share my own experience and feelings <br /> online. Please let
  me know if you have any ideas or tips for brand new aspiring blog owners.<br
  /> Appreciate it!<br /> Hey I know this is off topic but I was wondering if
  you <br /> knew of any widgets I could add to my blog that automatically tweet
  my newest twitter updates.<br /> I've been looking for a plug-in like this for
  quite some time and <br /> was hoping maybe you would have some experience
  with something <br /> like this. Please let me know if you run into
  anything.<br /> I truly enjoy reading your blog and I look forward to <br />
  your new updates.<br /> I do not know if it's just me or if perhaps everyone
  else experiencing issues with <br /> your blog. It appears as if some of the
  written text on your posts are running off the screen. Can somebody <br />
  else please comment and let me know if this is happening to them too?<br />
  This could be a issue with my internet browser because <br /> I've had this
  happen before. Many thanks<br /> First of all I want to say awesome blog! I
  had a quick question which <br /> I'd like to ask if you don't mind. I was
  interested to know how you center yourself and <br /> clear your thoughts
  prior to writing. I have had a hard time clearing my mind in getting my ideas
  out there.<br /> I truly do enjoy writing but it just seems like the first 10
  to 15 <br /> minutes are generally wasted simply just trying to figure out how
  to begin. Any suggestions <br /> or hints? Thank you!</p>
* daily health tips (2014-10-27 09:50:56): <p>alll the time i used to read
  smaller articles or reviews which as well clear their motive, and <br /> that
  is also happening with this article which I am reading <br /> here.</p>
* rampage site (2014-11-08 12:18:20): <p>Hello every one, here every person is
  sharing these familiarity, <br /> thus it's nice to read this web site, and I
  used to pay a quick visit this website everyday.</p>
* how to boil eggs (2014-11-09 08:30:36): <p>Nice webvlog right here! Also your
  website a lot up fast!</p>  <p>What web host are you using? Can I get your
  affiliate hyperliink on your host?<br /> I desire my website loaded up as
  quickly as yours lol</p>
* hausfrauensex (2014-11-10 14:44:56): <p>Good way of describing, and fastidious
  article to get data regarding my presentation subjdct matter, <br /> which i
  am going to deliuver in school.</p>
* smokeless cigarettes (2014-11-29 20:00:31): <p>Yes! Finally someone writes
  about smokeless cigarettes.</p>
* ZQuiet (2014-12-17 04:00:03): <p>Greetings! Very helpful advice within this
  article!</p>  <p>It's the little changes which will make the most significant
  changes.</p>  <p>Many thanks for sharing!</p>
* Eve (2014-12-17 12:42:27): <p>I loved as much as you will receive carried <br
  /> out right here. The sketch is tasteful, your authored material stylish.<br
  /> nonetheless, you command get got an shakiness over that you wish be
  delivering the following.<br /> unwell unquestionably come more formerly again
  as <br /> exactly the same nearly very often inside case you shield this
  hike.</p>
* gdzie cięgnęę jednorękiego bandyty (2014-12-19 05:25:32): <p>Thanks for
  finally writing about &gt;To niby jest C - lRem's blog <br /> &lt;Loved
  it!</p>
* gdzie cięgnęę jednorękiego bandyty (2014-12-19 05:47:40): <p>Thanks for
  finally writing about &gt;To niby jest C - lRem's blog &lt;Loved it!</p>
