#!/bin/bash
# ABOUTME: Runs the given command only when the system is on AC power.
# ABOUTME: Used as a conditional prefix in hypridle listeners.
[ "$(cat /sys/class/power_supply/AC/online)" = "1" ] && exec bash -c "$*"
