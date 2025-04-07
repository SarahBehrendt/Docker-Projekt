# Docker 
## Images
Apache https://hub.docker.com/_/httpd
PHP https://hub.docker.com/_/php
MariaDB https://hub.docker.com/_/mariadb
phpmyadmin https://hub.docker.com/_/phpmyadmin

## Docker Service Ports

Dieses Dokument listet alle genutzten Ports und deren Zugriffswege auf.

## 📌 Port-Konfiguration

| Service       | Container-Port | Host-Port | Zugangs-URL           | Protokoll |
|---------------|----------------|-----------|-----------------------|-----------|
| Apache (Web)  | 80             | 80        | http://localhost:80   | HTTP      |
| phpMyAdmin    | 80             | 8080      | http://localhost:8080 | HTTP      |
| MariaDB       | 3306           | -         | Nur intern nutzbar    | TCP       |

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
