#!/usr/bin/env bash
envsubst < /etc/nginx/conf.d/cfpio.template > /etc/nginx/conf.d/cfpio.conf
exec nginx -g 'daemon off;'