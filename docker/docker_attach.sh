#!/bin/bash

# Prompt user to select a service
echo "Select a service to attach to:"
select SERVICE in drone_control sheep_localisation simulation communications; do
    if [[ "$SERVICE" == "drone_control" || "$SERVICE" == "sheep_localisation"  || "$SERVICE" == "simulation" || "$SERVICE" == "communications" ]]; then
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
