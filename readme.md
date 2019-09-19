
# Charity

### Opis programu
Aplikacja, przez którą każdy może oddać niepotrzebne rzeczy zaufanym instytucjom.

### Funkcjonalności
1. Profil administratora:
 - logowanie,
 - zarządzanie (**CRUD**) administratorami,
 - zarządzanie (**CRUD**) zaufanymi instytucjami,
 - przeglądanie, edycja, usuwanie zarejestrowanych użytkowników,
 - przegląd przekazanych darów.
-  możliwością określenia statusów darów (złożone/odebrane/przekazane)

2. Profil użytkownika:
 - rejestracja,
 - logowanie (ten sam formularz co dla administratora),
 - edycja własnego profilu (podstawowe dane),
 - dodawanie darów tylko po zalogowaniu,
 - przeglądanie, edycja, kasowanie przekazanych darów,
 - zaznaczenie, że dar został komuś oddany (archiwizacja).

3. Dodatkowe funkcjonalności:
- role użytkowników (ROLE_USER, ROLE_ADMIN)
- panel adminstracyjny oparty o gotowy szablon **Sb Admin**
`https://startbootstrap.com/themes/sb-admin-2/`
- potwierdzenie aktywacji konta poprzez wiadomość przesłaną na email podany przy rejestracji,
- obsługa zapomnianych haseł,
- walidacja poprawnego podania dwóch identycznych haseł,
- walidacja obsługi administratorów (brak możliwości skasowania ostatniego istniejącego administratora),
- zmiana języka (polski/angielski)

### Użyte technologie
- Spring Boot
- Spring Form
- Hibernate
- Spring Data JPA
- Spring Security
