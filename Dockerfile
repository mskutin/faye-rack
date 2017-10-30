FROM jruby:9.1.12 as BUILD
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get update
RUN apt-get install -y -q --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    g++ \
    gcc \
    git \
    make \
    sudo \
    wget \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoclean

WORKDIR /mev

COPY Gemfile Gemfile.lock ./

RUN bundle install 

COPY . .

RUN JRUBY_OPTS=--debug bundle exec warble war --trace

FROM izone/tomcat:latest

# Connectors Java
ENV URL_JDBC="https://github.com/luvres/jdbc/raw/master"

ENV ORACLE_CONN_J ojdbc7.jar
ENV ORACLE_CONN_J_URL $URL_JDBC/$ORACLE_CONN_J

RUN wget -c $ORACLE_CONN_J_URL -O /usr/local/tomcat/lib/$ORACLE_CONN_J && \
    wget http://central.maven.org/maven2/org/apache/tomcat/tomcat-websocket/8.0.24/tomcat-websocket-8.0.24.jar -O /usr/local/tomcat/lib/tomcat-websocket-8.0.24.jar

EXPOSE 8080

COPY --from=BUILD /mev/faye.war /usr/local/tomcat/webapps/faye.war

ADD start.sh /etc/start.sh

CMD ["sh", "/etc/start.sh", "run"]