FROM ubuntu:16.04

# global environment settings
ENV DEBIAN_FRONTEND="noninteractive" 

# install packages
RUN \
 apt-get update && \
 apt-get install -y \
	locales \
	python \
	ruby \ 
	curl && \
 apt-get clean

# Set the locale
RUN sed -i -e 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen
ENV LANG en_GB.UTF-8  
ENV LANGUAGE en_GB:en  
ENV LC_ALL en_GB.UTF-8 

# add local files
COPY root/ /

VOLUME /persistant

CMD start.sh
