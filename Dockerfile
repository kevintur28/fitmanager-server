FROM tomcat:10.1-jdk17

# Actualiza los certificados CA del sistema para evitar errores SSL
# (PKIX path building failed) al llamar APIs externas como Brevo
RUN apt-get update && \
    apt-get install -y --reinstall ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN rm -rf /usr/local/tomcat/webapps/*
COPY FitManager.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
