#! /bin/bash
echo "Welcome To Tic Tac Toe Simulation";
echo "";
# CONSTANTS
PLAYER=1;
SYMBOL1='X';
SYMBOL2='O';

function play()
{
	local TOSS=$((RANDOM%2));
	case $TOSS in
		0 )
			echo "You Won the Toss !!! ";
			;;
		1 )
			echo "Computer Won the Toss !!!";
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