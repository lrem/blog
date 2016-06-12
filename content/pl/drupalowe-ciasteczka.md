+++
# vim:set nosmartindent nocindent ft=markdown:
date = "2008-05-24T16:50:20"
draft = false
title = "Drupalowe ciasteczka"
+++
Krótka notka: jeżeli [Drupal](http://drupal.org) wydaje się całkowicie
ignorować poprawne próby logowania (ale wyświetlać komunikat w przypadku złego
usera/hasła), to sprawdź czy masz ustawioną domenę ciasteczek. Rezyduje to w
okolicach drupal/sites/default/settings.php:147, zmienna _cookie_domain_. Bez
tego Drupal potrafi dawać ciasteczka na zupełnie inną domenę niż ta, na której
stoi...

# Komentarze

* sf devblog (2008-05-26 06:54:59): <p>Zupełnie inną? Możesz podać przykład na
  jaką? Bo to jest raczej niemożliwe by przeglądarka takie coś umożliwiła. Jedna
  wilka dziura ;)</p>
* Remigiusz 'lRem' Modrzejewski (2008-05-26 16:22:24): <p>Tak, zamiast domeny
  strony dawała domenę hostingu. Opera przyjmowała bez najmniejszego
  sprzeciwu.</p>
* sf devblog (2008-05-26 16:28:06): <p>To najwyraźniej wina serwera, na którym
  masz stronę. Któraś ze zmienych w $_SERVER jest ustawiona na domenę hostingu.
  Sprawdź ( var_dump($_SERVER) jak będziesz miał chwilę, jestem ciekawy czy o to
  chodzi ;)</p>
* Remigiusz 'lRem' Modrzejewski (2008-05-26 16:36:03): <p>Owszem,
  [&quot;HTTP_HOST&quot;] jest ustawione na hosting. Ale po pierwsze, czemu on
  nie korzystał z ustawionej domeny strony? Po drugie, co to jest za zmienna,
  jakieś ustawienia php? Bo w ustawieniach vhosta stoi  <br /><code>ServerName
  maxnet.org.pl</code>...</p>
