#!/bin/bash
set -e

rm -f /app/tmp/pids/server.pid

# 本番環境
# rails db:create
# rails db:seed

exec "$@"