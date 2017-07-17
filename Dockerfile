FROM openjdk:8-jre

MAINTAINER Nick Pack <nick@nickpack.com>

WORKDIR /opt

ARG KEYCLOAK_VERSION=3.2.0
ARG KEYCLOAK_DOWNLOAD_URL=https://downloads.jboss.org/keycloak/3.2.0.Final/keycloak-${KEYCLOAK_VERSION}.Final.zip
ENV KEYCLOAK_BIND_ADDRESS="0.0.0.0"


RUN wget ${KEYCLOAK_DOWNLOAD_URL} && \
    unzip -d keycloak-tmp *.zip && \
    mv /opt/keycloak-tmp/keycloak-${KEYCLOAK_VERSION}.Final /opt/keycloak && \
    rm -rf keycloak-tmp *.zip

EXPOSE 8080 9990

ENTRYPOINT /opt/keycloak/bin/standalone.sh -b=${KEYCLOAK_BIND_ADDRESS}
