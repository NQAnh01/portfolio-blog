#!/bin/sh
set -eu

echo "🛑 Stopping containers..."
docker compose down --remove-orphans

echo "✅ Containers stopped."
