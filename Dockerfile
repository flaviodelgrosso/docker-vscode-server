FROM ubuntu:22.04

ENV MACHINE_NAME vscode-remote

ARG ARCH

COPY bin/* /usr/local/bin/

RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends \
    tzdata \
    gnome-keyring wget curl python3-minimal ca-certificates \
    git build-essential && \
    apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* && \
    download_vscode ${ARCH}

WORKDIR /home/workspace

ENTRYPOINT [ "start_tunnel" ]