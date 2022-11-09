FROM ubuntu:18.04 AS builder

RUN apt-get update && \
    dpkg --add-architecture i386 && \
    apt-get install -y lib32ncurses5 lib32z1 build-essential ed git && \
    apt-get install -y gcc-4.8 gcc-4.8-multilib g++-4.8 g++-4.8-multilib && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 40 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 40

RUN useradd -m project

WORKDIR /home/project

RUN mkdir /home/project/nachos

COPY ./nachos_40.tar.gz /home/project/nachos
COPY ./nachos-gcc.diff.gz /home/project/nachos
COPY ./mips-decstation.linux-xgcc.gz /home/project/nachos

COPY ./script.sh /script.sh

RUN chmod +x /script.sh

CMD ["/script.sh"]