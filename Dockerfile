FROM debian:10.4
WORKDIR .
RUN apt-get -qq update \
	&& apt-get -y -qq install curl \
	&& apt-get -y -qq install lib32gcc1 \
	&& apt-get -y -qq install wget \
	&& useradd -m steam \
	&& su - steam \
	&& mkdir /root/Steam  \
	&& cd /root/Steam \
	&& wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz \
	&& tar xf /root/Steam/steamcmd_linux.tar.gz \
	&& rm steamcmd_linux.tar.gz \
	&& bash /root/Steam/steamcmd.sh

# Expose ports
EXPOSE 27015/tcp 27015/udp 27020/udp
