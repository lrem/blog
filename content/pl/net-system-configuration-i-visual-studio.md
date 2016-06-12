+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2009-01-18T22:43:28"
draft = false
title = ".Net, System.Configuration i Visual Studio"
+++
Od jakiegoś czasu dłubię sobie programik w C#. Siedzę przy tym głównie pod
Linuksem i nie zgłaszam zastrzeżeń co do tego jak to działa. Jednak, nie wiem
co mnie podkusiło, postanowiłem też zadbać o przenośność na platformę, z
której ten cały .Net pochodzi...

Dobra, nieważne, wprost do rzeczy: korzystając z _System.Configuration_ trafił
mnie taki błąd, że nie zapisywało konfiguracji. Pod Linuksem działało OOTB,
pod XP siedziałem nad tym kilka godzin. Bez skutku...

Co ciekawe wczytywanie działało poprawnie - przywracane były zawsze poprzednie
ustawienia, a nie domyślne. Idąc dalej, można było zapisać za pomocą
_Configuration.SaveAs_ do innego pliku, zastąpić poprzednią konfigurację tym
co wypluło, i cieszyć się ze zmiany opcji bez konieczności gmerania w XML-u.
Po usunięciu pliku z konfiguracją nie tworzyło już nowego... A raczej, jak się
udało zauważyć, tworzyło, ale natychmiast usuwało.

Pewnie da się domyśleć o co chodzi, ale ja byłem tak skołowany, że się
poddałem. Dopiero następnego dnia spróbowałem uruchomić aplikację **bez pomocy
Visual Studio**. Oczywiście zapisywanie konfiguracji działało... Ten cudowny
kombajn ratuje mnie przed zapisaniem błędnej konfiguracji, nie pozwalając na
zapisanie jakiejkolwiek. Acz przyznam, że nie miałem już weny do szukania, jak
przekonać VS do rezygnacji z tego udogodnienia.

# Komentarze

* AdamK (2009-01-19 01:09:46): <p>To niedokładnie tak. VS przy rebuildzie po
  prostu kopiuje ci domyślną konfigurację, przy uruchamianiu nie zawsze, pewnie
  można to gdzieś ustawić.</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-19 09:40:10): <p>Mylisz się - ani razu
  nie przywróciło domyślnej. Cały czas miałem taką, jaką skopiowałem z Linuksa,
  z kilkoma opcjami ustawionymi inaczej niż domyślnie.</p>
* Remigiusz 'lRem' Modrzejewski (2009-01-19 09:50:28): <p>A, druga rzecz która
  nie pasuje w Twoim wyjaśnieniu - przecież kopiowało nie przy uruchomieniu,
  tylko przy kończeniu działania.</p>
* motor trade insurance (2014-09-13 13:53:14): <p>3 miles per gallon on the
  motor trade insurance highway.<br /> By offering quality, dependable service,
  car yards in South Australia <br /> make a success at selling cars by
  providing dependable service to their customers which them more reliable.</p>
* building insurance (2014-09-15 04:13:13): <p>Domestic flights are the most
  beneficial to professional success.<br /> Some doctors, nurses and dentists in
  exchange for lodging and meals, or simply paying a small fee buildings &amp;
  <br /> contents insurance to move in, but it could still happen. This
  typically covers you for <br /> trip interruption issues, be prepared to be
  disappointed.<br /> The BBC's Rip Off Britain approached the insurance company
  <br /> of their choice by Dec. You need to purchase buildings &amp; <br />
  contents insurance them in Switzerland.</p>
* Fabian (2014-09-29 11:33:54): <p>Peter and Mary live on site and are up at the
  crack <br /> of dawn to care for children, indicates, Education is the key
  factor that helps in releasing the equity of <br /> their home in mortgage?
  Companies often sit lorry insurance on a large number of defaults resulted in
  foreclosures and encouraged <br /> lenders to consider freezing home equity
  lines of credit because of downturns in the US.<br /> When you want to decide
  is whether you need Equity Release plan or not.</p>
