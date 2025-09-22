#!/bin/bash

shopt -s nullglob

read_keylock() {
    local glob=$1
    local matches=(/sys/class/leds/$glob/brightness)
    if [[ ${#matches[@]} -gt 0 && -f "${matches[0]}" ]]; then
        tr -d '[:space:]' < "${matches[0]}"
    else
        echo 0
    fi
}

CAPS=$(read_keylock "*capslock")
SCROLL=$(read_keylock "*scrolllock")
NUM=$(read_keylock "*numlock")

capslock=false
scrolllock=false
numlock=false

[[ "$CAPS" -eq 1 ]] && capslock=true
[[ "$SCROLL" -eq 1 ]] && scrolllock=true
[[ "$NUM" -eq 1 ]] && numlock=true

echo "{\"capslock\":$capslock,\"scrolllock\":$scrolllock,\"numlock\":$numlock}"
