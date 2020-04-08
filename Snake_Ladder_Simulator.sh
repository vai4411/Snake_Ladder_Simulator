
#!/bin/bash -x

echo "Welcome to Snake Ladder Simulator"

#Constant
INITIAL_POSITION=0
FINAL_POSITION=100
NO_PLAY=0
SNAKE=1
LADDER=2

#Variable
position_of_player1=$INITIAL_POSITION
flip=0
option=0
number_of_dice_roll=0
count=0

declare -a arr

function roll_Dice() {
	flip=$((RANDOM % 6 + 1))
	option=$((RANDOM % 3))
	number_of_dice_roll=$(($number_of_dice_roll + 1))
}

function check_Option() {
	roll_Dice
	case $option in
		$SNAKE)
			position_of_player1=$(($position_of_player1 - $flip))
			;;
		$LADDER)
			position_of_player1=$(($position_of_player1 + $flip))
			;;
		*)
			position_of_player1=$position_of_player1
         ;;
		esac
}

function board() {
	while [ $position_of_player1 -ne $FINAL_POSITION ] || [ $position_of_player1 -gt $FINAL_POSITION ]
	do
		check_Option
		if [ $position_of_player1 -lt $INITIAL_POSITION ]
		then
			position_of_player1=$INITIAL_POSITION
			elif [ $position_of_player1 -gt $FINAL_POSITION ]
				then
					position_of_player1=$(($position_of_player1 - $flip))
				fi
				arr[$count]=$position_of_player1
				count=$(($count + 1))
	done
}

function position_of_player() {
	board
	for ((position=0 ; position<$number_of_dice_roll ; position++))
	do
		echo "Turn $(($position + 1)) : Position ${arr[$position]}"
	done
}
position_of_player
