if  [[ $# -eq 0 || $@ == *"-i"* || $@ == *"--integer"* ]]
then
	echo "Nothing"
fi

if [[ $@ != *"-b"* ]]
then
	echo "No -b"
fi

if [[ $@ == *'-full'* ]]
then
	echo "full"
fi

if [[ $@ == *"-a"* ]]
then
	echo "a"
fi
