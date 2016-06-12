+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2008-06-30T23:30:40"
draft = false
title = "Dokumentacja API DTrace"
+++
DTrace jest piękny. Jest też dobrze udokumentowany - zarówno w [i]man[/i], jak
też i na Sunowym wiki. Zupełnie inaczej sprawa ma się z [em]libdtrace[/em] -
biblioteką na której się opiera. Czytając jej dokumentację dowiemy się... Że
dokumentacji nie ma, bo API nie jest jeszcze publiczne/stabilne. Korzysta z
niego kilka projektów (jak choćby [Java DTrace
API](http://opensolaris.org/os/project/dtrace-chime/java_dtrace_api/) czy
[Ruby DTrace](http://ruby-dtrace.rubyforge.org/)), lecz nikt nie udostępnił
dokumentacji DTrace C API. Jestem więc chyba pierwszy...

API _libdtrace_ jest równie piękne, co samo narzędzie. Aby z niego korzystać,
wystarczy poznać około 10 funkcji. Większość opcji ustawiana jest przez jedną
funkcję _dtrace_setopt_, zaś ich znaczenie można zrozumieć czytając
dokumentację narzędzia konsolowego. W sumie - nic tylko kodować.

Napisana przeze mnie, na własne potrzeby, dokumentacja:
<http://dev.lrem.net/tcldtrace/wiki/LibDtrace>

