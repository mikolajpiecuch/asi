## Mikołaj Piecuch (zaliczenie)

| Wersja Ruby   | Wersja Rails  |                Baza danych                 | Framework |           Dodatkowe gemy           |
| ------------- |:-------------:|:-------------------------------------------|:---------:|:----------------------------------:|
| 2.4.0        | 5.0.2         | SQLite - lokalnie<br />PostgreSQL - Heroku | Bootstrap | bcrypt, rails-jquery-autocomplete, will_paginate-bootstrap |


:white_check_mark: [TripsUG](http://tripsug.herokuapp.com/)

### Temat: TripsUG

TripsUG jest aplikacją umożliwiająca dzielenia się kosztami paliwa przy wspólnych przejazdach samochodowych. Każda zalogowana osoba może oglądać zaoferowane przejazdy przez innych użytkowników. Dodatkowo może dodawać swoje oraz je edytować i usuwać.

### Gemy:<br />
- bcrypt: zabezpiecza przed atakami brute-force i dictionary, dodatkowa dostarcza funkcję pomocnicza do hashowania hasel użytkowników <br />
- rails-jquery-autocomplete: autouzupełnianie danych miejsca wyjazdu i samochodu na podstawie wprowadzonych wcześniej danych przez innych użytkowników <br />
- will_paginate-bootstrap: zmiana domyślnego wyglądu paginacji na wygląd oparty na Bootstrapie<br />

<sup>
Dane do logowania testowego użytkownika:
login: test@test.com
hasło: qwerty

Po zalogowaniu można wyświetlić wszystkie przejazdy bieżącego użytkownika klikając w jego dane w prawym górnym rogu.
</sup>
