#! /bin/bash -x
echo "Welcome To Tic Tac Toe Simulation";
echo "";

# CONSTANTS
PLAYER=0;
SYMBOL1='X';
SYMBOL2='O';

# VARIABLES
turnCount=0;
i=255;
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

function checkWin()
{
	if [[ ${BOARD[0]} == ${BOARD[1]} && ${BOARD[1]} == ${BOARD[2]} ]]; 
	then
		return 1;
	elif [[ ${BOARD[3]} == ${BOARD[4]} && ${BOARD[4]} == ${BOARD[5]} ]]; 
	then
		return 1;
	elif [[ ${BOARD[6]} == ${BOARD[7]} && ${BOARD[7]} == ${BOARD[8]} ]]; 
	then
		return 1;
	elif [[ ${BOARD[0]} == ${BOARD[3]} && ${BOARD[3]} == ${BOARD[6]} ]]; 
	then
		return 1;
	elif [[ ${BOARD[1]} == ${BOARD[4]} && ${BOARD[4]} == ${BOARD[7]} ]]; 
	then
		return 1;
	elif [[ ${BOARD[2]} == ${BOARD[5]} && ${BOARD[5]} == ${BOARD[8]} ]]; 
	then
		return 1;
	elif [[ ${BOARD[0]} == ${BOARD[4]} && ${BOARD[4]} == ${BOARD[8]} ]]; 
	then
		return 1;
	elif [[ ${BOARD[2]} == ${BOARD[4]} && ${BOARD[4]} == ${BOARD[6]} ]]; 
	then
		return 1;
	elif [[ ${BOARD[0]} -ne 1 && ${BOARD[1]} -ne 2 && ${BOARD[2]} -ne 3 && ${BOARD[3]} -ne 4 && ${BOARD[4]} -ne 5 && ${BOARD[5]} -ne 6 && ${BOARD[6]} -ne 7 && ${BOARD[7]} -ne 8 && ${BOARD[8]} -ne 9 ]]; 
	then
		return 0;
	else
		return -1;
	fi
}

#Computer Will Make First Move
function makeFirstMove()
{
	cchoice=$(((RANDOM%9)+1));
	local placed=0;
	while [[ $placed -eq 0 ]]; 
			do
				if [[ $cchoice -eq 1 && ${BOARD[0]} -eq 1 ]]; 
				then
					BOARD[0]=$ComputerSymbol;
					placed=1;
				elif [[ $cchoice -eq 2 && ${BOARD[1]} -eq 2 ]]; 
				then
					BOARD[1]=$ComputerSymbol;
					placed=1;
				elif [[ $cchoice -eq 3 && ${BOARD[2]} -eq 3 ]]; 
				then
					BOARD[2]=$ComputerSymbol;
					placed=1;
				elif [[ $cchoice -eq 4 && ${BOARD[3]} -eq 4 ]]; 
				then
					BOARD[3]=$ComputerSymbol;
					placed=1;
				elif [[ $cchoice -eq 5 && ${BOARD[4]} -eq 5 ]]; 
				then
					BOARD[4]=$ComputerSymbol;
					placed=1;
				elif [[ $cchoice -eq 6 && ${BOARD[5]} -eq 6 ]]; 
				then
					BOARD[5]=$ComputerSymbol;
					placed=1;
				elif [[ $cchoice -eq 7 && ${BOARD[6]} -eq 7 ]]; 
				then
					BOARD[6]=$ComputerSymbol;
					placed=1;
				elif [[ $cchoice -eq 8 && ${BOARD[7]} -eq 8 ]]; 
				then
					BOARD[7]=$ComputerSymbol;
					placed=1;
				elif [[ $cchoice -eq 9 && ${BOARD[8]} -eq 9 ]]; 
				then
					BOARD[8]=$ComputerSymbol;
					placed=1;
				else
					cchoice=$(((RANDOM%9)+1));
				fi
			done
}

#Computer Will Block the user to win at its 2nd or 3rd turn
function blockUser()
{
	if [[ ${BOARD[0]} == $playerSymbol && ${BOARD[1]} == $playerSymbol || ${BOARD[0]} == $ComputerSymbol && ${BOARD[1]} == $ComputerSymbol ]]; #if user marked 1 and 2    
	then																   #then 3rd cell will blocked   
		BOARD[2]=$ComputerSymbol;
	elif [[ ${BOARD[3]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]]; 
	then
		BOARD[5]=$ComputerSymbol;
	elif [[ ${BOARD[6]} == $playerSymbol && ${BOARD[7]} == $playerSymbol || ${BOARD[6]} == $ComputerSymbol && ${BOARD[7]} == $ComputerSymbol ]]; 
	then
		BOARD[8]=$ComputerSymbol;
	elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[3]} == $playerSymbol || ${BOARD[0]} == $ComputerSymbol && ${BOARD[3]} == $ComputerSymbol ]]; 
	then
		BOARD[6]=$ComputerSymbol;
	elif [[ ${BOARD[1]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]]; 
	then
		BOARD[7]=$ComputerSymbol;
	elif [[ ${BOARD[2]} == $playerSymbol && ${BOARD[5]} == $playerSymbol || ${BOARD[2]} == $ComputerSymbol && ${BOARD[5]} == $ComputerSymbol ]]; 
	then
		BOARD[8]=$ComputerSymbol;
	elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]]; 
	then
		BOARD[8]=$ComputerSymbol;
	elif [[ ${BOARD[2]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]]; 
	then
		BOARD[6]=$ComputerSymbol;
	elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[2]} == $playerSymbol ]]; 
	then
		BOARD[1]=$ComputerSymbol;
	elif [[ ${BOARD[3]} == $playerSymbol && ${BOARD[5]} == $playerSymbol ]]; 
	then
		BOARD[4]=$ComputerSymbol;
	elif [[ ${BOARD[6]} == $playerSymbol && ${BOARD[8]} == $playerSymbol ]]; 
	then
		BOARD[7]=$ComputerSymbol;
	elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[6]} == $playerSymbol ]]; 
	then
		BOARD[3]=$ComputerSymbol;
	elif [[ ${BOARD[1]} == $playerSymbol && ${BOARD[7]} == $playerSymbol ]]; 
	then
		BOARD[4]=$ComputerSymbol;
	elif [[ ${BOARD[2]} == $playerSymbol && ${BOARD[8]} == $playerSymbol ]]; 
	then
		BOARD[5]=$ComputerSymbol;
	elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[8]} == $playerSymbol ]]; 
	then
		BOARD[4]=$ComputerSymbol;
	elif [[ ${BOARD[2]} == $playerSymbol && ${BOARD[6]} == $playerSymbol ]]; 
	then
		BOARD[4]=$ComputerSymbol;
	else
		makeFirstMove
	fi
}

