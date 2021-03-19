# Buildstage
FROM ghcr.io/linuxserver/baseimage-alpine:3.12 as buildstage

# Install at least mesa 20.1
RUN \
   echo "**** install packages ****" && \
   apk add --no-cache \
   mesa-vdpau-gallium mesa-va-gallium mesa-vdpau-gallium libdrm

# copy local files
COPY root/ /root-layer/

# Single layer deployed image ##
FROM scratch

LABEL maintainer="PascalMinder"

# Add files from buildstage
COPY --from=buildstage /root-layer/ /
