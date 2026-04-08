#
#  Ubuntu OS
#

# Base image

FROM ubuntu:22.04

# Make home default directory

WORKDIR /root

# Environment variables

ENV TERM="xterm-256color"

# Update package registry

RUN apt update && apt upgrade --yes

# Update timezone

RUN DEBIAN_FRONTEND=noninteractive TZ=America/New_York \
    apt install -y tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    echo "America/New_York" > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Install software

RUN apt install --yes \
    build-essential \
    curl \
    expect \
    git \
    gpg \
    iputils-ping \
    lsb-release \
    screen \
    software-properties-common \
    sudo \
    tree \
    vim \
    wget

# Install Python

RUN add-apt-repository ppa:deadsnakes/ppa --yes \
    && apt update \
    && apt install --yes python3.12 python3.12-venv python3.12-dev \
    && curl -sS https://bootstrap.pypa.io/get-pip.py | python3.12 \
    && ln -s /usr/bin/python3.12 /usr/local/bin/python \
    && ln -s /usr/bin/python3.12 /usr/local/bin/python3

# Install uv

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:${PATH}"

# Install LaTeX

RUN apt install --yes \
    texlive-full

# Install AWS CLI

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm -rf aws awscliv2.zip

# Install Kubectl

ARG TARGETOS
ARG TARGETARCH

RUN curl -fL -o /usr/local/bin/kubectl "https://dl.k8s.io/release/$(curl -fsSL https://dl.k8s.io/release/stable.txt)/bin/${TARGETOS}/${TARGETARCH}/kubectl"
RUN chmod 0755 /usr/local/bin/kubectl

# Install Claude Code

RUN curl -fsSL https://claude.ai/install.sh | bash

# Copy environment files

RUN git clone https://github.com/metalcycling/mubuntu.git /opt/mubuntu
RUN cp -rT /opt/mubuntu/Files /root
RUN rm -rf /opt/mubuntu
RUN tar -xvf ~/.vim/pack.tar -C ~/.vim
RUN rm ~/.vim/pack.tar

# Clean registry

RUN apt clean && \
    rm -rf /var/lib/apt/lists/*

# Command to run

CMD ["/bin/bash"]
