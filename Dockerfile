# Buildstage
FROM ghcr.io/linuxserver/baseimage-alpine:3.12 as buildstage

# copy local files
COPY root/ /root-layer/

# Single layer deployed image ##
FROM scratch

LABEL maintainer="PascalMinder"

# Add files from buildstage
 COPY --from=buildstage /root-layer/ /
