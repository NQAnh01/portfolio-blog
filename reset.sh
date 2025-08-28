#!/bin/sh
set -eu

# Volumes cache cần xoá (không gồm dbdata)
CACHE_VOLUMES="vendor node_modules composer-cache npm-cache storage"

# Nhận project name: ưu tiên COMPOSE_PROJECT_NAME; fallback = tên thư mục hiện tại
PROJECT="${COMPOSE_PROJECT_NAME:-$(basename "$PWD")}"

CONFIRM=1
WIPE_DB=0

for arg in "$@"; do
  case "$arg" in
    --yes|-y) CONFIRM=0 ;;
    --all|-a) WIPE_DB=1 ;;
    --help|-h)
      echo "Usage: $0 [--yes|-y] [--all|-a]"
      echo "  --yes   : không hỏi xác nhận"
      echo "  --all   : xóa luôn DB volume (dbdata)"
      exit 0
      ;;
  esac
done

echo "🔻 Stopping containers (no volume removal yet)..."
docker compose down --remove-orphans || true

# Danh sách volume đầy đủ (ghép prefix <project>_ )
VLIST=""
for v in $CACHE_VOLUMES; do
  VLIST="$VLIST ${PROJECT}_${v}"
done

if [ "$WIPE_DB" -eq 1 ]; then
  VLIST="$VLIST ${PROJECT}_dbdata"
fi

echo "📦 Volumes sẽ xoá:"
for v in $VLIST; do
  echo "  - $v"
done

if [ "$CONFIRM" -eq 1 ]; then
  echo -n "❓ Xác nhận xoá các volumes trên? [y/N] "
  read ans
  case "${ans:-N}" in
    y|Y) ;;
    *) echo "❎ Bỏ qua."; exit 0 ;;
  esac
fi

echo "🗑  Removing selected volumes..."
for v in $VLIST; do
  docker volume rm "$v" 2>/dev/null && echo "  ✅ $v" || echo "  ⚠️  $v (không tồn tại hoặc đang dùng)"
done

echo "🚀 Done. Bạn có thể chạy lại:"
echo "    docker compose up -d"
