FROM foxcapades/alpine-oracle:1.5

LABEL name=alpine-dev-base \
      version=1.1 \
      homepage=https://github.com/VEuPathDB/docker-alpine-oracle-jdk

ENV JAVA_HOME=/opt/jdk \
    PATH=/mvn/bin:/opt/jdk/bin:$PATH

RUN apk add --no-cache wget \
    && wget https://corretto.aws/downloads/latest/amazon-corretto-15-x64-alpine-jdk.tar.gz \
    && tar -xzf amazon-corretto-15-x64-alpine-jdk.tar.gz \
    && rm amazon-corretto-15-x64-alpine-jdk.tar.gz \
    && mv amazon-corretto-15.0.2.7.1-alpine-linux-x64 /opt/jdk \
    && wget https://mirrors.gigenet.com/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
    && tar -xzf apache-maven-3.6.3-bin.tar.gz \
    && rm apache-maven-3.6.3-bin.tar.gz \
    && mv apache-maven-3.6.3 /mvn
