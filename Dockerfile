FROM jboss/wildfly

WORKDIR /opt/jboss/wildfly/
COPY keycloak-wildfly-adapter-dist-3.2.1.Final.zip /opt/jboss/wildfly/
COPY hello-world-authz-service.war /opt/jboss/wildfly/standalone/deployments/

RUN unzip -d . keycloak-wildfly-adapter-dist-3.2.1.Final.zip

RUN ./bin/jboss-cli.sh --file=./bin/adapter-install-offline.cli

RUN rm -rfv /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/current/*
