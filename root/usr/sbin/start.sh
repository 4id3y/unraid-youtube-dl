#!/bin/bash

while true; do
	#Check Variables
	if [ -z ${PLAYLIST+x} ]; then
        	echo "PLAYLIST is unset" 
		exit
 	else
        	echo "PLAYLIST is set to '$PLAYLIST'"
	fi
	if [ -z ${FORMAT_SELECTION+x} ]; then
		echo "FORMAT_SELECTION not set"
		echo "Setting to bestvideo+bestaudio"
		FORMAT_SELECTION="bestvideo+bestaudio"
	fi


	#Download Playlist
	echo "Dowloading $PLAYLIST"
	echo "Format is $FORMAT_SELECTION"
	youtube-dl $PLAYLIST -i \
	-o "/persistent/%(title)s.%(ext)s" \
	-f $FORMAT_SELECTION \
	--no-check-certificate \
	--postprocessor-args "-strict experimental" \
	--download-archive /persistent/archive \
	$ADDITIONAL_OPTIONS
	chmod -R 777 /persistent/

	#Create NFOs
	if [ "$NFO" = "true" ]; then
		echo "NFO creation enabled"
		ruby /usr/sbin//make-mvid-nfo.rb /persistent/
	fi

	echo "Done Sleeping for $INTERVAL seconds"
	sleep $INTERVAL
done
