FROM amazoncorretto:18-alpine3.15

LABEL name=alpine-dev-base \
      homepage=https://github.com/VEuPathDB/docker-alpine-oracle-jdk

ARG GRADLE_VERSION=7.5.1

ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION} \
    PATH=$PATH:/opt/gradle-${GRADLE_VERSION}/bin

RUN echo \
    ;  echo "********************************************************************************" \
    ;  echo "*" \
    ;  echo "*  Installing APK dependencies" \
    ;  echo "*" \
    ;  echo "********************************************************************************" \
    ;  apk --no-cache add wget unzip libaio libnsl libc6-compat curl tzdata bash \
    && mkdir /opt/gradle \
    && cd /opt \
    && curl -L https://downloads.gradle-dn.com/distributions/gradle-${GRADLE_VERSION}-bin.zip -o gradle.zip \
    && unzip gradle.zip \
    && rm gradle.zip

