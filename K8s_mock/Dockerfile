FROM alpine:latest
EXPOSE 8001

ADD ./K8s_mock/configs/cluster-config.yaml /configs/cluster-config.yaml
ADD ./K8s_mock/start_kind.sh /scripts/start_kind.sh

RUN mkdir packages
RUN apk update && apk add curl docker

# Install K8s kind cluster
RUN curl -Lo /packages/kind https://kind.sigs.k8s.io/dl/v0.8.1/kind-$(uname)-amd64
RUN chmod +x /packages/kind
RUN ln -s /packages/kind /usr/local/bin/kind
RUN ln -s /scripts/start_kind.sh /usr/local/bin/start_kind

ENTRYPOINT ["start_kind"]

STOPSIGNAL SIGTERM