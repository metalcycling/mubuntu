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

RUN apt update && apt upgrade -y

# Update timezone

RUN DEBIAN_FRONTEND=noninteractive TZ=America/New_York \
    apt install -y tzdata && \
    ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
    echo "America/New_York" > /etc/timezone && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Install software

RUN apt install -y \
    sudo \
    software-properties-common \
    build-essential \
    vim \
    screen \
    curl \
    wget \
    iputils-ping \
    tree \
    git \
    gpg \
    expect \
    lsb-release

# Install Python

RUN add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update \
    && apt-get install -y python3.11 python3.11-venv python3.11-dev \
    && curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11 \
    && ln -s /usr/bin/python3.11 /usr/local/bin/python \
    && ln -s /usr/bin/python3.11 /usr/local/bin/python3

# Install uv

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:${PATH}"

# Install LaTeX

#RUN apt install -y \
#    texlive-full

# Copy environment files

COPY .bash_aliases /root/
COPY .complete_alias /root
COPY .bashrc /root
COPY .inputrc /root
COPY .screenrc /root
COPY .vimrc /root
COPY .vim /root/.vim
COPY .kube /root/.kube

WORKDIR /root/.vim

RUN tar -xvf pack.tar
RUN rm pack.tar

# Command to run

WORKDIR /root

CMD ["bash"]
