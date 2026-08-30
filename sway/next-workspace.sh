#! /usr/bin/env sh

swaymsg workspace number $((
    1 + $(
        swaymsg -pt get_workspaces |
        grep -Po '(?<=Workspace )[0-9]+' |
        tail -1
    )
))
