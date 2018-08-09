FROM core/archlinux

RUN pacman -Syu
RUN pacman --noconfirm -S \
    git \
    gcc \
    make \
    automake \
    gtk3 \
    ncurses \
    giflib \
    libjpeg-turbo \
    libxml2 \
    libxpm \
    gnutls \
    curl \
    texinfo


RUN groupadd -r apps -g 1000
RUN useradd -m -d /home/darkanthey -s /bin/bash -r -u 1000 -g 1000 apps

ENV PATH "/home/darkanthey/.cargo/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

USER apps
WORKDIR /home/darkanthey

RUN curl https://sh.rustup.rs -o rustup.sh && \
    sh rustup.sh --default-host x86_64-unknown-linux-gnu --default-toolchain nightly-2018-02-18 -y && \
    rustup default nightly-2018-02-18

WORKDIR /home/darkanthey/remacs_src

ENTRYPOINT ./autogen.sh && ./configure --with-modules --without-mailutils --with-xft --without-tiff --with-zlib --without-x --with-libsystemd --enable-link-time-optimization --without-pop --prefix=/home/darkanthey/.local && \
           make && make install

