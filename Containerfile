FROM docker.io/123marvin123/typst:0.15.1

ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH}

WORKDIR /app

COPY build.sh .
COPY src src

CMD ["bash", "-c", "./build.sh /output ${GIT_HASH}"]
