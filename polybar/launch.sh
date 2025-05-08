#!/usr/bin/bash
# Kill instances of polybar and wait before executing a new instance
pkill -x polybar

while pgrp -x polybar >/dev/null; do sleep 0.1; done

polybar -c ~/.config/polybar/config.ini main &
