#!/bin/bash

while true; do
	#Check Variables
	if [ -z ${PLAYLIST+x} ]; then
        	echo "PLAYLIST is unset" 
		exit
 	else
        	echo "PLAYLIST is set to '$PLAYLIST'"
	fi


	#Download Playlist
	echo "Dowloading $PLAYLIST"
	youtube-dl $PLAYLIST -i \
	-o "/persistent/%(title)s.%(ext)s" \
	-f bestvideo+bestaudio \
	--no-check-certificate \
	--postprocessor-args "-strict experimental" \
	--download-archive /persistent/archive \
	--merge-output-format mkv
	chmod -R 777 /persistent/

	#Create NFOs
	if [ "$NFO" = "true" ]; then
		echo "NFO creation enabled"
		ruby /usr/sbin//make-mvid-nfo.rb /persistent/
	fi

	echo "Done Sleeping for $INTERVAL seconds"
	sleep $INTERVAL
done
