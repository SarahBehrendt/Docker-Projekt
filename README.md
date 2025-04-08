# Lokale Entwicklungsumgebung mit Docker

Dieses Projekt bietet eine vollständige lokale Entwicklungsumgebung mit Docker-Containern für Apache, PHP, MariaDB, phpMyAdmin, MailHog und Nginx als Reverse Proxy mit SSL-Unterstützung. Es eignet sich ideal für Webentwicklung mit PHP/MySQL und kann leicht erweitert werden.

## Projektstruktur

```
project-root/
├── README.md              # Dokumentation des Projekts
├── .env                   # Umgebungsvariablen für docker-compose
├── docker/                # Alle Docker-Konfigurationen
│   ├── apache/            # Apache-Konfigurationen, SSL-Zertifikate und Dockerfile  
│   │   ├── Dockerfile  
│   │   ├── httpd-vhosts.conf  
│   │   └── certs/         # SSL-Zertifikate
│   ├── nginx/             # Nginx als Reverse Proxy
│   │   ├── Dockerfile  
│   │   └── conf.d/        # Konfiguration inkl. SSL-Terminierung
│   ├── php/               # PHP-Konfiguration und Dockerfile
│   ├── mariadb/           # MariaDB-Konfiguration
│   └── docker-compose.yml # Docker Compose Setup für alle Container
├── logs/                  # Log-Dateien der Container
│   ├── apache/            # access_log, error_log, httpd.pid
│   ├── php/               # php_error.log
│   ├── mysql/             # MariaDB-Logs
│   └── nginx/             # Nginx-Logs
└── public/                # Öffentlich zugänglicher Webordner (Document Root)
```

## Dienste & Ports

| Service      | Container-Port | Host-Port | Zugangs-URL                   | Protokoll                |
|--------------|----------------|-----------|-------------------------------|--------------------------|
| Apache       | 80, 443        | 80, 443   | http(s)://localhost           | HTTP/HTTPS   |
| Nginx        | 80, 443        | 8088, 8443| http://localhost:8088<br>https://localhost:8443 | Reverse Proxy |
| MariaDB      | 3306           | 3306      | -                             | MySQL/MariaDB            |
| phpMyAdmin   | 80             | 8081      | http://localhost:8081         | Webinterface für Datenbankverwaltung |
| MailHog      | 8025           | 8025      | http://localhost:8025         | Lokaler SMTP-Server mit Webinterface |

## Detaillierte Beschreibung

### Apache

Der Apache-Container stellt die PHP-Anwendung bereit und nutzt eine virtuelle Host-Konfiguration. Die SSL-Zertifikate befinden sich im `certs/`-Verzeichnis und können bei Bedarf ausgetauscht werden. Logs und PID-Dateien werden im `logs/apache/`-Verzeichnis abgelegt.

### PHP

Der PHP-Container verarbeitet PHP-Skripte. Die Konfiguration ist über ein eigenes Dockerfile anpassbar. Fehler-Logs werden in `logs/php/php_error.log` gespeichert.

### MariaDB

Der Datenbank-Container speichert seine Daten im Volume `/var/lib/mysql`. Die Konfiguration wird über Umgebungsvariablen in der `.env`-Datei gesteuert.

### phpMyAdmin

Ein zusätzlicher Container stellt ein Webinterface zur Verwaltung der MariaDB-Datenbank bereit.

### MailHog

Ein lokaler SMTP-Server zum Testen von E-Mail-Funktionalitäten mit Webinterface unter `http://localhost:8025`.

### Nginx als Reverse Proxy

Nginx wird als Reverse Proxy vor Apache geschaltet. Es übernimmt die SSL-Terminierung (HTTPS) und leitet die Anfragen an den Apache-Container weiter. Die Konfiguration erfolgt über Dateien im Ordner `docker/nginx/conf.d`.

## Nutzung

### Starten der Container

```bash
docker-compose -f docker/docker-compose.yml up -d
```

### Stoppen der Container

```bash
docker-compose -f docker/docker-compose.yml down
```

### Logs anzeigen

```bash
docker-compose -f docker/docker-compose.yml logs -f
```

## Lizenz

MIT License
