#!/bin/bash -x

isHead=1
randomCheck=$((RANDOM%2))
if [ $randomCheck -eq $isHead ]
then
	echo "Heads"
else
	echo "Tails"
fi
