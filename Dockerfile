FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y icecast2 liquidsoap && apt-get clean

RUN useradd -r -g icecast icecast || true

RUN mkdir -p /var/log/icecast2 && chown -R icecast:icecast /var/log/icecast2

COPY icecast.xml /etc/icecast2/icecast.xml

COPY music /home/icecast/music
COPY playlist.txt /home/icecast/playlist.txt
COPY radio.liq /home/icecast/radio.liq

COPY start.sh /home/icecast/start.sh

# 1) Donner les droits d'exécution AVANT de changer d'utilisateur
RUN chmod +x /home/icecast/start.sh

# 2) Changer la propriété des fichiers/dossiers (y compris start.sh)
RUN chown -R icecast:icecast /home/icecast

EXPOSE 8080

# 3) Passer à l’utilisateur icecast seulement APRES les opérations ci-dessus
USER icecast

CMD ["/home/icecast/start.sh"]
