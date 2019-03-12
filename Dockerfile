FROM debian:stretch
LABEL maintainer "Kyle Lucy <kmlucy@gmail.com>"

ENV PATH /opt/oauth2-proxy/bin:$PATH

RUN apt-get update -qq && apt-get install -y curl ca-certificates && \
	mkdir -p /opt/oauth2-proxy/bin && mkdir /opt/oauth2-proxy/etc && \
	curl --silent "https://api.github.com/repos/pusher/oauth2_proxy/releases/latest" | \
	grep -Po '"tag_name": "\K.*?(?=")' | \
	xargs -I {} curl -sL "https://github.com/pusher/oauth2_proxy/releases/download/"{}"/oauth2_proxy-"{}".linux-amd64.go1.11.tar.gz" | \
	tar xz --strip-components 1 -C /opt/oauth2-proxy/bin && \
	mv /opt/oauth2-proxy/bin/oauth2_proxy* /opt/oauth2-proxy/bin/oauth2_proxy && \
	apt-get clean && apt-get purge -y curl && apt-get autoremove --purge -y && \
	rm -rf /var/lib/apt-lists/* /tmp/* /var/tmp/*

CMD oauth2_proxy -config=/opt/oauth2-proxy/etc/config

