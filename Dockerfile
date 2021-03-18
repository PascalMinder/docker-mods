FROM linuxserver/jellyfin:latest

LABEL maintainer="PascalMinder"

# Install mesa 20.1
RUN \
   apt-get update  \
   # upgrades jellyfin, which overrides a config file
   # https://unix.stackexchange.com/questions/416815/force-non-interactive-dpkg-configure-when-using-apt-get-install
   && apt-get upgrade -y --option=Dpkg::Options::=--force-confdef \
   && apt-get install -y gpg \
   && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F63F0F2B90935439 \
   && echo "deb http://ppa.launchpad.net/kisak/kisak-mesa/ubuntu focal main" > /etc/apt/sources.list.d/kisak-ubuntu-kisak-mesa-bionic.list \
   && apt-get update \
   && apt-get -y install mesa-vdpau-drivers mesa-va-drivers mesa-vdpau-drivers libdrm-radeon1 \
   && apt-get -y upgrade