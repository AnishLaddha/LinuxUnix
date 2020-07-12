echo '-- Address Book --'
echo '1. List'
echo '2. Add'
echo '3. Edit'
echo '4. Remove'
echo '5. Quit'

echo 'Choose one: '
read choice

if [[ "$choice" == "1" ]]; then
	echo 'You selected List'
elif [[ "$choice" == "2" ]]; then
	echo 'You selected Add'
elif [[ "$choice" == "3" ]]; then
	echo 'You selected Edit'

elif [[ "$choice" == "4" ]]; then
	echo 'You selected Remove'

elif [[ "$choice" == "5" ]]; then
	exit 1
else
	echo "Please choose a number 1 to 5; terminating script"
fi


