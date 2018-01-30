FROM fedora:latest

RUN yum install -y \
    git \
    gcc gcc-c++ \
    kernel-devel \
    make \
    automake \
    ncurses-devel \
    giflib-devel \
    libjpeg-turbo-devel \
    libtiff-devel \
    gtk3-devel \
    libxml2-devel \
    libXpm-devel \
    gnutls-devel \
    curl \
    texinfo


RUN groupadd -r apps -g 1000
RUN useradd -m -d /home/darkanthey -s /bin/bash -r -u 1000 -g 1000 apps

ENV PATH "/home/darkanthey/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

USER apps
WORKDIR /home/darkanthey

RUN curl https://sh.rustup.rs -o rustup.sh && \
    sh rustup.sh --default-host x86_64-unknown-linux-gnu --default-toolchain nightly-2018-01-28 -y && \
    rustup default nightly-2018-01-28

WORKDIR /home/darkanthey/remacs_src

ENTRYPOINT ./configure --with-modules --without-mailutils --with-xft --with-libsystemd --enable-link-time-optimization --without-pop --prefix=/home/darkanthey/.local && \
           make && make install

