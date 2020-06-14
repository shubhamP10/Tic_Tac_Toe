#! /bin/bash

echo "Welcome To Tic Tac Toe Simulation";
echo "";

# CONSTANTS
PLAYER=0;
SYMBOL1='X';
SYMBOL2='O';

# VARIABLES
turnCount=0;
i=2;
choice=0;

#ARRAY
declare -a BOARD;
BOARD=(1 2 3 4 5 6 7 8 9); 

#this function will print the board after each turn
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

#this function will check for all winning Combinations
# returns 1 if true
# returns 2 if false
# returns 0 if board is Full
function checkWin()
{
	if [[ ${BOARD[0]} == ${BOARD[1]} && ${BOARD[1]} == ${BOARD[2]} ]]; #if position 1=2=3
	then
		return 1;
	elif [[ ${BOARD[3]} == ${BOARD[4]} && ${BOARD[4]} == ${BOARD[5]} ]]; #if position 4=5=6
	then
		return 1;
	elif [[ ${BOARD[6]} == ${BOARD[7]} && ${BOARD[7]} == ${BOARD[8]} ]]; #if position 7=8=9
	then
		return 1;
	elif [[ ${BOARD[0]} == ${BOARD[3]} && ${BOARD[3]} == ${BOARD[6]} ]]; #if position 1=4=7
	then
		return 1;
	elif [[ ${BOARD[1]} == ${BOARD[4]} && ${BOARD[4]} == ${BOARD[7]} ]]; #if position 2=5=8
	then
		return 1;
	elif [[ ${BOARD[2]} == ${BOARD[5]} && ${BOARD[5]} == ${BOARD[8]} ]]; #if position 3=6=9
	then
		return 1;
	elif [[ ${BOARD[0]} == ${BOARD[4]} && ${BOARD[4]} == ${BOARD[8]} ]]; #if position 1=5=9
	then
		return 1;
	elif [[ ${BOARD[2]} == ${BOARD[4]} && ${BOARD[4]} == ${BOARD[6]} ]]; #if position 3=5=7
	then
		return 1;
	elif [[ ${BOARD[0]} != 1 && ${BOARD[1]} != 2 && ${BOARD[2]} != 3 && ${BOARD[3]} != 4 && ${BOARD[4]} != 5 && ${BOARD[5]} != 6 && ${BOARD[6]} != 7 && ${BOARD[7]} != 8 && ${BOARD[8]} != 9 ]]; 
	then
		return 0; #if board is full
	else
		return 2; #if winning combinations not found
	fi
}

#Computer Will Make First Move at the corners
function makeFirstMove()
{
	cchoice=$(((RANDOM%9)+1));
	local placed=0;
	while [[ $placed == 0 ]]; 
	do
		if [[ $cchoice == 1 && ${BOARD[0]} == 1 ]]; 
		then
			BOARD[0]=$ComputerSymbol;
			placed=1;
		elif [[ $cchoice == 3 && ${BOARD[2]} == 3 ]]; 
		then
			BOARD[2]=$ComputerSymbol;
			placed=1;
		elif [[ $cchoice == 7 && ${BOARD[6]} == 7 ]]; 
		then
			BOARD[6]=$ComputerSymbol;
			placed=1;
		elif [[ $cchoice == 9 && ${BOARD[8]} == 9 ]]; 
		then
			BOARD[8]=$ComputerSymbol;
			placed=1;
		else
			cchoice=$(((RANDOM%9)+1));
		fi
	done
}

