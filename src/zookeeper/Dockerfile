FROM java:8-jre
MAINTAINER Igor Tromel

RUN apt-get install -y wget tar

ARG VERSION=3.5.3-beta
ENV VERSION 3.5.3-beta

LABEL name="zookeeper" version=$VERSION

RUN wget -q -O - http://www-us.apache.org/dist/zookeeper/zookeeper-$VERSION/zookeeper-$VERSION.tar.gz | tar -xf - -C /opt \
    && ln -s /opt/zookeeper-$VERSION /opt/zookeeper

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

COPY zoo.cfg conf/

COPY entrypoint.sh bin/

RUN chmod a+x bin/entrypoint.sh

ENTRYPOINT ["bin/entrypoint.sh"]

CMD ["1"]

