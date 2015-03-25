FROM dockerfile/java
MAINTAINER Niek Palm <dev.npalm@gmail.com>

RUN echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list
RUN apt-get update && apt-get clean ### Sonar version 5.0 - timestamp

RUN apt-get install -y --force-yes sonar=5.0

COPY assets/init /sonar/init
RUN chmod 755 /sonar/init

VOLUME /opt/sonar/extensions
VOLUME /opt/sonar/logs/

EXPOSE 9000

ENTRYPOINT ["/sonar/init"]
CMD ["app:start"]
