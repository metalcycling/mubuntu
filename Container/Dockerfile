#
#  Ubuntu OS
#

# Base image

FROM ubuntu:latest

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

# Environment variables

ENV TERM="xterm-256color"

# Make home default directory

WORKDIR /root

# Copy environment files

COPY .bash_aliases /root
COPY .bashrc /root
COPY .inputrc /root
COPY .screenrc /root
COPY .vimrc /root
COPY .vim /root/.vim

# Create environment directories

RUN mkdir Documents 
RUN mkdir Programs 
