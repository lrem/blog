+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2013-05-22T12:08:52"
draft = false
title = "Bezbłędny soft 2"
+++
Jak już kiedyś wspominałem, [TeX jest
bezbłędny](http://blog.lrem.net/2012/09/27/bezbledny-soft/). Ja zaś znowu
znalazłem przykład _dziwnego zachowania_ w LaTeXu. Przy próbie kompilacji
otrzymuję piękny błąd:

> `! LaTeX Error: \begin{table} on input line 1130 ended by \end{table}`

Zagadka: jak takie coś wywołać? :D

# Komentarze

* pecet (2013-05-22 13:18:41): <p>Zagnieżdżenie jakieś nieprawidłowe może?</p>
* Remigiusz 'lRem' Modrzejewski (2013-05-22 13:25:12): <p>Nie. Da się wywołać
  tylko tym jednym środowiskiem, bez niczego w środku.</p>
* rjc (2013-05-22 15:00:22): <p>Bo 'table' wymaga tabeli zdefiniowanej przez
  'tabular'.</p>
* Remigiusz 'lRem' Modrzejewski (2013-05-22 16:09:42): <p>Nie trafiłeś.
  Całkowicie poprawnym dokumentem jest:</p>  <pre><code>\documentclass{article}
  \begin{document} \begin{table}     Lorem ipsum blah blah. \end{table}
  \end{document} </code></pre>
* rjc (2013-05-23 12:01:52): <p>W takim razie wymaga "czegos", 'tabular' byl dla
  mnie oczywistym wyborem ;^)</p>  <p>table - do tabel z 'floatem' i do
  odnoszenia sie do wczesniej zdefiniowanych tabel, z 'tabular' w srodku</p>
  <p>tabular - do tabel 'inline'</p>
* adult sex cams (2014-05-19 20:20:58): <p>Good write-up. I definitely
  appreciate this website. Stick with it!</p>
* Karen Walker Sunglasses (2014-05-19 20:41:14): <p>What i do not realize is in
  fact how you are now not really much more smartly-preferred <br /> than you
  might be now. You are so intelligent. You know thus significantly relating <br
  /> to this subject, made me in my view consider it from so many numerous
  angles.</p>  <p>Its like women and men are not fascinated until it's <br />
  one thing to accomplish with Girl gaga! Your personal stuffs nice.<br /> At
  all times deal with it up!</p>
* gewora (2014-07-05 07:04:17): <p>It's a shame you don't have a donate button!
  I'd certainly donate to this excellent blog!</p>  <p>I suppose for now i'll
  settle for book-marking and adding your <br /> RSS feed to my Google account.
  I look forward to fresh updates <br /> and will talk about this website with
  my Facebook group.</p>  <p>Chat soon!</p>
* earn online unlimited (2014-07-07 03:01:50): <p>Howdy just wanted to give you
  a brief heads up and let you know a few of <br /> the images aren't loading
  correctly. I'm not sure why but I think its a linking issue.<br /> I've tried
  it in two different web browsers and both show <br /> the same results.</p>
* Christin (2014-10-01 15:23:34): <p>Greetings! Very helpful advice in this
  particular post!<br /> It's the little changes which will make the most
  significant changes.<br /> Many thanks for sharing!</p>
* Kellye (2014-10-10 22:25:12): <p>You really make it seem so easy with your
  presentation but I <br /> find this topic to be really something which I think
  I would never understand.<br /> It seems too complicated and very broad for
  me. I am looking <br /> forward for your next post, I will try to get the hang
  of <br /> it!</p>
* Fish With Captain Frank (2014-11-02 12:42:58): <p>Wow, incredible blog layout!
  How long have you <br /> been blogging for? you made blogging look easy.</p>
  <p>The overall look of your web site is excellent, <br /> let alone the
  content!</p>
* Nike Womens Shoes (2014-12-05 07:06:18): <p>Was Mark a member of the League of
  Extraordinary Gentlemen? If not, he needs to be inducted.<br /> Reside
  Extended and Prosper Sir!</p>
* how to lose 10 pounds a month naturally  (2015-03-05 02:40:08): <p>Toxins,
  which can be bodily wastes, can also be <br /> released in the body as being a
  person works out.<br /> If you cannot know this, carbohydrates actually
  transforms <br /> into sugar once it is going into one's body.<br /> Working
  out with a workout buddy can also help, in this <br /> way you stay motivated
  and focused to stay on track.</p>
* dr oz green tea weight loss (2015-03-26 20:50:34): <p>Who can say no the
  benefits of this lean green veggie.</p>  <p>Crunches and sit-ups are primary
  exercises that help develop the <br /> abs you seek. With some routine
  exercises, a sound eating plan, and a healthy lifestyle <br /> youu will get
  the results that you want in no time <br /> att all.</p>
* online paid surveys (2015-04-17 09:52:19): <p>Greetings from California! I'm
  bored to tears at work so I decided to <br /> check out your site on my iphone
  during lunch break. I enjoy the information you provide here and can't wait to
  take a <br /> look when I get home. I'm amazed at how quick your blog loaded
  on my mobile ..<br /> I'm not even using WIFI, just 3G .. Anyhow, excellent
  site!</p>
