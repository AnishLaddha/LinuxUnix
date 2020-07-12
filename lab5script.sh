echo "----------------------Address Book----------------------"
#this line below will ask the user to select one of the following
select opt in List Add Edit Remove Quit; do
echo "Selected option: $opt"; #print selected option, then number
echo "Selected number: $REPLY";
if [[ "$REPLY" == "1" ]]; then #tells you your in list
	echo 'You selected List, this is where the list will be'
elif [[ "$REPLY" == "2" ]]; then  #tells you your in ADD
	echo 'You selected Add, this is where you will add stuff'
elif [[ "$REPLY" == "3" ]]; then  #tells you your in Edit
	echo 'You selected Edit, this is where edit will be'
elif [[ "$REPLY" == "4" ]]; then  #tells you your in Remove
	echo 'You selected Remove, this is where you will remove stuff'
elif [[ "$REPLY" == "5" ]]; then # quits the program
	break
	exit 1
else
	echo "Please choose a number 1 to 5; terminating script"

#loops program until user selects 5, as that is the only one with an exit or break.
fi
echo "--------------------------------------------------------"
done
#finishes loop
