#!/bin/bash

# Prompt user to select a service
echo "Select a service to attach to:"
select SERVICE in simulation sheep_localisation; do
    if [[ "$SERVICE" == "simulation" || "$SERVICE" == "sheep_localisation" ]]; then
        # Get the running container name
        CONTAINER=$(docker compose ps -q "$SERVICE")
        if [[ -z "$CONTAINER" ]]; then
            echo "Service '$SERVICE' is not running."
        else
            echo "Attaching to $SERVICE..."
            docker exec -it "$CONTAINER" bash
        fi
        break
    else
        echo "Invalid selection."
    fi
done
