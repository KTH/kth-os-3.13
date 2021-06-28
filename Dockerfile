FROM alpine:3.13
RUN apk update && apk upgrade

RUN echo "IMAGE INFORMATION" > KTH_OS
RUN echo "Build date: `date`" >> KTH_OS
RUN echo "Alpine version: `cat /etc/alpine-release `" >> KTH_OS
