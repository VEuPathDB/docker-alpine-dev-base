FROM foxcapades/alpine-oracle:1.4

LABEL name=alpine-dev-base \
      version=1.1 \
      homepage=https://github.com/VEuPathDB/docker-alpine-oracle-jdk

ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=/usr/lib/jvm/default-jvm/bin:$PATH

RUN cat /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories; \
    apk add --no-cache wget curl bash openjdk15 maven tzdata && cp /usr/share/zoneinfo/US/Eastern /etc/localtime
