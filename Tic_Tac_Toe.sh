#! /bin/bash
echo "Welcome To Tic Tac Toe Simulation";
echo "";

# CONSTANTS
PLAYER=0;
SYMBOL1='X';
SYMBOL2='O';

# VARIABLES
playerSymbol='';
ComputerSymbol='';
i=-1;
choice=0;
#ARRAY
declare -a BOARD;
BOARD=(1 2 3 4 5 6 7 8 9); 

function printBoard()
{
	b=("$@");
	echo "";
	echo "	  ${b[0]} | ${b[1]} | ${b[2]} ";
	echo "	-------------";
	echo "	  ${b[3]} | ${b[4]} | ${b[5]}  ";
	echo "	-------------";
	echo "	  ${b[6]} | ${b[7]} | ${b[8]}  ";
	echo "";
	
}

function playTurn()
{
	if [[ $1 -eq 1 ]];
	then
		echo "Your Turn";
		read -p "Enter Cell Number to Mark yor Symbol: " choice;
		if [[ $choice -eq 1 && ${BOARD[0]} -eq 1 ]]; 
		then
			BOARD[0]=$playerSymbol;
		elif [[ $choice -eq 2 && ${BOARD[1]} -eq 2 ]]; 
		then
			BOARD[1]=$playerSymbol;
		elif [[ $choice -eq 3 && ${BOARD[2]} -eq 3 ]]; 
		then
			BOARD[2]=$playerSymbol;
		elif [[ $choice -eq 4 && ${BOARD[3]} -eq 4 ]]; 
		then
			BOARD[3]=$playerSymbol;
		elif [[ $choice -eq 5 && ${BOARD[4]} -eq 5 ]]; 
		then
			BOARD[4]=$playerSymbol;
		elif [[ $choice -eq 6 && ${BOARD[5]} -eq 6 ]]; 
		then
			BOARD[5]=$playerSymbol;
		elif [[ $choice -eq 7 && ${BOARD[6]} -eq 7 ]]; 
		then
			BOARD[6]=$playerSymbol;
		elif [[ $choice -eq 8 && ${BOARD[7]} -eq 2 ]]; 
		then
			BOARD[7]=$playerSymbol;
		elif [[ $choice -eq 9 && ${BOARD[8]} -eq 9 ]]; 
		then
			BOARD[8]=$playerSymbol;
		fi
		PLAYER=$((PLAYER+1));
	elif [[ $1 -eq 2 ]]; 
	then
		echo "Computer's Turn";
		PLAYER=$((PLAYER+1));
	fi
}

function play()
{
	while [[ $i -eq -1 ]]; 
	do
		printBoard ${BOARD[@]};
		if [[ $((PLAYER%2)) -eq 1 ]];
		then
			PLAYER=1;
		else
			PLAYER=2;
		fi
		playTurn $PLAYER;
		printBoard ${BOARD[@]};
		break;
	done
}

TOSS=$((RANDOM%2));
OPTION=0;
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
		PLAYER=1;
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
		PLAYER=2;
		;;
esac
play