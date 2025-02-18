FROM alpine:latest
LABEL MAINTAINER="https://github.com/GrpDsG20"
WORKDIR /ForcePhishing/
ADD . /ForcePhishing
RUN apk add --no-cache bash ncurses curl unzip wget php 
CMD "./ForcePhishing.sh"
