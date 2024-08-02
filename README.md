# MySQL Docker Setup with phpMyAdmin

Dette prosjektet setter opp en MySQL-database med phpMyAdmin som administrasjonsverktøy ved hjelp av Docker og Docker Compose.

## Forutsetninger

Før du starter, sørg for at du har følgende installert på maskinen din:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Prosjektstruktur

```console
.
├── .env
├── docker-compose.yml
├── init-scripts
│ └── init.sql
├── backup.sh
├── restore.sh
├── test_db.py
└── README.md
```

### Forklaring av hoveddelene

- **`.env`**: Inneholder miljøvariabler som konfigurerer MySQL og phpMyAdmin. Dette gjør det enkelt å endre konfigurasjoner uten å måtte redigere `docker-compose.yml` direkte.
- **`docker-compose.yml`**: Definerer tjenestene som skal kjøres (MySQL og phpMyAdmin), deres innstillinger og hvordan de skal kobles sammen. Docker Compose bruker denne filen for å sette opp og administrere containere.
- **`init-scripts/`**: En mappe som inneholder SQL-skript som skal kjøres ved oppstart av MySQL-databasen. Dette lar deg initialisere databasen med tabeller og data automatisk.
- **`README.md`**: Dokumentasjon for prosjektet, inkludert instruksjoner for oppsett, kjøring og administrasjon.

## Miljøvariabler

Forklaring av miljøvariablene i `.env`-filen:

- `MYSQL_ROOT_PASSWORD`: Rotpassordet for MySQL.
- `MYSQL_DATABASE`: Navnet på databasen som skal opprettes.
- `MYSQL_USER`: Brukernavnet for MySQL.
- `MYSQL_PASSWORD`: Passordet for MySQL-brukeren.
- `INIT_SQL`: Navnet på init-skriptet som skal kjøres ved oppstart. Dette skriptet må plasseres i `init-scripts`-mappen.

## Konfigurasjon

1. **Oppdater .env-filen**: Inneholder miljøvariabler for MySQL- og phpMyAdmin-tjenestene.

    Eksempel:

    ```dotenv
    MYSQL_ROOT_PASSWORD=rootpassword
    MYSQL_DATABASE=mydatabase
    MYSQL_USER=myuser
    MYSQL_PASSWORD=mypassword
    INIT_SQL=init.sql
    ```

2. Plasser SQL-skript i init-scripts: Legg SQL-skriptet du ønsker å kjøre ved oppstart i init-scripts-mappen, og oppdater INIT_SQL-variabelen i .env-filen med navnet på skriptet.

## Slik kjører du prosjektet

1. Klon repoet (eller last ned prosjektfilene).
2. Naviger til prosjektmappen i terminalen.
3. Start Docker Compose:

    ```console
       docker compose up -d
    ```

    Dette vil starte MySQL- og phpMyAdmin-tjenestene i bakgrunnen.
4. for å stoppe MySQL- og phpMyAdmin-tjenestene:

    ```console
       docker compose down
    ```

## Tilgang til phpMyAdmin

Åpne en nettleser og gå til http://localhost:8080. Logg inn med følgende detaljer:

- Server: db
- Username: verdien av MYSQL_USER fra .env-filen (f.eks. myuser)
- Password: verdien av MYSQL_PASSWORD fra .env-filen (f.eks. mypassword)
- Database: verdien av MYSQL_DATABASE fra .env-filen (f.eks. mydatabase)

Nå kan du administrere MySQL-databasen din gjennom phpMyAdmin-grensesnittet.