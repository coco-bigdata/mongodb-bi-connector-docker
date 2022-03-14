# Start from fresh debian stretch & add some tools
# note: rsyslog & curl (openssl,etc) needed as dependencies too
FROM debian:stretch
RUN apt update
RUN apt install -y rsyslog nano curl

# Download BI Connector to /mongosqld
WORKDIR /tmp
COPY mongodb-bi-linux-x86_64-debian92-v2.14.4.tgz bi-connector.tgz
RUN tar -xvzf bi-connector.tgz && rm bi-connector.tgz && \
    mv /tmp/mongodb-bi-linux-x86_64-debian92-v2.14.4 /mongosqld

# Setup default environment variables
ENV MONGODB_HOST mongodb
ENV MONGODB_PORT 27017
ENV MONGODB_URL "mongodb://root:123456@mongodb:27017"
ENV LISTEN_PORT 3307

# Start Everything
# note: we need to use sh -c "command" to make rsyslog running as deamon too
RUN service rsyslog start
CMD sh -c "/mongosqld/bin/mongosqld --logPath /var/log/mongosqld.log --mongo-uri $MONGODB_URL --addr 0.0.0.0:$LISTEN_PORT"
