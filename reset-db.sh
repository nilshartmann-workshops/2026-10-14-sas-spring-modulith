#!/bin/bash
#
# Setzt die Datenbank zurueck: Datei loeschen, beim naechsten Start legt
# Flyway alles neu an. Die Anwendung muss dafuer gestoppt sein, sonst ist
# die Datei gesperrt.
#
# Auch eine Verbindung aus einem Datenbank-Werkzeug (etwa IntelliJ) muss
# vorher getrennt sein. Das Werkzeug haelt die geloeschte Datei sonst offen,
# und die neu gestartete Anwendung arbeitet ohne Fehlermeldung auf der alten
# Datenbank weiter.

set -e
cd "$(dirname "$0")"

if [ ! -d data ]; then
  echo "Kein data/-Verzeichnis, es gibt nichts zurueckzusetzen."
  exit 0
fi

rm -rf data
echo "Datenbank geloescht. Beim naechsten Start legt Flyway sie neu an."
