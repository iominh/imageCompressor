#!/bin/sh
# Code borrowed from http://www.cyberciti.biz/faq/bash-loop-over-file/
# Requires ImageMagick's "convert" to be available on command line


function processFiles()
{
	echo "Processing directory $1"
	FILES=$1/*.jpg
	for f in $FILES
	do
		echo "Compressing $f"
		convert $f -thumbnail 800x -strip -interlace line -quality 90 $f
	done
}


if [ "$#" -eq 0 ]
then
	echo "Compresses all jpg images in a directory."
	echo "Usage: ./process.sh <directory to process>"
else
	processFiles $1
fi


