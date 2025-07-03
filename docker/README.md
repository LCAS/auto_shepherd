# Docker

## How to Start

1. install docker and docker compose

2. cd to this directory `cd auto_shepherd/docker`

3. launch the containers with `./docker_start`

## How to Connect

Each container runs its own user area, connect to them directly using `./docker_attach`

This gives a choise of which to launch, select the number you wish.

# TMuLe

## How to Launch

Shortcuts have been setup for your convenience.

You can launch the internal system running sample data using: `tmule -c $INTERNAL launch`

You can launch the connected system using: `tmule -c $CONNECTED launch`

Respectively both commands have also been shortened to `int launch` and `con launch`

## How to Terminate

To terminate an active tmule run the command with the term `terminate` instead or `launch`.


# TMux

## How to Connect

TMuLE utilises TMux sessions to manage the ROS2 nodes in the background.

You can connect to the TMux session using: `tmux attach` or `t a`

## How to Navigate

To navigate TMux, you can use `Shift+[Left/Right]` to move between windows.

You can use `Alt+[Up/Down/Right/Left]` to move between panes within a window.

You can use `Ctrl+b, d` to exit the session.
