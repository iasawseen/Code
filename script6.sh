#!/bin/bash
now=0
before=0

while true
do
	now="$(curl -s "https://api.vk.com/method/users.get?uids=sawseen&fields=online" | jq '(.response[0].online)')"
	if [ "$now" == "" ]; then
		echo "empty now"
		sleep 30
	else
		echo "now is OK"
		if (( "$before" ^ "$now" )); then 
			echo "we have different before and now"
			if [ $now -eq 0 ]; then 
				before=0
				echo "Ivan is off"
				echo "Ivan is offline" | wall
			else
				before=1
				echo "Ivan is on"
				echo "Ivan is online" | wall
			fi
			sleep 30
		else
			echo "before and now are identical"
			sleep 30
		fi
	fi
done
