FROM debian:latest

ARG VERSION=0.8.13

RUN apt update -y && \
    apt install wget make gcc -y && \
    mkdir /app  && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /app
RUN wget https://github.com/z3APA3A/3proxy/archive/${VERSION}.tar.gz && \
tar -xvf ${VERSION}.tar.gz && rm *.gz
WORKDIR /app/3proxy-${VERSION}
RUN ln -s Makefile.Linux Makefile && make &&  make install 
WORKDIR /app
COPY 3proxy.cfg /app
EXPOSE 7787:7787/tcp 7788:7788/tcp
CMD ["3proxy", "3proxy.cfg"]

