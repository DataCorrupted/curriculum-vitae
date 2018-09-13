# Update first
git pull origin master

# Check result
if [ $? -eq 1 ]
then
	echo
	echo "Update failed, cannot pull from origin master, do you have any un-commited changes?"
	echo
	exit 1
fi

# Compile
echo 
echo "Update successful, compiling"
echo

./script/compile-latex.sh resume_eng
./script/compile-latex.sh resume_chn
./script/compile-latex.sh cv

echo "Done."
echo