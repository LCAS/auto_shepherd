#!/bin/bash

# Check if any container is running from this compose project
if ! docker compose ps --services --filter "status=running" | grep -q .; then
    echo "Starting Docker Compose containers..."
    docker compose start
else
    echo "Docker Compose services already running."
fi
