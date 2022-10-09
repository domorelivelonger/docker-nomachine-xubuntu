FROM ubuntu:latest
MAINTAINER Bohdan Pashkevych

ENV DEBIAN_FRONTEND=noninteractive
EXPOSE 22 4000



RUN apt update -y && apt install -y aptitude && aptitude dist-upgrade --purge-unused -y && aptitude clean
RUN apt install -y software-properties-common python3-software-properties sudo

RUN apt install -y vim xterm 
RUN apt install -y ssh openssh-server
RUN apt install -y nano curl wget


RUN add-apt-repository universe
#RUN add-apt-repository ppa:ubuntubudgie/backports


RUN apt install -y locales
RUN localedef -i en_IE -c -f UTF-8 -A /usr/share/locale/locale.alias en_IE.UTF-8
ENV LANG en_IE.utf8
#ENV LANG="en_IE.UTF-8"
ENV LANGUAGE=en_IE


#RUN apt install -y ubuntu-gnome-desktop
#RUN apt install -y kubuntu-full kubuntu-restricted-addons kubuntu-restricted-extras
#RUN apt install -y lubuntu-desktop lubuntu-restricted-addons lubuntu-restricted-extras
#RUN apt install -y ubuntu-budgie-desktop budgie-indicator-applet
RUN apt install -y xubuntu-desktop xfce4-goodies

# Install nomachine, change password and username to whatever you want here
RUN cd ~ && wget https://download.nomachine.com/download/7.10/Linux/nomachine_7.10.1_1_amd64.deb
RUN dpkg -i /root/nomachine_7.10.1_1_amd64.deb

ADD docker-entrypoint.sh /root/
# Cleanup 
#RUN apt autoclean \
#    && apt autoremove \
#    && rm -rf /var/lib/apt/lists/*

RUN sed -i '/DefaultDesktopCommand/c\DefaultDesktopCommand "/usr/bin/startxfce4"' /usr/NX/etc/node.cfg


ADD nxserver.sh /
RUN chmod +x /nxserver.sh

ENTRYPOINT ["/nxserver.sh"]
