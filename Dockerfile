FROM ubuntu:18.04
ENV LC_CTYPE C.UTF-8

# add i386, update everything and install some tools
RUN dpkg --add-architecture i386 && \
apt-get update && \
apt-get install -y \
    strace \
    ltrace \
    curl \
    wget \
    gcc \
    net-tools \
    vim \
    gdb \
    python \
    python-pip \
    python3 \
    python3-pip \
    wget \
    git \
    make \
    procps \
    libpcre3-dev \
    libdb-dev \
    libxt-dev \
    libxaw7-dev \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386

RUN (wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh)

RUN pip install \
    capstone \
    requests \
    pwn \
    r2pipe

RUN pip3 install \
    unicorn \
    capstone \
    ropper \
    keystone-engine

RUN mkdir /tools && cd /tools && \
    git clone https://github.com/JonathanSalwan/ROPgadget && \
    git clone https://github.com/radare/radare2 && \
    cd radare2 && sys/install.sh
