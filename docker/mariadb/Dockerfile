ARG DB_VERSION
FROM mariadb:${DB_VERSION}

# Kopiere benutzerdefinierte Konfigurationsdateien, falls vorhanden
COPY ./my.cnf /etc/mysql/my.cnf

# Setze benutzerdefinierte Umgebungsvariablen oder Konfigurationen
# COPY ./scripts/init.sql /docker-entrypoint-initdb.d/