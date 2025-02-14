FROM ubuntu:latest

COPY asterisk20.12.0base.txt /tmp/asterisk20.12.0base.txt

RUN apt update && xargs -a /tmp/asterisk20.12.0base.txt apt install -y

WORKDIR /usr/src

RUN wget https://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20.12.0.tar.gz && \
    tar -xzvf asterisk-20.12.0.tar.gz && \
    cd asterisk-20.12.0 && \
    ./configure --with-pjproject-bundled && \
    make -j$(nproc) && \
    make install && \
    make config

COPY configs/ /etc/asterisk/

CMD ["/usr/sbin/asterisk", "-f", "-vvv"]
