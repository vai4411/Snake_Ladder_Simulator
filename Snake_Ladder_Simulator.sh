
#!/bin/bash -x
echo "Welcome to Snake Ladder Simulator"

#Constant
initialPosition=0
finalPosition=100
noPlay=0
snake=1
ladder=2

#Variable
positionOfPlayer=$initialPosition
flip=0
option=0
numberOfDiceRoll=0
count=0
player1=0
player2=0
turn=0

declare -a arr

function rollDice() {
	flip=$((RANDOM % 6 + 1))
	option=$((RANDOM % 3))
	numberOfDiceRoll=$(($numberOfDiceRoll + 1))
}

function checkOption() {
	rollDice
	case $option in
		$snake)
			positionOfPlayer=$(($positionOfPlayer - $flip))
			;;
		$ladder)
			positionOfPlayer=$(($positionOfPlayer + $flip))
			;;
		*)
			positionOfPlayer=$positionOfPlayer
			;;
	esac
}

function playingBord() {
	checkOption
	if [ $positionOfPlayer -lt $initialPosition ]
	then
		positionOfPlayer=$initialPosition
	elif [ $positionOfPlayer -gt $finalPosition ]
	then
		positionOfPlayer=$(($positionOfPlayer - $flip))
	fi
	arr[$count]=$positionOfPlayer
	count=$(($count + 1))

}

function checkWin() {
	while [ $positionOfPlayer -ne $finalPosition ] || [ $positionOfPlayer -gt $finalPosition ]
	do
		if [ $turn -eq 0 ]
		then
			turn=1
			positionOfPlayer=$player1
			playingBord
			player1=$positionOfPlayer
		else
			turn=0
			positionOfPlayer=$player2
			playingBord
			player2=$positionOfPlayer
		fi
	done
	turn=0
}

function printPosition() {
	checkWin
	for ((position=0 ; position<$numberOfDiceRoll ; position++))
	do
		if [ $turn -eq 0 ]
		then
			turn=1
			echo "Turn $(($position + 1)) : Player1 : Position ${arr[$position]}"
		else
			turn=0
			echo "Turn $(($position + 1)) : Player2 : Position ${arr[$position]}"
		fi
	done
}

printPosition
if [ $player1 -gt $player2 ]
then
	echo "Player1 checkWins..."
else
	echo "Player2 checkWins..."
fi
