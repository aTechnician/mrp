# Numbers PDF OCRed pages
# place in parent directory to the things to be numbered 
# (i.e. placehere/document-name-dir/document.txt)
# script will number everything in the subdirectories

for folder in *; do
	if [[ -d "$folder" ]]; then
		cd $folder
			i=1
			for pg in $(ls -v *.txt); do
				mani=${pg%.txt}
				mani="$mani-$i.txt"
				mv $pg $mani
				((i++))
			done
		cd .. #back to previous dir
	fi
done
