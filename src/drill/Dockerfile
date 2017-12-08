FROM docker.ilog.com.br:443/ilog/base-java8:latest
MAINTAINER Igor Tromel

# install dev tools
RUN apt-get install -y wget tar

# get drill
RUN wget http://www-eu.apache.org/dist/drill/drill-1.11.0/apache-drill-1.11.0.tar.gz
# create Drill folder
RUN mkdir -p /opt/drill

# extract Drill
RUN tar -xvzf apache-drill-1.11.0.tar.gz  --strip=1 -C /opt/drill

RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.43.tar.gz
RUN wget http://central.maven.org/maven2/org/postgresql/postgresql/9.4.1212/postgresql-9.4.1212.jar
RUN tar -xzvf mysql-connector-java-5.1.43.tar.gz && mv mysql-connector-java-5.1.43/mysql-connector-java-5.1.43-bin.jar /opt/drill/jars/3rdparty && rm -rf mysql-connector-java-5.1.43 && rm -rf mysql-connector-java-5.1.43.tar.gz && rm -rf apache-drill-1.11.0.tar.gz && mv postgresql-9.4.1212.jar /opt/drill/jars/3rdparty

COPY config.sh /opt/drill
WORKDIR /opt/drill

RUN chmod +x config.sh

COPY startup.sh /opt/drill
RUN chmod +x startup.sh
# add boostrap.sh
#ADD bootstrap.sh /etc/bootstrap.sh
#RUN chown root:root /etc/bootstrap.sh
#RUN chmod 700 /etc/bootstrap.sh
#ENV BOOTSTRAP /etc/bootstrap.sh
EXPOSE 8047
EXPOSE 31010
EXPOSE 31011
EXPOSE 31012

CMD [ "/bin/tini", "--", "/opt/drill/startup.sh" ]