#Computer will make center Move if corners are not found
function makeCenterMove()
{
	cchoice=$(((RANDOM%9)+1));
	local placed=0;
	while [[ $placed == 0 ]]; 
	do
		if [[ $cchoice == 2 && ${BOARD[1]} == 2 ]]; 
		then
			BOARD[1]=$ComputerSymbol;
			placed=1;
		elif [[ $cchoice == 4 && ${BOARD[3]} == 4 ]]; 
		then
			BOARD[3]=$ComputerSymbol;
			placed=1;
		elif [[ $cchoice == 5 && ${BOARD[4]} == 5 ]]; 
		then
			BOARD[4]=$ComputerSymbol;
			placed=1;
		elif [[ $cchoice == 6 && ${BOARD[5]} == 6 ]]; 
		then
			BOARD[5]=$ComputerSymbol;
			placed=1;
		elif [[ $cchoice == 8 && ${BOARD[7]} == 8 ]]; 
		then
			BOARD[7]=$ComputerSymbol;
			placed=1;
		else
			cchoice=$(((RANDOM%9)+1));
		fi
	done
}

#Computer Will Play Winning move by checking the combinations 
# if true
# 	returns 1
# if false
#	returns 0
playWinningMove()
{
	if [[ ${BOARD[1]} == $ComputerSymbol && ${BOARD[2]} == $ComputerSymbol || ${BOARD[3]} == $ComputerSymbol && ${BOARD[6]} == $ComputerSymbol || ${BOARD[4]} == $ComputerSymbol && ${BOARD[8]} == $ComputerSymbol ]];    
	then	
		if [[ ${BOARD[0]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    																   																    
		BOARD[0]=$ComputerSymbol;
		return 1;
	elif [[ ${BOARD[0]} == $ComputerSymbol && ${BOARD[2]} == $ComputerSymbol || ${BOARD[7]} == $ComputerSymbol && ${BOARD[4]} == $ComputerSymbol ]];
	then
		if [[ ${BOARD[1]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    	
			
		BOARD[1]=$ComputerSymbol;
		return 1;
	elif [[ ${BOARD[0]} == $ComputerSymbol && ${BOARD[1]} == $ComputerSymbol || ${BOARD[5]} == $ComputerSymbol && ${BOARD[8]} == $ComputerSymbol || ${BOARD[6]} == $ComputerSymbol && ${BOARD[4]} == $ComputerSymbol ]];    
	then
		if [[ ${BOARD[2]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    	
																			   																    
		BOARD[2]=$ComputerSymbol;
		return 1;
	elif [[ ${BOARD[0]} == $ComputerSymbol && ${BOARD[6]} == $ComputerSymbol || ${BOARD[4]} == $ComputerSymbol && ${BOARD[5]} == $ComputerSymbol ]]; 
	then
		if [[ ${BOARD[3]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    	
			
		BOARD[3]=$ComputerSymbol;
		return 1;
	elif [[ ${BOARD[3]} == $ComputerSymbol && ${BOARD[5]} == $ComputerSymbol || ${BOARD[1]} == $ComputerSymbol && ${BOARD[7]} == $ComputerSymbol || ${BOARD[0]} == $ComputerSymbol && ${BOARD[8]} == $ComputerSymbol || ${BOARD[2]} == $ComputerSymbol && ${BOARD[6]} == $ComputerSymbol ]]; 
	then
		if [[ ${BOARD[4]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    	
			
		BOARD[4]=$ComputerSymbol;
		return 1;
	elif [[ ${BOARD[3]} == $ComputerSymbol && ${BOARD[4]} == $ComputerSymbol || ${BOARD[2]} == $ComputerSymbol && ${BOARD[2]} == $ComputerSymbol ]]; 
	then
		if [[ ${BOARD[5]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    	
			
		BOARD[5]=$ComputerSymbol;
		return 1;
	elif [[ ${BOARD[0]} == $ComputerSymbol && ${BOARD[3]} == $ComputerSymbol || ${BOARD[2]} == $ComputerSymbol && ${BOARD[4]} == $ComputerSymbol || ${BOARD[7]} == $ComputerSymbol && ${BOARD[8]} == $ComputerSymbol || ${BOARD[4]} == $ComputerSymbol && ${BOARD[2]} == $ComputerSymbol ]]; 
	then
		if [[ ${BOARD[6]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    	
			
		BOARD[6]=$ComputerSymbol;
		return 1;
	elif [[ ${BOARD[1]} == $ComputerSymbol && ${BOARD[4]} == $ComputerSymbol || ${BOARD[6]} == $ComputerSymbol && ${BOARD[8]} == $ComputerSymbol ]]; 
	then
		if [[ ${BOARD[7]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    	
			
		BOARD[7]=$ComputerSymbol;
		return 1;
	elif [[ ${BOARD[2]} == $ComputerSymbol && ${BOARD[5]} == $ComputerSymbol || ${BOARD[0]} == $ComputerSymbol && ${BOARD[4]} == $ComputerSymbol || ${BOARD[6]} == $ComputerSymbol && ${BOARD[7]} == $ComputerSymbol ]]; 
	then
		if [[ ${BOARD[8]} == $playerSymbol ]]; 
		then
			return 0;
		fi															   																    	
			
		BOARD[8]=$ComputerSymbol;
		return 1;
	else
		return 0;
	fi
}

#Computer Will Block the user after checking for winning move
function blockUser()
{
	local placed=0;
	if [[ $turnCount > 2 ]]; then
		playWinningMove 
		placed=($?); #recieves 0 if not won else 1 if won
	fi
	
	#if won exit from the function
	if [[ $placed == 1 ]]; then
		return
	elif [[ $placed == 0 ]]; then
		if [[ ${BOARD[2]} == $playerSymbol && ${BOARD[1]} == $playerSymbol || ${BOARD[6]} == $playerSymbol && ${BOARD[3]} == $playerSymbol || ${BOARD[8]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]];    
		then
			if [[ ${BOARD[0]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																   																    	
			fi															   																    
			BOARD[0]=$ComputerSymbol;
		elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[2]} == $playerSymbol || ${BOARD[7]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]]; #selecting Centers starts here..
		then
			if [[ ${BOARD[1]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																		   																    	
			fi	
			BOARD[1]=$ComputerSymbol;
		elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[1]} == $playerSymbol || ${BOARD[8]} == $playerSymbol && ${BOARD[5]} == $playerSymbol || ${BOARD[6]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]];    
		then
			if [[ ${BOARD[2]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																	   																    	
			fi	

			BOARD[2]=$ComputerSymbol;
		elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[6]} == $playerSymbol || ${BOARD[5]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]]; 
		then
			if [[ ${BOARD[3]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																	   																    	
			fi	
			BOARD[3]=$ComputerSymbol;
		elif [[ ${BOARD[3]} == $playerSymbol && ${BOARD[5]} == $playerSymbol || ${BOARD[1]} == $playerSymbol && ${BOARD[7]} == $playerSymbol || ${BOARD[0]} == $playerSymbol && ${BOARD[8]} == $playerSymbol || ${BOARD[2]} == $playerSymbol && ${BOARD[6]} == $playerSymbol ]]; 
		then
			if [[ ${BOARD[4]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																		   																    	
			fi	
			BOARD[4]=$ComputerSymbol;
		elif [[ ${BOARD[3]} == $playerSymbol && ${BOARD[4]} == $playerSymbol || ${BOARD[2]} == $playerSymbol && ${BOARD[8]} == $playerSymbol ]]; 
		then
			if [[ ${BOARD[5]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																	   																    	
			fi	
			BOARD[5]=$ComputerSymbol;
		elif [[ ${BOARD[0]} == $playerSymbol && ${BOARD[3]} == $playerSymbol || ${BOARD[2]} == $playerSymbol && ${BOARD[4]} == $playerSymbol || ${BOARD[8]} == $playerSymbol && ${BOARD[7]} == $playerSymbol || ${BOARD[2]} == $playerSymbol && ${BOARD[4]} == $playerSymbol ]]; 
		then
			if [[ ${BOARD[6]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																		   																    	
			fi	
			BOARD[6]=$ComputerSymbol;
		elif [[ ${BOARD[1]} == $playerSymbol && ${BOARD[4]} == $playerSymbol || ${BOARD[6]} == $playerSymbol && ${BOARD[8]} == $playerSymbol ]]; 
		then
			if [[ ${BOARD[7]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																	   																    	
			fi	
			BOARD[7]=$ComputerSymbol;
		elif [[ ${BOARD[2]} == $playerSymbol && ${BOARD[5]} == $playerSymbol || ${BOARD[0]} == $playerSymbol && ${BOARD[4]} == $playerSymbol || ${BOARD[6]} == $playerSymbol && ${BOARD[7]} == $playerSymbol ]]; 
		then
			if [[ ${BOARD[8]} == $computerSymbol ]]; 
			then
				if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
					then
					makeFirstMove	#if there corner is available
					else
					makeCenterMove	#if there is no corners available														   																    	
				fi																	   																    	
			fi	
			BOARD[8]=$ComputerSymbol;
		else
			if [[ ${BOARD[0]} == 1 || ${BOARD[2]} == 3 || ${BOARD[6]} == 7 || ${BOARD[8]} == 9 ]]; 
			then
				makeFirstMove	#if there corner is available
			else
				makeCenterMove	#if there is no corners available														   																    	
			fi	
			  
		fi
	fi
}

#this function will plays the game for both user and computer based on the player's turn
function playTurn()
{
	if [[ $1 == 1 ]]; #player's Turn
	then
		echo "Your Turn";

		echo "Your Symbol is :"$playerSymbol; #displaying player's symbol

		read -p "Enter Cell Number to Mark yor Symbol: " choice; #getting user's choice to mark on board
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
		checkWin #calling to check if won or not
		i=($?); #recieves 1 if won, 2 if not won, 0 if board is full
		PLAYER=$((PLAYER+1));


	elif [[ $1 == 2 ]]; #computer's Turn
	then
		turnCount=$((turnCount+1)); 
		echo "Computer's Turn";
		
		if [[ $turnCount > 1 ]]; 
		then
			blockUser
		else
			makeFirstMove
		fi
		
		checkWin #calling to check is won or not
		i=($?); #recieves 1 if won, 2 if not won, 0 if board is full
		PLAYER=$((PLAYER+1));
	fi
}

#this function will plays the game and decides WIN, LOST and TIE
function play()
{
	while [[ $i == 2 ]]; 
	do
		if [[ $((PLAYER%2)) == 1 ]];
		then
			PLAYER=1;
		else
			PLAYER=2;
		fi
		playTurn $PLAYER;
		printBoard ${BOARD[@]};
	done

	#if checkWin function returns 1
	if [[ $i == 1 ]]; 
	then
		printBoard ${BOARD[@]};
		if [[ $PLAYER == 2 ]]; 
		then
			echo "Congrats!!!! You Won the Game";

		else
			echo "Computer Won";
		fi
	else
		echo "OOPS Game Draw";
	fi
}

# ************* MAIN PART *******************#
		#Game Starts With the Toss#
		 #Decides Who Plays First#
		 #Prins the Initial Board#

TOSS=$((RANDOM%2));
OPTION=0;
playerSymbol='';
ComputerSymbol='';
case $TOSS in
	0 )
		echo "You Won the Toss !!! ";
		echo "Choose Your Symbol..";
		read -p "press 1 for O, 2 for X." OPTION
		if [[ $OPTION == 1 ]]; 
		then
			playerSymbol=$SYMBOL2;
			ComputerSymbol=$SYMBOL1;
		elif [[ $OPTION == 2 ]]; 
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
		if [[ $OPTION == 1 ]]; 
		then
			ComputerSymbol=$SYMBOL2;
			playerSymbol=$SYMBOL1;
		elif [[ $OPTION == 2 ]]; 
		then
			ComputerSymbol=$SYMBOL1;
			playerSymbol=$SYMBOL2;
		fi
		echo "Computer Symbol is : "$ComputerSymbol;
		PLAYER=2;
		;;
esac
play  #calling play function