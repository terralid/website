FROM rocker/r-ver:latest

# System-Abhängigkeiten installieren
RUN apt-get update && apt-get install -y \
    curl \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*

# Quarto installieren
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb
RUN rm quarto-linux-amd64.deb

# R-Pakete installieren
RUN R -e "install.packages(c('knitr', 'rmarkdown'))"

# Arbeitsverzeichnis setzen
WORKDIR /project
