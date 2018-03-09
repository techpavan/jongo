FROM maven:3.5.2-jdk-8
VOLUME /opt/jongo/maven

RUN apt-get update \
    && apt-get install -qy gnupg2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && rm -rf /var/tmp/*

COPY ./bin /opt/jongo/bin

WORKDIR /opt/jongo/bin

ENTRYPOINT ["bash", "./cli.sh"]