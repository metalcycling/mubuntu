#
#  Ubuntu OS
#

# Base image

FROM ubuntu:latest

# Make home default directory

WORKDIR /root

# Create environment directories

RUN mkdir Documents
RUN mkdir Programs

# Install sofware

RUN apt update
RUN apt upgrade -y
RUN apt install -y \
    build-essential \
    vim \
    screen \
    curl \
    wget \
    python3 \
    python3-pip

# Install conda

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
RUN bash Miniforge3-Linux-x86_64.sh -p /root/Programs/Miniforge -b
RUN rm Miniforge3-Linux-x86_64.sh
ENV PATH="/root/Programs/Miniforge/bin:${PATH}"

# Environment variables

ENV TERM="xterm-256color"

# Copy environment files

COPY .bash_aliases /root
COPY .bashrc /root
COPY .inputrc /root
COPY .screenrc /root
COPY .vimrc /root
COPY .vim /root/.vim
