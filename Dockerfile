FROM harbor.alopezpa.homelab/system/base:v2.0.0-c02

USER root

#Install Sonar-Scanner
ENV SONAR_SCANNER_VERSION=5.0.1.3006
ENV SONAR_SCANNER_HOME=/opt/sonar-scanner
ENV SONAR_OS=linux

RUN curl -fsSL https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}-${SONAR_OS}.zip -o /tmp/sonar-scanner.zip \
&& unzip /tmp/sonar-scanner.zip -d /opt \
&& ln -s /opt/sonar-scanner-${SONAR_SCANNER_VERSION}-linux ${SONAR_SCANNER_HOME} \
&& rm /tmp/sonar-scanner.zip

ENV PATH="${SONAR_SCANNER_HOME}/bin:${PATH}"

USER alopezpa
CMD ["bash"]
