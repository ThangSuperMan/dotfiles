#!/bin/bash
languages=$(echo "golang lua cpp c typescript nodejs" | tr ' ' '\n')
core_utils=$(echo "xargs find mv sed awk" | tr ' ' '\n')

# echo "$languages $core_utils"

# printf "$languages\n$core_utils" 

selected=$(printf '%s\n%s' "$languages" "$core_utils" | fzf) 

# Read the input from the user
read -p "query: " query  

echo "query: $query"
echo "selected: $selected"

if printf $languages | grep -qs $selected; then
  echo "languages"
else
  echo "coreutils"
fi
