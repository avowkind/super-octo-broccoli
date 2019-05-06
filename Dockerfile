FROM alpine
LABEL maintainer="Andrew Watkins <andrew.watkins@plantandfood.co.nz>"

RUN apk update && apk add busybox-extras ssmtp
COPY ssmtp.conf /etc/ssmtp
COPY testmail.txt . 


