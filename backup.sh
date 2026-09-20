#!/usr/bin/env bash
set -euo pipefail
SOURCE="${1:-}"; DEST="${2:-./backups}"
if [[ -z "$SOURCE" || ! -d "$SOURCE" ]]; then echo "Uso: backup.sh CARPETA DESTINO" >&2; exit 1; fi
mkdir -p "$DEST"
STAMP="$(date +%Y%m%d-%H%M%S)"; NAME="$(basename "$(realpath "$SOURCE")")-${STAMP}.tar.gz"
tar -czf "$DEST/$NAME" -C "$(dirname "$(realpath "$SOURCE")")" "$(basename "$(realpath "$SOURCE")")"
printf 'Backup creado: %s\n' "$DEST/$NAME"
