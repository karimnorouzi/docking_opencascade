FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get -y install build-essential git cmake
#install opencascade
RUN apt-get -y install tcl tcl-dev tk tk-dev 
RUN apt-get -y install libxmu-dev libxi-dev
RUN apt-get -y install libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev

#install qt6
RUN apt-get install qt6-base-dev qt6-tools-dev-tools
RUN apt-get install qt6-3d-dev qt6-svg-dev qt6-multimedia-dev


#RUN rm -rf opencascade
RUN git clone https://github.com/Open-Cascade-SAS/OCCT.git opencascade

WORKDIR /opencascade 

RUN mkdir -p build
WORKDIR /opencascade/build
RUN cmake .. \
    -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr
RUN make -j2
RUN make install
