# Shell script takes typed war diary PDFs, OCRs them, and turns them into 
# text files
# Requires pdftk, ocrit (github), macos, zsh

# input ./ocr.sh [input file] [output file]

args=("$1" "$2")

#echo "Debug"
#echo "${args[0]}" 
#echo "${args[1]}" 

# Reminder zsh 1 indexes
mkdir "${args[1]}" 

if cp "${args[0]}" "${args[1]}" then

	pwd=(`pwd`)
	output="${args[1]}"/"${args[0]}"

	cd "${args[1]}"

	pdftk "${args[0]}" burst

	j=1 #for page counting

	for i in pg_*.pdf; do

	ocrit $i > "${args[1]}""/""${args[0]%????}"$j".txt"

	echo "Page "$j" complete"

	((j++))

	rm $i

	done

	rm "${args[0]}"

	cd -

else

	echo "Error"

fi
