FROM openjdk:17-jdk-alpine

LABEL name=alpine-dev-base \
      version=1.2 \
      homepage=https://github.com/VEuPathDB/docker-alpine-oracle-jdk

RUN echo; \
    echo "********************************************************************************"; \
    echo "*"; \
    echo "*  Setting up edge APK repositories"; \
    echo "*"; \
    echo "********************************************************************************"; \
    cat /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" > /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories; \
    \
    echo; \
    echo "********************************************************************************"; \
    echo "*"; \
    echo "*  Installing APK dependencies"; \
    echo "*"; \
    echo "********************************************************************************"; \
    apk --no-cache add wget unzip libaio libnsl libc6-compat curl tzdata bash; \
    \
    echo; \
    echo "********************************************************************************"; \
    echo "*"; \
    echo "*  Installing Oracle Instant Client"; \
    echo "*"; \
    echo "********************************************************************************"; \
    wget -q https://download.oracle.com/otn_software/linux/instantclient/211000/instantclient-basiclite-linux.x64-21.1.0.0.0.zip \
        && unzip -j instantclient-basiclite-linux.x64-21.1.0.0.0.zip \
            -x instantclient_21_1/ojdbc8.jar \
                instantclient_21_1/ucp.jar \
                instantclient_21_1/xstreams.jar \
            -d /usr/lib \
        && mkdir /jdbc \
        && unzip -j instantclient-basiclite-linux.x64-21.1.0.0.0.zip \
            instantclient_21_1/ojdbc8.jar \
            instantclient_21_1/ucp.jar \
            instantclient_21_1/xstreams.jar -d /jdbc \
        && rm instantclient-basiclite-linux.x64-21.1.0.0.0.zip \
        && ln -s /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1 \
        && ln -s /lib/libc.so.6 /usr/lib/libresolv.so.2 \
        && ln -s /lib64/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 \
    \
    echo; \
    echo "********************************************************************************"; \
    echo "*"; \
    echo "*  Installing Maven"; \
    echo "*"; \
    echo "********************************************************************************"; \
    mkdir /usr/lib/maven; \
    cd /usr/lib/maven; \
    wget -q https://dlcdn.apache.org/maven/maven-3/3.8.2/binaries/apache-maven-3.8.2-bin.tar.gz \
        && tar -xf apache-maven-3.8.2-bin.tar.gz \
        && rm apache-maven-3.8.2-bin.tar.gz \
    && cd /usr/bin; \
    echo "#!/bin/sh" > mvn; \
    echo "/usr/lib/maven/apache-maven-3.8.2/bin/mvn" >> mvn; \
    chmod +x /usr/bin/mvn
