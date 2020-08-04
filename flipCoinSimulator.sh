#!/bin/bash -x

#Variables
headCount=0
tailCount=0

function flipACoin(){
	for (( flip=1; flip<=$times; flip++ ))
	do
		isHead=1
		randomCheck=$((RANDOM%2))
		if [ $randomCheck -eq $isHead ]
		then
			((headCount++))
		else
			((tailCount++))
		fi
	done
	echo "Head: $headCount times"
	echo "Tail: $tailCount times"
}

read -p "Enter a number of times you want to flip a coin: " times
flipACoin $times
