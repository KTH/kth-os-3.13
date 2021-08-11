FROM alpine:3.13

# Bash is such a widely used shell so install it from start.
RUN apk update && apk upgrade && \
    apk add bash

RUN echo "IMAGE INFORMATION" > KTH_OS
RUN echo "Build date: `date`" >> KTH_OS
RUN echo "Alpine version: `cat /etc/alpine-release `" >> KTH_OS
RUN echo "Bash version: `/bin/bash --version`" >> KTH_OS
