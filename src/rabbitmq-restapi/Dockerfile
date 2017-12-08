FROM golang:1.8
MAINTAINER Caio Villela <villela.caio@gmail.com>

EXPOSE 8080

ENV SHELL /bin/bash

RUN rm -rf /opt/local/rabbitmq-restapi

RUN mkdir -p /opt/local/rabbitmq-restapi

WORKDIR /opt/local/rabbitmq-restapi

RUN git clone https://github.com/smallfish/rabbitmq-http.git /opt/local/rabbitmq-restapi

RUN go get github.com/streadway/amqp

RUN go build rabbitmq-http.go

ENTRYPOINT ["/opt/local/rabbitmq-restapi/rabbitmq-http"]
