FROM alpine:latest

LABEL "inspiredby"="https://github.com/actions/bin/blob/master/sh/Dockerfile @ 2019 04 24"
LABEL "maintainer"="Lothar Schulz <http://bit.ly/2zVLbWh>"
LABEL "version"="0.0.1"

LABEL "com.github.actions.name"="alpine shell for GitHub Actions"
LABEL "com.github.actions.description"="Runs one or more alpine shell commands in an Action"
LABEL "com.github.actions.icon"="terminal"
LABEL "com.github.actions.color"="gray-dark"

RUN apk add --no-cache bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]