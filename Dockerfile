FROM ubuntu:latest

MAINTAINER Alexander Mattoni

VOLUME ["/starbound"]

ENV STEAM_USERNAME ""
ENV STEAM_PASSWORD ""
ENV STEAMGUARD_CODE ""
ENV STARBOUND_UNSTABLE false

COPY init.sh /init.sh

RUN apt-get update \
	&& apt-get install lib32gcc1 wget libpng12-0 -y \
	&& mkdir -p /starbound /steamcmd \
	&& cd /steamcmd \
	&& wget -o /tmp/steamcmd.tar.gz http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
	&& tar zxvf steamcmd_linux.tar.gz \
	&& rm steamcmd_linux.tar.gz \
	&& chmod +x ./steamcmd.sh /init.sh

EXPOSE 21025
EXPOSE 21026

CMD /init.sh