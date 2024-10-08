FROM ubuntu:22.04

WORKDIR /src/lumass

RUN <<EOF 
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get -y upgrade
apt-get -y install sudo git wget gdal-bin libgdal26 libopengl0
# next install fixes issue in lumass_build.sh script, probably should just fix the script or embed within this Dockerfile
DEBIAN_FRONTEND=interactive apt-get -y install --no-install-recommends tzdata

apt install -y build-essential cmake cmake-curses-gui git gitk libboost-filesystem1.74-dev libboost-serialization1.74-dev curl \
lp-solve liblpsolve55-dev libspatialite-dev libspatialite7 libgdal-dev python3-gdal gdal-bin gdal-data libmpich-dev libmpich12 mpich \
libhdf5-mpich-103-1 libhdf5-mpich-cpp-103-1 libhdf5-mpich-dev libhdf5-mpich-hl-100 libhdf5-mpich-hl-cpp-100 pybind11-dev \
libyaml-cpp-dev libtinyxml-dev ffmpeg libavcodec-dev libavdevice-dev libgeotiff-dev libglvnd-dev libxcursor-dev \
python3 python-is-python3 python3-pip libpython3.10-dev libfuse2

### Qt C++ framework
apt-get install -y libqt5concurrent5 libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5qml5 libqt5sql5 libqt5websockets5-dev libqt5widgets5 \
        libqt5xml5 qml-module-qtquick-privatewidgets qtbase5-private-dev qttools5-private-dev qtdeclarative5-dev libqt5opengl5-dev


wget https://raw.githubusercontent.com/manaakiwhenua/LUMASS/develop/utils/build/lumass_build.sh
# bash lumass_build.sh


EOF
