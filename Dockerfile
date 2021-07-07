FROM foxcapades/alpine-oracle:1.5

LABEL name=alpine-dev-base \
      version=1.2 \
      homepage=https://github.com/VEuPathDB/docker-alpine-oracle-jdk

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=/usr/lib/jvm/default-jvm/bin:$PATH

RUN cat /etc/apk/repositories; \
    apk add --no-cache wget curl bash openjdk16 maven tzdata && cp /usr/share/zoneinfo/US/Eastern /etc/localtime
