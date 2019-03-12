# OAuth2 Proxy Container

Run:
```
 docker run -d --rm --name oauth2 kmlucy/docker-oauth2-proxy oauth2_proxy \
      --email-domain="yourcompany.com" \
      --upstream=http://127.0.0.1:8080/ \
      --cookie-secret=... \
      --client-id=... \
      --client-secret=...
```

Based on [pusher/oauth2_proxy](https://github.com/pusher/oauth2_proxy) and [wingedkiwi/oauth2-proxy-container](https://github.com/wingedkiwi/oauth2-proxy-container)
