#!/usr/bin/env bash

set -e

confd -onetime -backend env

/usr/bin/caddy -validate --agree=true --conf=/etc/Caddyfile

exec /usr/bin/caddy --agree=true --conf=/etc/Caddyfile

#trap : TERM INT; sleep infinity & wait