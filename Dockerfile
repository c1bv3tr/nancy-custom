FROM alpine:3.13

LABEL com.github.actions.name="Nancy for GitHub Actions" \
    com.github.actions.description="Run Sonatype Nancy as part of your GitHub Actions workflow."

RUN apk add --no-cache curl
RUN apk add --no-cache --upgrade grep

COPY install-nancy.sh /install-nancy.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
