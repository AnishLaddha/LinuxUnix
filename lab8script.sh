#!/bin/sh

echo "Enter contact file name: "
read BOOK
#this stuff above takes in the file name to whether create or where the current contacts are stored

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
				#defined below
				case_one()
				;;
				
			"2")
				#defined below
				add_new_entry				
				;;
			"3")
				do_edit()
				;;
			"4")
				do_remove()
				;;
			"5")
				echo "Thanks for using, quitting now!"
				exit 0
				;;
			*)
				#for everything not 1-5
				echo "unrecognized input, please input a a number from 1-5"
				;;
		esac
	done
}

case_one(){
	#asks user if they want to list or search, read input and then does those functions
	echo "do you want list or search?"
	echo "1: List"
	echo "2: Search"
	read i
	case "$i" in
		"1")
			do_list()
			;;
		"2")
			do_search()
			;;
	esac

}
do_edit(){
	echo "enter a unique identifier of the person you want to edit i.e LastName, phone number, or email"
	read term
	echo "The following line will be edited"
	out = "`grep $term $BOOK`"
	echo $out
	echo "Enter the new stuff in the following format:"
	echo "FirstName,LastName,Address,City,State,Zip,Phone,Cell,Email,MethodOfContact"
	read newinfo
	sed -i 's/$out/$newinfo/g' $BOOK

	echo "done!"
	;;

}

do_remove(){
	echo "what do you want to remove? Please enter using one of the following formats:"
	echo "FirstName,Lastname"
	echo "State,Zip,Phone"
	echo "Phone, Cell, email"
	read term
	echo "Following Line(s) will be removed: "
	grep $term $BOOK
	echo "Are you sure?: "
	echo "1: yes"
	echo "2: no"
	read conf
	case "$conf" in
		"1")
			sed '/$term/d' $BOOK
			;;
		"2")
			echo "ok, removal cancelled"
			;;
	esac
	;;

}

do_list(){
	#lists all the things in the csv file
	cat $BOOK | column -n -t -s ','| less -S
	;;

}

do_search(){
	#askes user for info
	echo "Enter the value you would like us to search for. This could be a name, address, phone number etc."
	read INFORMATION
	#greps for the input
	out = "`grep $INFORMATION $BOOK`"

	#outputs it using cat column and out
	cat out | column -n -t -s ','| less -S
	;;

}

add_new_entry()
{
	#tells user how to input
	echo "Enter the entry in the following way: "
	echo "FirstName,LastName,Address,City,State,Zip,Phone,Cell,Email,MethodOfContact"
	#gets user input
	read INFORMATION
	#appends to bottom of file
	echo "$INFORMATION" >> $BOOK
	;;
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


#checks if file is writable, makes it writable
if [ ! -w $BOOK ]; then
  echo "Error: $BOOK not writeable"
  chmod 777 $BOOK
fi

#executes the actual functionality
exec_menu
