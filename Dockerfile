FROM debian:buster

COPY docker-apt /usr/local/bin/docker-apt
RUN chmod 755 /usr/local/bin/docker-apt && docker-apt ca-certificates
RUN docker-apt curl wget gnupg && \
    echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/Debian_10/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list && \
    wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/Debian_10/Release.key -O Release.key && \
    apt-key add - < Release.key && docker-apt buildah skopeo && rm Release.key
