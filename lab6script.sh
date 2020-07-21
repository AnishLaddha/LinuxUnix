#!/bin/sh

echo "Enter contact file name: "
read BOOK
#this stuff above takes in the file name to weither create or where the current contacts are stored

show_menu()
##This function is very simple, just prints information for user
{
	echo "----------Address Book----------"
	echo "         1. List/Search"
	echo "             2. Add"
	echo "             3. Edit"
	echo "            4. Remove"
	echo "             5. Quit"
	echo "Enter your Selection -----------"
}
exec_menu()
#actual funtionality
{	
	#this variable is for taking in a value for the user (what they want to do)
	i = -1
	#this while loop keeps repeating unless someone terminates using 5
	while [ "$i" != "5" ]; do
		show_menu
		#shows menu, bottom reads userinput
		read i
		

		#simple case, self explanatory. 1 does list search, 2 does add, 3 does edit, 4 does Remove, 5 quits
	        #only 2 and 5 have functionality right now	
		case "$i" in
			"1")
				echo "List/Search functionality will go here"
				;;
			"2")
				#defined below
				add_new_entry				
				;;
			"3")
				echo "Edit functionality will go here"
				;;
			"4")
				echo "Removal functionality will go here"
				;;
			"5")
				echo "Thanks for using, quitting now!"
				exit 0
				;;
			*)
				#for everything not 1-5
				echo "unrecognized input, please input a a number from 1-5"
		esac
	done
}
add_new_entry()
{
	#tells user how to input
	echo "Enter the entry in the following way:"
	echo "FirstName,LastName,Address,City,State,Zip,Phone,Cell,Email,MethodOfContact"
	#gets user input
	read INFORMATION
	#appends to bottom of file
	echo "$INFORMATION" >> $BOOK
}
#if the user specified file does not exist, it creates it
if [ ! -f $BOOK ]; then
  echo "Creating $BOOK ..."
  touch $BOOK
  chmod 777 $BOOK
  echo "FirstName,LastName,Address,City,State,Zip,Phone,Cell,Email,MethodOfContact" >> $BOOK
fi
#checks if file is readable, makes it readable
if [ ! -r $BOOK ]; then
  echo "Error: $BOOK not readable"
  chmod 777 $BOOK
fi
#checks if file is writable, makes it writab;e
if [ ! -w $BOOK ]; then
  echo "Error: $BOOK not writeable"
  chmod 777 $BOOK
fi

#executes the actual functionality
exec_menu
