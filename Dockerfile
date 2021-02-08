FROM ubuntu:20.04

RUN apt update && apt upgrade -y

# Enable 32 bit architecture
RUN dpkg --add-architecture i386 

# Download and add the repository key
RUN apt-get -y install software-properties-common wget
RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -

# Add Wine Repository
RUN apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
RUN apt update

# Install Wine
RUN apt install -y --install-recommends winehq-stable
COPY OfficeInstaller.exe /root/Downloads/
# RUN cd /root/Downloads && wine ./npp.7.7.Installer.exe
# RUN wget https://notepad-plus-plus.org/repository/7.x/7.7/npp.7.7.Installer.exe
