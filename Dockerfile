FROM alpine:latest

RUN set -xe \
 && apk add --no-cache --update \
    netcat-openbsd qemu-x86_64 qemu-system-x86_64 \
    busybox-extras iproute2 iputils \
    bridge-utils iptables jq bash python3
    
EXPOSE 22 23 80 8291 50 51 500/udp 4500/udp 

# Environments which may be change
ENV ROUTEROS_VERSION="6.48.3"
ENV ROUTEROS_IMAGE="chr-${ROUTEROS_VERSION}.vdi"
ENV ROUTEROS_URL="https://download.mikrotik.com/routeros/${ROUTEROS_VERSION}/$ROUTEROS_IMAGE"

WORKDIR /routeros

COPY bin bin/
RUN chmod -R 755 /routeros/bin
RUN ip link show

RUN wget ${ROUTEROS_URL} -O /routeros/${ROUTEROS_IMAGE}
# Download VDI image from remote site

ENTRYPOINT [ "/routeros/bin/entrypoint.sh" ]
