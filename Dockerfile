FROM foxcapades/alpine-oracle:1.3

LABEL name=alpine-dev-base \
      version=1.0 \
      homepage=https://github.com/VEuPathDB/docker-alpine-oracle-jdk

ENV JAVA_HOME=/opt/jdk \
    PATH=/mvn/bin:/opt/jdk/bin:$PATH

RUN apk add --no-cache wget
    && wget https://download.java.net/java/early_access/alpine/10/binaries/openjdk-15-ea+10_linux-x64-musl_bin.tar.gz \
    && tar -xzf openjdk-15-ea+10_linux-x64-musl_bin.tar.gz \
    && rm openjdk-15-ea+10_linux-x64-musl_bin.tar.gz \
    && mv jdk-15 /opt/jdk \
    && wget https://mirrors.gigenet.com/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz \
    && tar -xzf apache-maven-3.6.3-bin.tar.gz \
    && rm apache-maven-3.6.3-bin.tar.gz \
    && mv apache-maven-3.6.3 /mvn
