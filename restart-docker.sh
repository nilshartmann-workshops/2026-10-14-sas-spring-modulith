#!/bin/bash
#
# Setzt Postgres zurueck: Container und Volume weg, dann neu starten. Danach
# die Anwendung neu starten, denn Flyway legt die Tabellen nur beim Start an.
# Eine laufende Anwendung verbindet sich zwar wieder, findet aber eine leere
# Datenbank ohne Tabellen vor.

set -e
cd "$(dirname "$0")"

docker compose down -v
docker compose up -d
echo "Postgres laeuft wieder leer. Jetzt die Anwendung neu starten."
