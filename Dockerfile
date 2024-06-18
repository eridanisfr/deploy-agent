FROM alpine:latest

ENV DOCKER_VERSION="24.0.6"
ENV KUBE_VERSION="v1.30.2"
ENV HELM_VERSION="v3.15.1"
ENV HNS_VERSION="v0.8.0"
ENV NEAT_VERSION="v2.0.3"
ENV KUSTOMIZE_VERSION="v5.4.2"

RUN wget -q https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz -O - | tar -xzO docker/docker > /usr/local/bin/docker \
    && chmod +x /usr/local/bin/docker

RUN apk add --no-cache docker-compose gettext jq git bash gawk

RUN wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm

RUN wget -q https://github.com/kubernetes-sigs/multi-tenancy/releases/download/hnc-${HNS_VERSION}/kubectl-hns_linux_amd64 -O /usr/local/bin/kubectl-hns \
    && chmod +x /usr/local/bin/kubectl-hns

RUN wget -q https://github.com/itaysk/kubectl-neat/releases/download/${NEAT_VERSION}/kubectl-neat_linux_amd64.tar.gz -O - | tar -xzO kubectl-neat > /usr/local/bin/kubectl-neat \
    && chmod +x /usr/local/bin/kubectl-neat

RUN wget -q https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -O - | tar -xzO kustomize > /usr/local/bin/kustomize \
    && chmod +x /usr/local/bin/kustomize
