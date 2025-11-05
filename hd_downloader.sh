#!/bin/sh

# This is the ABSOLUTE PATH!!!! where your EDOPRO is installed.
path="/home/username/.local/share/edopro/"

# Get *.ydk files
cd $path/deck/; files=(*.ydk)

# Clear pics folder
rm -r $path/pics/*

for ydk in "${files[@]}"
do
	while read -r i; do
		# Only numeric lines are IDs
		if [[ $i =~ ^[0-9]+$ ]]; then
			# Skip if file already exist
			if [ ! -f "$path/pics/$i.jpg" ]; then
				# Download cards by ID
				echo 'Downloading' $i; curl -s -P1 https://images.ygoprodeck.com/images/cards/$i.jpg -o "$path/pics/$i.jpg"&
			fi
		fi
	done < $ydk
done
