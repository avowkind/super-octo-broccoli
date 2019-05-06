FROM alpine
LABEL maintainer="Andrew Watkins <andrew.watkins@plantandfood.co.nz>"

RUN apk update && apk add busybox-extras ssmtp
ENV APP_DIR=/srv/app
# COPY over our default production.ini file.
COPY ssmtp.config /etc/ssmtp
COPY testmail.txt . 


