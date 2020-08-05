#!/bin/bash -x

#Flip a coin till either Heads or Tails won 21 times
function flipACoin(){
	#Variables
	headCount=0
	tailCount=0

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

#To check Tie and continues till minimum difference of 2 is achieved
function checkTie(){
	difference=$1
	while [ $difference -lt 2 ]
	do
		echo -e "Game is continuing till minimum difference of 2 times...\n"
		flipACoin
		winningresults
	done
}

#To check the Winning or Tie status
function winningresults(){
	echo "Head: $headCount times"
	echo "Tail: $tailCount times"
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
		difference="$( calculateDifference $headCount $tailCount )"
		checkTie $difference
	fi
}

#To perform flipcoin simulation
function flipCoinSimulation(){
	flipACoin
	winningresults
}

#Main
flipCoinSimulation
