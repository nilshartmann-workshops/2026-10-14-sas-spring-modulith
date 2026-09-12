# Event-basierte Modularisierung mit Spring Modulith

Der Workspace für den Workshop: die Beispielanwendung Plantify, an der wir Spring Modulith ausprobieren.

## Installation

Du brauchst:

- **ein JDK, Version 25 oder neuer.** Prüfen mit `java -version`.
- **eine IDE**, am besten die, die du sonst auch benutzt. Schalte die KI-Unterstützung (Copilot, AI Assistant) für den Workshop aus.
- **Git**, zur Not geht auch der ZIP-Download.
- **Zugriff auf** `github.com` und `repo.maven.apache.org`.

Du brauchst **kein** Maven, **keine** Datenbank und **kein** Docker.

> [!TIP]
> Kein JDK 25 und keine Admin-Rechte? IntelliJ lädt ein JDK in dein Benutzerverzeichnis: "File → Project Structure → SDK → Add SDK → Download JDK", Version 25.

### 1. Repository holen

```bash
git clone https://github.com/nilshartmann-workshops/2026-10-14-sas-spring-modulith.git
cd 2026-10-14-sas-spring-modulith
```

Ohne Git: Auf https://github.com/nilshartmann-workshops/2026-10-14-sas-spring-modulith "Code → Download ZIP" und entpacken.

### 2. Bauen

```bash
./mvnw verify
```

Unter Windows `mvnw.cmd verify`. Beim ersten Mal lädt der Befehl Maven und alle Abhängigkeiten herunter, das dauert ein paar Minuten. Am Ende muss `BUILD SUCCESS` stehen.

Ohne Kommandozeile: Öffne das Verzeichnis in IntelliJ als Maven-Projekt und führe im Maven-Fenster "Lifecycle → verify" aus.

### 3. Starten

```bash
./mvnw spring-boot:run
```

Oder starte in der IDE die Klasse `PlantifyApplication`. Öffne dann http://localhost:8080/swagger-ui.html, klappe `POST /api/plants` aus und lege mit "Try it out" und "Execute" eine Pflanze an. Als `ownerId` nimmst du `ee3829e4-fe2b-4d03-b2a1-70f1425d8c1c`.

Wenn eine Antwort mit Status 200 und der neuen Pflanze kommt, bist du fertig.

### Wenn es klemmt

| Problem | Lösung |
|---|---|
| `java -version` zeigt weniger als 25 | JDK 25 installieren, siehe Tipp oben, und `JAVA_HOME` darauf setzen |
| `./mvnw: Permission denied` (nach dem ZIP-Download) | `sh mvnw verify` statt `./mvnw verify` |
| Der Download von Maven oder den Abhängigkeiten scheitert | Meist ein Proxy. Trag ihn in `~/.m2/settings.xml` ein: https://maven.apache.org/guides/mini/guide-proxies.html |
| Port 8080 ist belegt | `./mvnw spring-boot:run -Dspring-boot.run.arguments=--server.port=8081` |

## Das Repository

- `src/main/java`: die Anwendung, ein Paket je Application Module (`billing`, `care`, `owner`, `plant`, `shared`)
- `src/main/resources`: Konfiguration und Datenbank-Migrationen
- `src/test/java`: die Tests
- `data`: die H2-Datenbank, legt die Anwendung beim ersten Start an. `./reset-db.sh` löscht sie
- `compose.yaml`, `compose-zipkin.yaml`: Postgres und Zipkin für meine Vorführungen, für die Übungen nicht nötig

Die Datenbank siehst du unter http://localhost:8080/h2-console mit der JDBC URL `jdbc:h2:./data/plantify`, User `sa` und leerem Passwort.

## Kontakt

https://nilshartmann.net/kontakt
