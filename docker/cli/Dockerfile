FROM docker:stable

LABEL "com.github.actions.color"="black"
LABEL "com.github.actions.name"="Docker GitHub Action"
LABEL "com.github.actions.description"="Docker CLI wrapper"
LABEL "com.github.actions.icon"="package"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]