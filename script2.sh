#!/bin/bash

if [ "$1" == "" ]; then
	echo "WTF" 1>&2
fi

command="$1"

var="$(cat ~/.bash_history | grep -Ec "^$1")"

echo "$var"
