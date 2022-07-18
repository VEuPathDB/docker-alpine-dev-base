FROM amazoncorretto:18-alpine3.15

LABEL name=alpine-dev-base \
      homepage=https://github.com/VEuPathDB/docker-alpine-oracle-jdk

RUN echo; \
    echo "********************************************************************************"; \
    echo "*"; \
    echo "*  Installing APK dependencies"; \
    echo "*"; \
    echo "********************************************************************************"; \
    apk --no-cache add wget unzip libaio libnsl libc6-compat curl tzdata bash maven;