FROM buildpack-deps:jessie-curl

ENV ARCHIVE=https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz
ENV PATH /opt/oauth2-proxy/bin:$PATH

RUN mkdir -p /opt/oauth2-proxy/bin && mkdir /opt/oauth2-proxy/etc && \
    curl -L -k --silent $ARCHIVE  | tar xz --strip-components 1 -C /opt/oauth2-proxy/bin

CMD oauth2_proxy -config=/opt/oauth2-proxy/etc/config

