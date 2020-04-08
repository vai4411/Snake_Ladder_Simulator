
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

function roll_Dice() {
	flip=$((RANDOM % 6 + 1))
	option=$((RANDOM % 3))
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
	done
}

board
echo $position_of_player1