function playTurn()
{
	if [[ $1 -eq 1 ]];
	then
		echo "Your Turn";

		echo "Your Symbol is :"$playerSymbol;

		read -p "Enter Cell Number to Mark yor Symbol: " choice;
		if [[ $choice == 1 && ${BOARD[0]} == 1 ]]; 
		then
			BOARD[0]=$playerSymbol;
		elif [[ $choice == 2 && ${BOARD[1]} == 2 ]]; 
		then
			BOARD[1]=$playerSymbol;
		elif [[ $choice == 3 && ${BOARD[2]} == 3 ]]; 
		then
			BOARD[2]=$playerSymbol;
		elif [[ $choice == 4 && ${BOARD[3]} == 4 ]]; 
		then
			BOARD[3]=$playerSymbol;
		elif [[ $choice == 5 && ${BOARD[4]} == 5 ]]; 
		then
			BOARD[4]=$playerSymbol;
		elif [[ $choice == 6 && ${BOARD[5]} == 6 ]]; 
		then
			BOARD[5]=$playerSymbol;
		elif [[ $choice == 7 && ${BOARD[6]} == 7 ]]; 
		then
			BOARD[6]=$playerSymbol;
		elif [[ $choice == 8 && ${BOARD[7]} == 8 ]]; 
		then
			BOARD[7]=$playerSymbol;
		elif [[ $choice == 9 && ${BOARD[8]} == 9 ]]; 
		then
			BOARD[8]=$playerSymbol;
		else
			echo "Invalid Move";
			PLAYER=$((PLAYER-1));

		fi
		checkWin
		i=($?);
		PLAYER=$((PLAYER+1));


	elif [[ $1 -eq 2 ]]; 
	then
		turnCount=$((turnCount+1));
		echo "Computer's Turn";
		
		if [[ $turnCount == 2 || $turnCount == 3 || $turnCount == 4 ]]; #in 2nd or 3rd or 4th turn Computer will call blockuser function 
		then
			blockUser
		else
			makeFirstMove
		fi
		
		checkWin
		i=($?);
		PLAYER=$((PLAYER+1));
	fi
}

function play()
{
	while [[ $i -eq 255 ]]; 
	do
		# printBoard ${BOARD[@]};
		if [[ $((PLAYER%2)) -eq 1 ]];
		then
			PLAYER=1;
		else
			PLAYER=2;
		fi
		playTurn $PLAYER;
		printBoard ${BOARD[@]};
		# break;
	done
	if [[ $i -eq 1 ]]; 
	then
		printBoard ${BOARD[@]};
		if [[ $PLAYER -eq 2 ]]; 
		then
			echo "Congrats!!!! You Won the Game";

		else
			echo "Computer Won";
		fi
	else
		echo "OOPS Game Draw";
	fi
}

TOSS=$((RANDOM%2));
OPTION=0;
playerSymbol='';
ComputerSymbol='';
case $TOSS in
	0 )
		echo "You Won the Toss !!! ";
		echo "Choose Your Symbol..";
		read -p "press 1 for O, 2 for X." OPTION
		if [[ $OPTION -eq 1 ]]; 
		then
			playerSymbol=$SYMBOL2;
			ComputerSymbol=$SYMBOL1;
		elif [[ $OPTION -eq 2 ]]; 
		then
			playerSymbol=$SYMBOL1;
			ComputerSymbol=$SYMBOL2;
		fi
		echo "Your Symbol is : "$playerSymbol;
		printBoard ${BOARD[@]};
		PLAYER=1;
		;;
	1 )
		echo "Computer Won the Toss !!!";
		OPTION=$(((RANDOM%2)+1));
		if [[ $OPTION -eq 1 ]]; 
		then
			ComputerSymbol=$SYMBOL2;
			playerSymbol=$SYMBOL1;
		elif [[ $OPTION -eq 2 ]]; 
		then
			ComputerSymbol=$SYMBOL1;
			playerSymbol=$SYMBOL2;
		fi
		echo "Computer Symbol is : "$ComputerSymbol;
		PLAYER=2;
		;;
esac
play