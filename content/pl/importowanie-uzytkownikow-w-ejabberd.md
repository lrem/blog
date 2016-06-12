+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2008-08-16T00:40:02"
draft = false
title = "Importowanie użytkowników w ejabberd"
+++
Krótka notka. Jest [ładne howto](http://www.ejabberd.im/jabberd2-to-ejabberd)
jak przemigrować swoje owieczki do ejabberd. Jednak u mnie ambitnie
wyskakiwało:

    
    
    RPC failed on the node ejabberd@jabber: {'EXIT',
                                             {{badmatch,{error,eacces}},
                                              [{jd2ejd,import_dir,1},
                                               {ejabberd_ctl,process,1},
                                               {rpc,'-handle_call/3-fun-0-',5}]}}
    
    

Niezbyt wiele mówi, trudno znaleźć... A rozwiązanie jest banalne: użytkownik
jabber nie miał prawa odczytu do katalogu.

