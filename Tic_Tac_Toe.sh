#! /bin/bash
echo "Welcome To Tic Tac Toe Simulation";
echo "";
# CONSTANTS
PLAYER=1;
SYMBOL1='X';
SYMBOL2='O';

# VARIABLES
playerSymbol='';
ComputerSymbol='';

function play()
{
	local TOSS=$((RANDOM%2));
	local OPTION=0;
	case $TOSS in
		0 )
			echo "You Won the Toss !!! ";
			echo "Choose Your Symbol..";
			read -p "press 1 for O, 2 for X." OPTION
			if [[ $OPTION -eq 1 ]]; 
			then
				playerSymbol=$SYMBOL2;
			elif [[ $OPTION -eq 2 ]]; 
			then
				playerSymbol=$SYMBOL1;
			fi
			echo "Your Symbol is : "$playerSymbol;
			;;
		1 )
			echo "Computer Won the Toss !!!";
			OPTION=$(((RANDOM%2)+1));
			if [[ $OPTION -eq 1 ]]; 
			then
				ComputerSymbol=$SYMBOL2;
			elif [[ $OPTION -eq 2 ]]; 
			then
				ComputerSymbol=$SYMBOL1;
			fi
			echo "Computer Symbol is : "$ComputerSymbol;
			;;
	esac
}
play 
#Resetting The Board
echo "";
echo "	  1 | 2 | 3 ";
echo "	-------------";
echo "	  4 | 5 | 6  ";
echo "	-------------";
echo "	  7 | 8 | 9  ";
echo "";
echo "Choose Cell From 1 to 9 :";