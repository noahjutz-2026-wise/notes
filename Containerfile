FROM docker.io/123marvin123/typst:0.15.1

ARG GIT_HASH
ARG GIT_TAG
ENV GIT_HASH=${GIT_HASH}
ENV GIT_TAG=${GIT_TAG}

WORKDIR /app

COPY build.sh .
COPY src src
COPY vendor vendor

CMD ["bash", "-c", "./build.sh /output ${GIT_HASH} ${GIT_TAG}"]
