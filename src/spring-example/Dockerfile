FROM ubuntu:16.04

# Install Java.
RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade
RUN apt-get install -y curl telnet ftp vim wget git net-tools software-properties-common
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install -y oracle-java8-installer maven
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/oracle-jdk8-installer

# Define working directory.
WORKDIR /data

COPY src/ /data/src
COPY pom.xml /data

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Define default command.
CMD ["mvn", "spring-boot:run"]
