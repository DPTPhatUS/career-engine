#!/bin/sh
set -eu
umask 077

project_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
backup_dir=${1:-"$project_dir/backups"}
mkdir -p "$backup_dir"
temporary_file=$(mktemp "$backup_dir/.career-engine-XXXXXX.dump")
trap 'rm -f "$temporary_file"' EXIT HUP INT TERM

docker compose --project-directory "$project_dir" --env-file "$project_dir/.env" \
  -f "$project_dir/compose.yaml" exec -T db \
  pg_dump -U career_engine -d career_engine --format=custom > "$temporary_file"

backup_file="$backup_dir/career-engine-$(date -u +%Y%m%dT%H%M%SZ)-$$.dump"
mv "$temporary_file" "$backup_file"
printf 'Database backup saved to %s\n' "$backup_file"
