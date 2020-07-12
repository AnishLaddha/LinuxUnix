#!/bin/bash
echo  "\n COMMAND MENU\n"
echo " a. Current date and time"
echo " b. Users currently logged in"
echo " c. Name of the working directory"
echo  " d. Contents of the working directory\n"
read -p "Enter a, b, c, or d: " answer

if [ "$answer" = "a" ]; then
	date
elif [ "$answer" = "b" ]; then
	who
elif [ "$answer" = "c" ]; then
	pwd
elif [ "$answer" = "d" ]; then
	ls
else
	echo "There is no selection: $answer"
fi
