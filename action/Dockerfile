FROM golang:1.12.4
# FROM golang:1.12.4-alpine3.9
# FROM alpine:3.9.3

LABEL "inspiredby"="https://github.com/actions/bin/blob/master/sh/Dockerfile @ 2019 04 24"
LABEL "maintainer"="Lothar Schulz <http://bit.ly/2zVLbWh>"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="alpine shell for GitHub Actions"
LABEL "com.github.actions.description"="Runs one or more alpine shell commands in an Action"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="blue"

#RUN apk add --no-cache \
#    make 
#	bash \
#	ca-certificates \
#	coreutils \
#	curl \
#   jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]