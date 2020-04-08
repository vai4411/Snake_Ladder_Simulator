
#!/bin/bash -x

echo "Welcome to Snake Ladder Simulator"

#Constant
INITIAL_POSITION=0
FINAL_POSITION=100

#Variable
position_of_player1=0
dice=0

function roll_Dice() {
	flip=$((RANDOM % 6 + 1))
	dice=$flip
}
roll_Dice
echo $dice
