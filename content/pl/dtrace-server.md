+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2008-08-14T19:00:49"
draft = false
title = "DTrace server"
+++
Celem mojej pracy w te wakacje jest umożliwienie oskryptowania DTrace w języku
Tcl. O ile do tej pory pisałem raczej o [moim
API](http://dev.lrem.net/tcldtrace/wiki/CommandsList), albo nawet o pisanej
przeze mnie [dokumentacji
libdtrace](http://dev.lrem.net/tcldtrace/wiki/LibDtrace), dziś pokażę przykład
jego użycia. Językiem Tcl warto się zainteresować dlatego, że niektóre rzeczy
są w nim bardzo proste. Jedną z nich jest pisanie serwerów sieciowych. Na
pierwszy ogień idzie więc prosty serwer DTrace, pozwalający na zdalne
odpalanie sond wielu klientom na raz.

Przede wszystkim w kodzie w Tcl widać programowanie zorientowane na zdarzenia.
Nie jest to jednak paskuda z jaką spotkałem się przy API systemu Windows.
Tutaj jest to rozwiązane całkiekm elegancko, zobaczcie zresztą sami:

{geshi lang=tcl} package require dtrace proc accept {sock addr port} { global
handles scripts set handles($sock) [::dtrace::open -foldpdesc 1] set
scripts($sock) "" fconfigure $sock -buffering line fileevent $sock readable
[list receive $sock $addr $port] puts "Client connected from $addr:$port" }
proc receive {sock addr port} { global handles scripts if {[eof $sock] ||
[catch {gets $sock line}]} { close $sock ::dtrace::close $handles($sock) unset
handles($sock) scripts($sock) puts "Client $addr:$port disconnected" } else {
if {[string equal $line "GO"]} { ::dtrace::exec [::dtrace::compile
$handles($sock) $scripts($sock)] ::dtrace::go $handles($sock) probe_desc [list
callback $sock] puts $sock "CPU\tid\tprobe" dtraceLoop $sock puts "Tracing for
$addr:$port started" } else { set scripts($sock) "$scripts($sock)\n$line" } }
} proc callback {probe cpu id sock} { puts $sock "$cpu\t$id\t$probe" } proc
dtraceLoop {sock} { global handles catch {::dtrace::process $handles($sock)}
after 300 dtraceLoop $sock } socket -server accept 1986 vwait forever {/geshi}

Jak widać potrzebne jest jedynie zdefiniowanie kilku funkcji, zarejestrowanie
ich albo przez argument do jakiejś komendy, albo przez komendę _fileevent_, no
i oddanie kontroli do pętli obsługującej zdarzenia za pomocą _vwait_.

Działanie programu wygląda mniej więcej tak: [![DTrace server screenshot](http
://static.lrem.net/tcldtrace/demo2screen1.png)](http://static.lrem.net/tcldtra
ce/demo2screen1.png)

Oczywiście nie jest to program użytkowy, a jedynie demonstracja możliwości.
Jednak w prosty sposób w kilku linijkach możemy go rozwinąć tak, by
zintegrować w sensownym systemie zdalnego monitoringu.

Poza obsługą sieci jedną z czołowych zalet Tcl łatwe jest pisanie GUI. Mam na
to już [prosty przykład](http://dev.lrem.net/tcldtrace/wiki/DtraceDemo), acz
chyba nie warto go specjalnie tu opisywać.

Mam jeszcze kilka dni na pracę nad
[demami](http://dev.lrem.net/tcldtrace/wiki/IncludedDemos). Wszelkie pomysły
na proste i efektowne programiki mile widziane.

