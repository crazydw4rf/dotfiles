#!/bin/sh
# Simple toggle script for PipeWire outputs

# list all sink names
SINKS=$(pactl list short sinks | awk '{print $2}')
[ -z "$SINKS" ] && exit 1

# current default sink
CUR=$(pactl info | awk '/Default Sink/ {print $3}')

# find next
NEXT=""
found=0
for s in $SINKS; do
  if [ $found -eq 1 ]; then
    NEXT=$s
    break
  fi
  [ "$s" = "$CUR" ] && found=1
done
# wrap to first if none left
[ -z "$NEXT" ] && NEXT=$(echo "$SINKS" | head -n1)

# set default
pactl set-default-sink "$NEXT"

# move playing streams
pactl list short sink-inputs | awk '{print $1}' | while read -r id; do
  pactl move-sink-input "$id" "$NEXT"
done

printf "Switched audio to: %s\n" "$NEXT"
