
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
