if [[ "$@" == *"--help"* || "$@" == *"-h"* ]]
then
	echo "Auto updater written in shell."
	echo "Usage: "
	echo "./script/update.sh [-option]"
	echo "  --no-update 	-n 	compile files but do not update by git pull."
	echo "  --full 		-f 	(default)compile all three files."
	echo "  --eng 		-e 	compile english version of resume."
	echo "  --chn 		-h 	compile chinese version of resume."
	echo "  --cv 		-v 	compile long version of resume."
	echo "  --help 		-h 	print this help information."
	echo ""
	echo "For more information please contact PeterRong96 at gmail dot com"
	exit 0
fi

if [[ "$@" == *"--no-update"* || "$@" == *"-n"* ]]
then
	echo "Not updating with github.com"
else
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
fi


if [[ $# -eq 0 || "$@" == *"--full"* || "$@" == *"-f"* ]]
then
	./script/compile-latex.sh resume_eng
	./script/compile-latex.sh resume_chn
	./script/compile-latex.sh cv
fi

if [[ "$@" == *"--eng"* || "$@" == *"-e"* ]]
then
	./script/compile-latex.sh resume_eng
fi

if [[ "$@" == *"--chn"* || "$@" == *"-z"* ]]
then
	./script/compile-latex.sh resume_chn
fi

if [[ "$@" == *"--cv"* || "$@" == *"-v"* ]]
then
	./script/compile-latex.sh cv
fi

echo "Done."
echo