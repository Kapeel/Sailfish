# Sailfish 
# VERSION               0.9.0
# 

FROM      ubuntu:14.04.3 
MAINTAINER Kapeel Chougule

LABEL Description="This image is used for running Sailfish RNA seq qauntification tool "
RUN apt-get update && apt-get install -y build-essential cmake zlib1g-dev wget python
#libhdf5-dev pkg-config liblzma-dev apt-get install libbz2-dev curl unzip

RUN  wget https://github.com/kingsfordgroup/sailfish/archive/v0.9.2.tar.gz . \
&& tar -xvf v0.9.2.tar.gz \
&& cd Sailfish \
&& mkdir build \
&& cs build \
&& cp SailfishBeta-0.7.6/bin/sailfish /usr/bin/ \
&& cp SailfishBeta-0.7.6/lib/* /usr/bin/

ENTRYPOINT ["sailfish","-h"]
