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
