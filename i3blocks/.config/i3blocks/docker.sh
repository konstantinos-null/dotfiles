#!/bin/bash

# Number of containers running
count=$(docker ps -q | wc -l | sed -r 's/^0$//g')
# Container ip
recent_ip=$(docker inspect -f "{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $(docker ps -ql))

echo "$LABEL$count: $recent_ip"
