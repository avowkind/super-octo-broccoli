FROM alpine

RUN apk update && apk add busybox-extras ssmtp
