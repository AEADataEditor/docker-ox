# syntax=docker/dockerfile:1.2
# First stage
FROM ubuntu:22.04 
ENV VERSION 9
ENV SUBVERSION 10
ENV MINORVERSION 0

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y  \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
         locales \
         libncurses5 \
         libfontconfig1 \
         git \
         nano \
         unzip \
         wget \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Set a few more things
ENV LANG en_US.utf8

# Adding Ox
RUN wget -O oxconsole.deb https://www.doornik.com/download/oxmetrics${VERSION}/Ox_Console/oxconsole_${VERSION}.${SUBVERSION}-${MINORVERSION}_amd64.deb \
    && apt-get install ./oxconsole.deb

