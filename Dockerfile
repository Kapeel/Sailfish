# Sailfish 
# VERSION               0.7.6
# 

FROM      ubuntu:14.04.3 
MAINTAINER Kapeel Chougule

LABEL Description="This image is used for running Sailfish RNA seq qauntification tool "
RUN apt-get update && apt-get install -y build-essential cmake zlib1g-dev wget python
#libhdf5-dev pkg-config liblzma-dev apt-get install libbz2-dev curl unzip

RUN  wget https://github.com/kingsfordgroup/sailfish/releases/download/v0.7.6/SailfishBeta-0.7.6_Linux-x86-64.tar.gz \
&& tar -xvf SailfishBeta-0.7.6_Linux-x86-64.tar.gz \
&& mv SailfishBeta-0.7.6_Linux-x86-64 SailfishBeta-0.7.6 \
&& cp SailfishBeta-0.7.6/bin/sailfish /usr/bin/ \
&& cp SailfishBeta-0.7.6/lib/* /usr/bin/

ENTRYPOINT ["sailfish","-h"]
