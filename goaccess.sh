#!/bin/bash

# (cat /var/log/caddy/access.log ; zcat /var/log/caddy/access-*.log.gz) | jq 'select(.request.uri != "/.well-known/matrix/server")' | goaccess - --log-format=CADDY -o xn--sb-lka.org/rapport.$RANDOM.html

(cat /var/log/caddy/access.log ; zcat /var/log/caddy/access-*.log.gz) | goaccess - --log-format=CADDY -o xn--sb-lka.org/rapport.$RANDOM.html
