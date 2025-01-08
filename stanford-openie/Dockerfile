# Verwende ein OpenJDK-Image als Basis (Java wird benötigt)
FROM eclipse-temurin

# Installiere wget und unzip, um die Datei herunterzuladen und zu entpacken
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Definiere das Arbeitsverzeichnis im Container
WORKDIR /opt

# Lade die Stanford CoreNLP Zip-Datei herunter
RUN wget https://nlp.stanford.edu/software/stanford-corenlp-4.5.8.zip

# Entpacke die Zip-Datei
RUN unzip stanford-corenlp-4.5.8.zip && rm stanford-corenlp-4.5.8.zip

# Setze das Arbeitsverzeichnis auf das entpackte Verzeichnis
WORKDIR /opt/stanford-corenlp-4.5.8

# Setze den Befehl, der beim Starten des Containers ausgeführt wird
ENTRYPOINT ["java", "-mx1g", "-cp", "*", "edu.stanford.nlp.naturalli.OpenIE"]

# Erlaube es, zusätzliche Argumente an den Container zu übergeben (optional)
CMD []

