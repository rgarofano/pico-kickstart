# Raspberry Pi Pico W Kickstart
This repo was made to speed up the process of writing your first program on the Raspberry Pi Pico W. Instructions for various operating systems can be found below.

## Linux One-Time Setup
### Step 1: install all prerequisite packages
Debian
```
$ sudo apt update
$ sudo apt install git cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential
```
Arch
```
$ sudo pacman -Sy git cmake arm-none-eabi-gcc arm-none-eabi-newlib gcc make
```
### Step 2: run the setup script
```
$ git clone https://github.com/rgarofano/pico-kickstart.git
$ cd pico-kickstart
$ chmod +x setup.sh
$ ./setup.sh
```
This will generate a `pico` directory inside of your home directory with `pico-sdk` and `pico-examples` directories inside of it. It will also create an environment variable for the path to the pico SDK. In order for this to take effect you can restart your terminal session or run the following:
```
$ source $HOME/.$(echo $SHELL | awk -F '/' '{print $NF}')rc
```

## MacOS One-Time Setup
