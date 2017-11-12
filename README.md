# unraid-youtube-dl
youtube-dl docker for Unraid. Primarily for music videos.

Link to Docker Hub: https://hub.docker.com/r/4id3y/youtube-dl/

# Intructions

* 1 Just paste https://github.com/4id3y/unraid-templates into the docker/templates section on unraid

* 2 Click add container and select unraid-youtube-dl from the 4id3y subsection

* 3 Then fill out the fields as below

  * Name: Name of your container

  * Download Location: Folder you with the container to download to. This maps to /persistent in the container.

  * Playlist URL: The URL of your Youtube playlist

  * Interval: How long you with the downloader to wait before checking your list again.
