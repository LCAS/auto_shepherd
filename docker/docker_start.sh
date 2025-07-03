#!/usr/bin/env bash
set -euo pipefail

# 1) Do we have *any* containers for this Compose project?
if ! docker compose ps --quiet | grep -q .; then
    echo "No containers found — running 'docker compose up -d' to create them..."
    docker compose up -d
fi

# 2) Are any of those containers currently running?
if ! docker compose ps --services --filter "status=running" | grep -q .; then
    echo "Containers exist but are stopped — starting them now..."
    docker compose start
else
    echo "Docker Compose services already running."
fi
