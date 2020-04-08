
#!/bin/bash -x

echo "Welcome to Snake Ladder Simulator"

#Constant
INITIAL_POSITION=0
FINAL_POSITION=100
NO_PLAY=0
SNAKE=1
LADDER=2

#Variable
position_of_player=$INITIAL_POSITION
flip=0
option=0
number_of_dice_roll=0
player1=0
player2=0
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
			position_of_player=$(($position_of_player - $flip))
			;;
		$LADDER)
			position_of_player=$(($position_of_player + $flip))
			;;
		*)
			position_of_player=$position_of_player
         ;;
		esac
}

function board() {
	while [ $position_of_player -ne $FINAL_POSITION ] || [ $position_of_player -gt $FINAL_POSITION ]
	do
		check_Option 
		if [ $position_of_player -lt $INITIAL_POSITION ]
		then
			position_of_player=$INITIAL_POSITION
			elif [ $position_of_player -gt $FINAL_POSITION ]
				then
					position_of_player=$(($position_of_player - $flip))
				fi
				arr[$count]=$position_of_player
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
player1=$number_of_dice_roll
position_of_player
player2=$number_of_dice_roll
if [ $player1 -gt $player2 ]
then
	echo "Player1 wins..."
else
	echo "Player2 wins..."
fi
