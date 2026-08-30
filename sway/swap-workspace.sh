#! /usr/bin/env sh

# get workspace number
current=$(swaymsg -pt get_workspaces | grep -Po '[0-9]+(?= \(focused\))')

case "$1" in
    right) next=$((current + 1)) ;;
    left) [ $current -gt 0 ] && next=$((current - 1)) ;;
    *) exit 1 ;;
esac

swaymsg rename workspace $current to temp
swaymsg rename workspace $next to $current
swaymsg rename workspace temp to $next
