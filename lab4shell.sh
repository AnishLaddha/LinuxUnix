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
fi

if [[ "$choice" == "2" ]]; then
	echo 'You selected Add'
fi

if [[ "$choice" == "3" ]]; then
	echo 'You selected Edit'
fi

if [[ "$choice" == "4" ]]; then
	echo 'You selected Remove'
fi

if [[ "$choice" == "5" ]]; then
	exit 1
fi