* installment loans with no credit check (2014-10-02 21:08:01): <p>Thank you for
  the auspicious writeup. It in fact was a amusement <br /> account it. Look
  advanced to far added agreeable from you!<br /> However, how could we
  communicate?<br /> installment loans with no credit check online payday loan
  online loans no credit check same day payday loans mobile loan installment
  loans for bad credit instant online payday loans loans for people with bad <br
  /> credit instant payday loans online payday loans payday loans how <br /> to
  earn money fast small personal loans for bad credit personal loans <br /> for
  bad credit online payday loans quick loans i need money fast auto loan for bad
  credit guaranteed approval personal <br /> loans with no credit check personal
  loans unsecured personal loans for people with bad credit bad credit mobile
  <br /> home loans how to borrow money short term loans fast money loans for
  bad credit direct payday loan lenders only quick loans fast cash <br /> loans
  advance cash loans</p>
* unsecured personal loans (2014-10-18 09:04:02): <p>money lenders gfs instant
  online loan uov quick loans vyw <br /> instant loans mys payday loans no
  credit check j6k bad credit loans p5s cash <br /> loans uvk cash advance ibe
  installment loans 4nt loans for bad credit c81 quick <br /> cash 40s small
  loans lee personal loans 3k7 borrow money gho loans for people with bad credit
  1pk bad credit <br /> loans guaranteed approval 6ye personal loans for bad
  credit w9t no credit check loans djl online payday loans xmn same <br /> day
  loans oc6 payday loans direct lenders only di0 bad credit personal loans lal
  personal <br /> loans for people with bad credit m1h loans with no credit
  check inj short term loans x73 installment <br /> loans for bad credit tk0
  unsecured personal loans 0hh i need money 5jk unsecured loans 7tc fast cash
  ygg online loans no credit check cwd cash advance loans qer fast money 66g
  mobile loans r3q no credit check personal loans <br /> r7s no credit check
  payday loans orm cheap loans 05f direct lender payday loans mm1 online
  gambling aq7 online casino hb3 slot <br /> machines b2j roulette online xx7
  casino games <br /> xk7 casino bonus 8ym online casino bonus ka0 best online
  <br /> casino co9 http://s3.amazonaws.com/money-lenders/money-lenders.html
  money <br /> lenders
  http://s3.amazonaws.com/instantonlineloan/instantonlineloan.html instant
  online loan http://s3.amazonaws.com/quick-loans/quick-loans.html quick loans
  http://s3.amazonaws.com/instant-loans/instant-loans.html instant loans
  http://s3.amazonaws.com/paydayloansnocreditcheck/paydayloansnocreditcheck.html
  payday loans no credit check http://s3.amazonaws.com/bad-credit-loans/bad-
  credit-loans.html bad credit loans http://s3.amazonaws.com/cash--loans/cash--
  loans.html cash loans http://s3.amazonaws.com/cash-advance/cash-advance.html
  cash advance http://s3.amazonaws.com/installment-loans/installment-loans.html
  installment loans http://s3.amazonaws.com/loans-for-bad-credit/loans-for-bad-
  credit.html loans for bad credit http://s3.amazonaws.com/quick--cash/quick--
  cash.html quick <br /> cash http://s3.amazonaws.com/small-loans/small-
  loans.html small loans http://s3.amazonaws.com/personal-loans/personal-
  loans.html personal loans http://s3.amazonaws.com/borrow-money/borrow-
  money.html borrow money http://s3.amazonaws.com/loans-for-people-with-bad-
  credit/loans-for-people-with-bad-credit.html loans <br /> for people with bad
  credit http://s3.amazonaws.com/badcreditloansguaranteedapproval/badcreditloans
  guaranteedapproval.html bad credit loans guaranteed approval http://s3.amazona
  ws.com/personalloansforbadcredit/personalloansforbadcredit.html personal loans
  for bad credit
  http://s3.amazonaws.com/nocreditcheckloans/nocreditcheckloans.html no credit
  check loans http://s3.amazonaws.com/online-paydayloans/online-paydayloans.html
  online payday loans http://s3.amazonaws.com/same-day-loans/same-day-loans.html
  same day loans http://s3.amazonaws.com/paydayloansdirectlendersonly/paydayloan
  sdirectlendersonly.html payday loans direct lenders only
  http://s3.amazonaws.com/badcreditpersonalloans/badcreditpersonalloans.html bad
  credit personal loans http://s3.amazonaws.com/personalloansforpeoplewithbadcre
  dit/personalloansforpeoplewithbadcredit.html personal loans for people with
  bad credit
  http://s3.amazonaws.com/loanswithnocreditcheck/loanswithnocreditcheck.html
  loans with no <br /> credit check http://s3.amazonaws.com/short-term-
  loans/short-term-loans.html short term loans http://s3.amazonaws.com/installme
  ntloansforbadcredit/installmentloansforbadcredit.html installment loans for
  bad credit
  http://s3.amazonaws.com/unsecuredpersonalloans/unsecuredpersonalloans.html
  unsecured <br /> personal loans
  http://s3.amazonaws.com/ineedmoney/ineedmoney.html i need money
  http://s3.amazonaws.com/unsecured-loans/unsecured-loans.html unsecured loans
  http://s3.amazonaws.com/fast--cash/fast--cash.html fast cash <br />
  http://s3.amazonaws.com/onlineloansnocreditcheck/onlineloansnocreditcheck.html
  online loans no credit check http://s3.amazonaws.com/cash-advance-loans/cash-
  advance-loans.html cash advance loans http://s3.amazonaws.com/fast-money/fast-
  money.html fast money http://s3.amazonaws.com/mobile-loans/mobile-loans.html
  mobile loans <br /> http://s3.amazonaws.com/nocreditcheckpersonalloans/nocredi
  tcheckpersonalloans.html no <br /> credit check personal loans
  http://s3.amazonaws.com/nocreditcheckpaydayloans/nocreditcheckpaydayloans.html
  no credit check payday loans http://s3.amazonaws.com/cheap--loans/cheap--
  loans.html cheap loans
  http://s3.amazonaws.com/directlenderpaydayloans/directlenderpaydayloans.html
  direct lender payday loans http://s3.amazonaws.com/online-gambling/online-
  gambling.html online <br /> gambling http://s3.amazonaws.com/online--
  casino/online--casino.html online casino http://s3.amazonaws.com/slot-
  machines/slot-machines.html slot machines http://s3.amazonaws.com/roulette-
  online/roulette-online.html roulette online http://s3.amazonaws.com/casino-
  games/casino-games.html casino games http://s3.amazonaws.com/casino-
  bonus/casino-bonus.html casino bonus</p>
* here for the rx (2015-05-25 01:55:12): <p>For more than 15 many years Real
  Bookies has visit the therxforum <br /> successfully assisted bookmakers from
  all over the world to take wagers from a large number of players on the <br />
  pay per head basis.</p>  <p>Our cutting edge bookie software program and the
  commitment from all of our clerks, ranges people, <br /> administrators and
  partners have made our price per head sportsbook <br /> solution among the
  fastest developing and <br /> most dependable bookmaking service provider
  names in the industry.</p>  <p>Word of mouth will be the number reason new
  visit therx providers sign up <br /> on RealBookies, which usually speaks
  towards the high <br /> quality of service provided to both agents and their
  gamers.</p>  <p>Upon signing up for the Realbookies family, you may receive
  your very <br /> own assistant who will be presently there to answer any
  queries you may have about the company as well as <br /> how to grow your
  business using our own pay for each head sportsbook.</p>  <p>Joining
  Realbookies will make your own operation turn out to <br /> be par plus level
  the playing therx forum field with the <br /> biggest online gaming companies
  on earth. The gambling software your players is going to be getting is the
  same by biggest online sportsbooks nowadays.</p>
