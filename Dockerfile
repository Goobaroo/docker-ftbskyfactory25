# syntax=docker/dockerfile:1

FROM openjdk:8u312-jre-buster

LABEL version="2.5.8"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Presents Skyfactory 2.5"
LABEL homepage.icon="https://apps.modpacks.ch/modpacks/art/25/skyfactory-2-5.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://SkyFactory25:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Presents Skyfactory 2.5 v2.5.8 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx4096m"

CMD ["/launch.sh"]