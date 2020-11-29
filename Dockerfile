FROM linuxserver/jellyfin:latest

LABEL maintainer="PascalMinder"

# Install mesa 20.1
RUN \
   apt-get update  \
   && apt-get upgrade -y \
   && apt-get install -y gpg \
   && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F63F0F2B90935439 \
   && echo "deb http://ppa.launchpad.net/kisak/kisak-mesa/ubuntu focal main" > /etc/apt/sources.list.d/kisak-ubuntu-kisak-mesa-bionic.list \
   && apt-get update \
   && apt-get -y install mesa-vdpau-drivers mesa-va-drivers mesa-vdpau-drivers libdrm-radeon1 \
   && apt-get -y upgrade