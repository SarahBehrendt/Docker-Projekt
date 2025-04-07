# Docker Project Directory Structure

## 📁 Verzeichnisstruktur

```
project-root/  
│
├── docker/                # Docker-spezifische Dateien  
│   ├── apache/            # Apache-Konfigurationen und Dockerfile  
│   ├── php/               # PHP-Konfigurationen und Dockerfile  
│   ├── docker-compose.yml # Haupt-Docker-Compose-Datei  
│   ├── logs/              # Log-Dateien  
│   └── mailhog/           # MailHog Konfigurationen (optional)  
│  
├── public/                # Öffentliche Web-Dateien (z.B. HTML, CSS, JS)  
│   ├── index.html         # Haupt-HTML-Datei  
│   └── …                # Weitere Web-Dateien  
│  
├── .env                   # Umgebungsvariablen (z.B. DB-Konfigurationen)  
├── README.md              # Dokumentation des Projekts  
└── …                    # Weitere Projektdateien  
```

## 📂 Detaillierte Beschreibung

- **docker/**
    - Enthält alle Docker-bezogenen Konfigurationen und Dateien.
    - `docker-compose.yml`: Definition der Docker-Container und Services (Apache, PHP, MariaDB, phpMyAdmin, MailHog).
    - `apache/`: Hier sind alle Apache-Konfigurationsdateien und das zugehörige Dockerfile enthalten.
    - `php/`: PHP-Konfigurationsdateien und Dockerfile.
    - `logs/`: Hier landen alle Log-Dateien (Apache, PHP, MySQL) für die einfache Analyse.

- **public/**
    - Dieser Ordner enthält alle öffentlichen Web-Dateien, die von Apache bedient werden.
    - `index.html` ist die Standard-Datei, die aufgerufen wird, wenn der Webserver läuft.

- **.env**
    - Enthält alle Umgebungsvariablen, die in `docker-compose.yml` verwendet werden (z.B. Datenbank-Benutzer, Passwörter, Versionen).


## Verwendete Images

| Service        | Docker Hub Link                                                       |
|----------------|----------------------------------------------------------------------|
| Apache         | [https://hub.docker.com/_/httpd](https://hub.docker.com/_/httpd)      |
| PHP            | [https://hub.docker.com/_/php](https://hub.docker.com/_/php)          |
| MariaDB        | [https://hub.docker.com/_/mariadb](https://hub.docker.com/_/mariadb)  |
| phpMyAdmin     | [https://hub.docker.com/_/phpmyadmin](https://hub.docker.com/_/phpmyadmin) |
| MailHog        | [https://hub.docker.com/r/mailhog/mailhog](https://hub.docker.com/r/mailhog/mailhog) |

## Docker Service Ports

Dieses Dokument listet alle genutzten Ports und deren Zugriffswege auf.

## 📌 Port-Konfiguration

| Service      | Container-Port | Host-Port | Zugangs-URL           | Protokoll |
|--------------|----------------|-----------|-----------------------|-----------|
| Apache (Web) | 80             | 80        | http://localhost:80   | HTTP      |
| phpMyAdmin   | 80             | 8080      | http://localhost:8080 | HTTP      |
| MariaDB      | 3306           | -         | Nur intern nutzbar    | TCP       |
| MailHog      | 8025           | 8025      | http://localhost:8025 | HTTP      |


## 🚀 Quickstart
### Container starten
```
docker-compose -f docker/docker-compose.yml up
```

### Status prüfen
docker-compose ps
```

### 🔧 Port-Konflikte lösen
1. Belegte Ports finden:
   ```bash
   # Linux/macOS:
   sudo lsof -i :8080
   
   # Windows:
   netstat -ano | findstr :8080
   ```

2. Alternative Ports in `docker-compose.yml` eintragen:
   ```yaml
   services:
     apache:
       ports:
         - "8090:80"  # Geänderter Host-Port
   ```

### ⚠️ Sicherheitshinweise
- MariaDB (3306) sollte **nicht** öffentlich exponiert werden
- Für Produktion:
  - phpMyAdmin mit HTTPS schützen
  - Apache über Reverse-Proxy betreiben

### 🛠️ Nützliche Befehle
| Befehl                      | Wirkung                     |
|-----------------------------|----------------------------|
| `docker-compose logs -f`    | Live-Logs anzeigen         |
| `docker-compose down -v`    | Container + Volumes löschen|

#### Rebuild docker
```
docker-compose -f docker/docker-compose.yml up --build
```

## 📎 Support
Bei Port-Problemen:
1. Container stoppen: `docker-compose down`
2. Port ändern und neu starten: `docker-compose up -d`
