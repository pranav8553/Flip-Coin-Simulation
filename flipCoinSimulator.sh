#!/bin/bash -x

#Variables
headCount=0
tailCount=0

#Flip a coin till either Heads or Tails won 21 times
function flipACoin(){
	while [ $headCount -lt 21 ] || [ $tailCount -lt 21 ]
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
}

#Calculate difference of times
function calculateDifference(){
	winner=$1
	loser=$2
	diff=$(($winner - $loser))
	echo $diff
}

#To show the winning status
function winningResults(){
	if [ $headCount -gt $tailCount ]
	then
		difference="$( calculateDifference $headCount $tailCount )"
		echo "HEADS Won by $difference times!"
	elif [ $tailCount -gt $headCount ]
	then
		difference="$( calculateDifference $tailCount $headCount )"
		echo "TAILS Won by $difference times!"
	else
		echo "Its a Tie!"
	fi
	echo "Head: $headCount times"
	echo "Tail: $tailCount times"
}

#Main
flipACoin
winningResults

