#!/bin/sh
set -eu

echo "🚀 Starting containers..."
docker compose up -d

echo "✅ Containers are up. Use './stop.sh' to stop them."
