+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2010-05-26T14:42:28"
draft = false
title = "Open Source, publish early a Jogger"
+++
Od ostatnich moich wpisów o Joggerze i późniejszego wpisu D4rkyego dużo się
krzyczy o modelu rozwoju naszej platformy. _Kierownictwo_ postanowiło, po
skrzyknięciu chętnych, zamknąć się w wieży i nie wychodzić. Wiele osób uznaje
to niemalże za zdradę stanu.
[Miejscami](%20http://blog.radmen.info/2010/05/25/go-opensource-jogger-v3/)
osoby domagające się otwarcia źródeł są dość, hmmm, radykalne. Zupełnie nie
zauważając pewnych faktów.

Po pierwsze ani D4rky ani Riddle nie wykluczają otwarcia źródeł na pewnym
etapie. Niestety również nie zadeklarowali tego jasno w żadnym miejsc, w które
patrzyłem. Pozostaje jednak mieć nadzieję, że serio chcą pokazać dopiero jak
będą mieli co.

Po drugie, nawet te sztandarowe przykłady wolnego oprogramowania zaczynały
często inaczej. Linus przez rok bawił się swoim kernelem zanim w ogóle
przyznał się do pracy nad nim. Apache wywodzi się z projektu stworzonego w
agendzie rządowej przez mały, zamknięty zespół. Wiele innych projektów to
otworzone w pewnym momencie komercyjne produkty (Firefox, Blender, Eclipse i
tak dalej).

Po trzecie, większość projektów ma jakieś mocne przewodnictwo. Linus zawsze ma
ostatnie słowo i tak dalej. Jeśli projekt nie ma takiej jasnej linii, to
kończy jak GNU (mimo całej swej potęgi wciąż nie udało im się osiągnąć swojego
podstawowego celu - stworzenia kompletnego systemu operacyjnego). Jogger ma
najwidoczniej D4rkyego. Jak się nie podoba, to nie przyłączaj się do projektu,
proste.

Po czwarte, Jogger to raczej techniczna brać. Jest tutaj kilkadziesiąt, jeśli
nie kilkaset, osób które mają swoje opinie o prowadzeniu projektu. Załóżmy, że
projekt będzie otwarty od początku. Dość oczywiste jest, że każda decyzja
(przynajmniej aż się wszystkim znudzi obserwować) spotka się z masą
komentarzy. Teraz _core team_ może albo brać udział w dyskusji i poświęcać na
to więcej czasu niż na kodowanie, albo ją ignorować i spotkać się z
potępieniem za ignorowanie społeczności. W czym to jest lepsze od pokazania
projektu dopiero wtedy, gdy będzie miał kształt? Wtedy przynajmniej osoby
które się nie zgadzają z tym co już postanowione nie będą marnować czasu.

Ostatecznie, kto zabrania zrobić projekt konkurencyjny? Jogger to przede
wszystkim społeczność... Można dorobić bota do
[Buddypressa](http://buddypress.org/). Jeśli efekt będzie lepszy od
_właściwego_ kodu Joggera, to czemu Jogger nie miałby się na to przesiąść?
Ostatecznie jeśli dość dużo osób poprze tą zmianę, to _kierownictwo_ powinno
się zgodzić zanim ludzie zaczną wyciekać do jakiegoś konkurencyjnego serwisu
na tym postawionego. Wystarczy ,,tylko'' przygotować silnik lepszy niż to, co
jest w stanie stworzyć obecna ekipa...

# Komentarze

* riddle (2010-05-26 14:47:59): <p>Dziękuję. :-)</p>
* Remigiusz 'lRem' Modrzejewski (2010-05-26 14:51:20): <p>Nie ma za co. I, żeby
  było jasne - ja nie popieram idei trzymania tego w zamknięciu tak jak dwójki.
  Powinniście jak najszybciej dokodować do miejsca, gdzie będzie to w stanie
  wyświetlić wpis i główną. A jak tylko zacznie to w ogóle działać to od razu
  otworzyć. Trzeba dopuścić code review i zgłaszanie patchy w pierwszym
  momencie, gdy będzie to na plus. Inaczej znowu dojdzie do stagnacji i po
  pewnym czasie kodu, którego lepiej w ogóle nie pokazywać.</p>
* Matthew (2010-05-26 15:34:52): <p>@lRem: co do linuksa to nie masz racji.
  Linus dlatego się przyznał dopiero po pewnym czasie (nie mówiąc już o
  wprowadzeniu tego w GPL, ale wtedy były inne czasy i GNU dopiero się
  rozwijało) bo pierwotnie Linux nie miał być OSem, co za tym idzie nie było
  potrzeby jego wydawania, Linus pisał go dla siebie, żeby się nauczyć
  programowania w asmie.<br />  <br />  Jogger to zupełnie inna sprawa. Może być
  od początku pokazany kod (nawet bez możliwości włączania patchy on innych),
  nic temu nie szkodzi. Ba. Można pójść dalej i udostępnić dokumentację (która
  podobno jakaś już jest) w jakiś repozytorium, która z czasem by się rozwijała.
  Zachowana by była przejrzystość i możliwość zgłaszania własnych pomysłów. Nie
  musiałby być one włączane. Ale wiadomo by było na czym stoją użytkownicy.<br
  />  <br />  Coś podobnego (tylko na znacznie mniejszą skalę, bo tylko nastu
  adminów) funkcjonuje w SKOSie. Jest wiki, są zgłaszane pomysły w niej,
  prowadzone rozmowy, poprawki, projekty. I świetnie to się sprawdza (lepiej niż
  fora czy grupy dyskusyjne). Czemu nie zrobić tego tutaj? Dlatego, że Riddle,
  D4rky i sparrow mają niczym nie poparte widzimisie?</p>
* lemiel (2010-05-26 15:41:36): <p>Mają bo mogą. Koniec.</p>
* Remigiusz 'lRem' Modrzejewski (2010-05-26 16:19:20): <p>@Matthew: ale gdzie
  nie mam racji z Linuksem? Czy ja pisałem, że on miał plan podbić świat? Czy
  sądzisz, że serio piszę o czymś, o czym nie mam pojęcia?</p>  <blockquote>
  <p>Zachowana by była przejrzystość i możliwość zgłaszania własnych pomysłów.
  Nie musiałby być one włączane.</p> </blockquote>  <p>Kiedy oni właśnie nie
  chcą zachowania możliwości zgłaszania, z powodu który opisałem (punkt
  czwarty). A niestety nie mogą tego uciąć bez ucinania przejrzystości (bo zaraz
  cały Jogger pełen by był wpisów o tym, więc i tak by doszło do
  <em>dyskutuj</em> albo <em>ignoruj</em>).</p>
* rozie (2010-05-26 18:30:19): <p>Jest też metoda taka, że są 2 gałęzie (lub
  więcej), jedna nieoficjalna RW dla wszystkich, i oficjalna RO. Co miesiąc
  stare RW jest zamykane, publikowana jest nowa wersja RO i równa jej (w
  momencie publikacji) wersja RW,, która powstaje z zaakceptowanych przez core
  team rozwiązań (z ew. modyfikacjami). Z jednej strony każdy może się
  przyłączyć, z drugiej strony rozwiązania nie spełniające założeń skazane są na
  niebyt (czy tam istnienie w postaci osobnych forków, czego przy otwarciu kodu
  i tak pewnie się nie uniknie).</p>
* Remigiusz 'lRem' Modrzejewski (2010-05-27 00:10:54): <p>Szczerze powiedziawszy
  to chyba najgłupsza metoda o jakiej słyszałem. Przez średnio pół miesiąca nie
  wiedzieć, czy łatkę przyjęto czy nie? Nie mieć pojęcia na czym bazować swój
  kod? Serio, czy jesteś w stanie wskazać choć jeden projekt który działa w ten
  sposób i ma więcej niż kilku developerów?</p>
* Cichy Fragles (2010-05-27 22:37:38): <p>Jogger - technologia czy
  społeczność?<br /><br />Tak jakoś wyszło (mniejsza o przyczyny), że w
  trwającej już kilka dni wielkiej debacie o rozwoju Joggera nie zabrałem dotąd
  głosu - ale może to i lepiej, bo po paru kolejnych odcinkach można już zrobić
  małe podsumowanie.<br />  Przede wszystk[...]</p>
