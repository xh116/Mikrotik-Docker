FROM alpine:latest

RUN set -xe \
    && apk add --no-cache --update \
        netcat-openbsd \
        qemu-x86_64 \
        qemu-system-x86_64 \
        busybox-extras \
        iproute2 \
        iputils \
        bridge-utils \
        iptables \
        jq \
        bash \
        python3 \
        curl

# Environments which may be change
ENV ROUTEROS_VERSION="6.48.3"
ENV ROUTEROS_IMAGE="chr-${ROUTEROS_VERSION}.vdi"
ENV ROUTEROS_URL="https://download.mikrotik.com/routeros/${ROUTEROS_VERSION}/$ROUTEROS_IMAGE"

WORKDIR /routeros

COPY /bin /routeros

RUN wget ${ROUTEROS_URL} -O /routeros/${ROUTEROS_IMAGE}
# Download VDI image from remote site
EXPOSE 21 22 23 8291 8728 8729 51820 50 51 500/udp 4500/udp 

ENTRYPOINT [ "/routeros/bin/entrypoint.sh" ]
