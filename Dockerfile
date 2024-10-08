FROM ubuntu:20.04

WORKDIR /src/lumass

RUN <<EOF 
export DEBIAN_FRONTEND=noninteractive
apt-get update && apt-get -y upgrade
apt-get -y install sudo git wget gdal-bin libgdal26 libopengl0
# next install fixes issue in lumass_build.sh script, probably should just fix the script or embed within this Dockerfile
apt-get -y install --no-install-recommends tzdata
wget https://raw.githubusercontent.com/manaakiwhenua/LUMASS/develop/utils/build/lumass_install_deb_packages.sh
wget https://raw.githubusercontent.com/manaakiwhenua/LUMASS/develop/utils/build/lumass_build.sh

bash lumass_install_deb_packages.sh
bash lumass_build.sh


EOF
