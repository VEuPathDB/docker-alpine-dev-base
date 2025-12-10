FROM amazoncorretto:25-alpine3.22-jdk

LABEL name=alpine-dev-base \
      homepage=https://github.com/VEuPathDB/docker-alpine-oracle-jdk

ARG GRADLE_VERSION=9.2.1

ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION} \
    PATH=$PATH:/opt/gradle-${GRADLE_VERSION}/bin

RUN apk --no-cache add wget unzip libaio libnsl libc6-compat curl bash \
 && mkdir /opt/gradle \
 && cd /opt \
 && curl -L https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip \
 && unzip gradle.zip \
 && rm gradle.zip
