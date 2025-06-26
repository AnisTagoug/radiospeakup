#!/bin/bash

# Lancer Icecast en arrière-plan
icecast2 -c /etc/icecast2/icecast.xml &

# Attendre un peu que Icecast démarre
sleep 5

# Lancer Liquidsoap (tu peux aussi rediriger logs si tu veux)
liquidsoap /home/icecast/radio.liq
