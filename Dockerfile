FROM alpine:latest

ENV DOCKER_VERSION="19.03.13"
ENV COMPOSE_VERSION="1.25.4"
ENV KUBE_VERSION="v1.19.2"
ENV HELM_VERSION="v3.4.2"

RUN wget -q https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz -O - | tar -xzO docker/docker > /usr/local/bin/docker \
    && chmod +x /usr/local/bin/docker
    
RUN apk add docker-compose=${COMPOSE_VERSION}

RUN wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl
    
RUN wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm
