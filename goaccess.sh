#!/bin/bash

# Credit: https://alexmv12.xyz/blog/goaccess_caddy/

goaccess <(cat /var/log/caddy/access.log | jq --raw-output '
    .request.remote_addr |= .[:-6] |
    select(.request.remote_addr != "127.0.0.1") |
    select(.request.uri | startswith("/_matrix/") | not) |
    [
      .common_log,
      .request.headers.Referer[0] // "-",
      .request.headers."User-Agent"[0],
      .duration
    ] | @csv') --log-format='"%h - - [%d:%t %^] ""%m %r %H"" %s %b","%R","%u",%T' --time-format='%H:%M:%S' --date-format='%d/%b/%Y'
# --real-time-html -o report.html
