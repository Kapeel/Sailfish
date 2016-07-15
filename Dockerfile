# Sailfish 
# VERSION               0.9.2
# 

FROM      ubuntu:14.04.3 
MAINTAINER Kapeel Chougule

LABEL Description="This image is used for running Sailfish RNA seq qauntification tool "
RUN apt-get update && apt-get install -y build-essential cmake curl unzip zlib1g-dev wget python libtbb-dev libjemalloc-dev libgoogle-perftools-dev \
pkg-config libbz2-dev 
#libhdf5-dev pkg-config liblzma-dev apt-get install libbz2-dev curl unzip
RUN  git clone https://github.com/kingsfordgroup/sailfish.git \
&& wget https://github.com/Kapeel/Sailfish/blob/master/Sailfish_align.pl . \
&& chmod +x Sailfish_align.pl
&& mv Sailfish_align.pl /usr/bin/ \
&& cd sailfish \
&& mkdir build \
&& cd build \
&& cmake -DFETCH_BOOST=TRUE .. \
&& make \
&& make install \
&& export PATH=$PATH:/root/sailfish/bin \
&& export PATH=$PATH:/root/sailfish/bin \
&& set +o posix

ENTRYPOINT ["sailfish","-h"]
