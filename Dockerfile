FROM alpine:3.7

RUN apk update && \
  apk add ca-certificates socat wget tar && \
  rm -rf /var/cache/apk/*

ENV HOME /tmp

RUN wget -O /tmp/helm.tgz https://storage.googleapis.com/kubernetes-helm/helm-v2.12.0-linux-arm.tar.gz && \
  tar xvf /tmp/helm.tgz && \
  mv ./linux-arm/helm /helm && \
  mv ./linux-arm/tiller /tiller && \
  rm -rf ./linux-arm /tmp/helm.tgz

EXPOSE 44134
USER nobody
ENTRYPOINT ["/tiller"]
