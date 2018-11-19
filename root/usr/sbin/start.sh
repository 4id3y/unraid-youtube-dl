#!/bin/bash

while true; do
	#Check Variables
	if [ -z ${PLAYLIST} ]; then

        	echo "PLAYLIST is unset" 
		exit
 	else
        	echo "PLAYLIST is set to '$PLAYLIST'"
	fi
	if [ -z ${OUTPUT_FORMAT} ]; then
                echo "OUTPUT_FORMAT not set"
                echo "Setting to %(title)s.%(ext)s"
                OUTPUT_FORMAT="%(title)s.%(ext)s"
        fi
	if [ -z ${FORMAT_SELECTION} ]; then
		echo "FORMAT_SELECTION not set"
		echo "Setting to bestvideo+bestaudio"
		FORMAT_SELECTION="bestvideo+bestaudio"
	fi


	#Download Playlist
	echo "Dowloading $PLAYLIST"
	echo "Format is $FORMAT_SELECTION"
	youtube-dl $PLAYLIST -i \
	-o /persistent/$OUTPUT_FORMAT \
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
