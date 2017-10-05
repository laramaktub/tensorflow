FROM ubuntu:16.04

RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y nano 

RUN rm -rf /var/lib/apt/lists/*


RUN apt-get update
RUN apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev


#WORKDIR /usr/src
#RUN wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
#RUN tar xzf Python-2.7.13.tgz

#WORKDIR Python-2.7.13
#RUN  ./configure
#RUN make altinstall
RUN apt-get install -y python python-pip python-tk
RUN pip install --upgrade pip
RUN pip install keras tensorflow matplotlib pillow h5py

#Needed to be able to use the GUI
ENV DISPLAY :0
