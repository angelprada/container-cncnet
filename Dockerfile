FROM debian:buster-slim

LABEL maintainer="Ángel Prada <root@angelprada.com>"

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y curl ca-certificates libicu63 && \
    useradd cncnet && \
    curl -L -o  cncnet.tgz https://downloads.cncnet.org/cncnet-server-core.tgz -O && \
    tar xfvz cncnet.tgz && rm cncnet.tgz

USER cncnet
ENTRYPOINT [ "/cncnet-server-core" ]