FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get -y install build-essential git cmake

RUN apt-get -y install tcl tcl-dev tk tk-dev 
RUN apt-get -y install libxmu-dev libxi-dev
RUN apt-get -y install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev
#RUN rm -rf opencascade
RUN git clone https://github.com/Open-Cascade-SAS/OCCT.git opencascade

WORKDIR /opencascade 

RUN mkdir -p build
WORKDIR /opencascade/build
RUN cmake .. \
    -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr
RUN make -j2
RUN make install
