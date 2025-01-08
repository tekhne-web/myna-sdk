# Update the base_tag to the version of the base image (https://hub.docker.com)
ARG base_tag=22.04

ARG base_img=ubuntu:${base_tag}

FROM --platform=linux/amd64 ${base_img} AS builder

# Update package lists, install basic tools, toolchains, and clean up

RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
    autoconf \
    automake \
    build-essential \
    ca-certificates \
    curl \
    make \
    cmake \
    wget \
    xxd \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Setup a tool directory in /home/dev and download the ARM toolchain

WORKDIR /home/dev

RUN curl -L https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 | tar xj

# Set the PATH environment variable

ENV PATH=/home/dev/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH

# Combining VOLUME + "docker run -v" means that you can mount the content of a host folder into your volume persisted by the container

#VOLUME ["/home/app"]

# Create and set the working directory to /home/app

WORKDIR /home/app

# Set the default command to run when the container starts

CMD ["/bin/bash"]
