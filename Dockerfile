FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y kea-dhcp4-server && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/kea
COPY kea-docker.conf /etc/kea/kea-dhcp4.conf
EXPOSE 67/udp
CMD ["kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf"]