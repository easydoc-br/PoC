FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget pax-utils

# Install Java.
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer oracle-java8-set-default  && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define working directory.
# WORKDIR /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

ENV TINI_VERSION 0.14.0
ENV TINI_SHA 6c41ec7d33e857d4779f14d9c74924cab0c7973485d2972419a3b7c7620ff5fd

# Use tini as subreaper in Docker container to adopt zombie processes
RUN curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static-amd64 -o /bin/tini && chmod +x /bin/tini \
  && echo "$TINI_SHA  /bin/tini" | sha256sum -c -

RUN apt-get update && apt-get install -y python 

RUN mkdir -p /opt/storm
RUN mkdir -p /var/lib/storm

ENV STORM_VERSION 1.0.5

ENV STORM_DOWNLOAD_URL http://mirror.nbtelecom.com.br/apache/storm/apache-storm-$STORM_VERSION/apache-storm-$STORM_VERSION.tar.gz

WORKDIR /opt/storm

RUN wget -O apache-storm.tar.gz "$STORM_DOWNLOAD_URL"

RUN tar -zxvf apache-storm.tar.gz  --strip-components=1 

COPY initenv.sh /opt/storm/initenv.sh
RUN chmod +x initenv.sh

COPY stormstart.sh /opt/storm/stormstart.sh
RUN chmod +x stormstart.sh

VOLUME /var/lib/storm
VOLUME /opt/storm/logs

EXPOSE 8080
EXPOSE 6701
EXPOSE 6702
EXPOSE 6627

CMD ["/bin/tini", "--", "/opt/storm/stormstart.sh"]
