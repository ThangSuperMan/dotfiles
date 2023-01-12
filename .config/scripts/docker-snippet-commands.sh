#!/bin/bash

docker_ps=$(docker ps -q)
echo "docker_ps -q: $(docker_ps)"
# Commands
commands=("docker kill '$(docker_ps)'" "docker ps" "docker ps -a")

# commands=commands | tr ' ' '\n'

echo $commands

# selected=$(printf '%s' "$userful_commands" | fzf) 

# echo "selected: $selected"
