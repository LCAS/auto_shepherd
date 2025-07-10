#!/usr/bin/env bash
set -euo pipefail

# Check if DISPLAY is set
if [ -z "${DISPLAY:-}" ]; then
    echo "Warning: DISPLAY is not set on host — containers may not be able to use X11."
else
    echo "DISPLAY is set to: $DISPLAY"
fi

# Ensure container user has X access
echo "Granting X11 access to user 'ros'..."
xhost +SI:localuser:ros

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
