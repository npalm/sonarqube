FROM dockerfile/java:oracle-java8
MAINTAINER Niek Palm <dev.npalm@gmail.com>

ENV SONAR_VERSION 5.0.1

RUN echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list \
    && apt-get update && apt-get clean \ 
    && apt-get install -y --force-yes sonar=${SONAR_VERSION} \
    && rm -rf /var/lib/apt/lists/*

COPY assets/init /sonar/init
RUN chmod 755 /sonar/init

VOLUME /opt/sonar/extensions /opt/sonar/logs /opt/sonar/conf

EXPOSE 9000

ENTRYPOINT ["/sonar/init"]
