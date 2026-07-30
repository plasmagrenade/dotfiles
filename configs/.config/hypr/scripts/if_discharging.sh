#!/bin/bash
# ABOUTME: Runs the given command only when the system is on battery power.
# ABOUTME: Used as a conditional prefix in hypridle listeners.
[ "$(cat /sys/class/power_supply/AC/online)" = "0" ] && exec bash -c "$*"
