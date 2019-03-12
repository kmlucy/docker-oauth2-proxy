FROM buildpack-deps:jessie-curl

ENV PATH /opt/oauth2-proxy/bin:$PATH

RUN mkdir -p /opt/oauth2-proxy/bin && mkdir /opt/oauth2-proxy/etc && \
	curl --silent "https://api.github.com/repos/pusher/oauth2_proxy/releases/latest" | \
	grep -Po '"tag_name": "\K.*?(?=")' | \
	xargs -I {} curl -sL "https://github.com/pusher/oauth2_proxy/releases/download/"{}"/oauth2_proxy-"{}".linux-amd64.go1.11.tar.gz" | \
	tar xz --strip-components 1 -C /opt/oauth2-proxy/bin && \
	mv /opt/oauth2-proxy/bin/oauth2_proxy* /opt/oauth2-proxy/bin/oauth2_proxy

CMD oauth2_proxy -config=/opt/oauth2-proxy/etc/config

