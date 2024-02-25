# Raspberry Pi Pico / Pico W Kickstart
This repo was made to speed up the process of running your first program on the Raspberry Pi Pico or Pico W. This information was derived from the [official Raspberry Pi docs](https://datasheets.raspberrypi.com/pico/getting-started-with-pico.pdf). The goal was to make a more concise version of the first couple chapters and to provide scripts where possible to speed things up for the user.

## Before starting, for windows users
### Install WSL
You can now install everything you need to run WSL with a single command:
 - Open PowerShell or Windows Command Prompt in administrator mode by right-clicking and selecting "Run as administrator" and then enter
 - ```wsl --install```
 - restart your machine
 - launch the WSL app from the search menu
 - follow on-screen instructions to set up login/user details.

## One-Time Setup
### Step 1: Install all prerequisite packages
Debian / Ubuntu / Linux Mint / Windows (Using WSL)
```
$ sudo apt update
$ sudo apt install git cmake gcc-arm-none-eabi libnewlib-arm-none-eabi build-essential -y
```
Arch
```
$ sudo pacman -Sy git cmake arm-none-eabi-gcc arm-none-eabi-newlib gcc make
```
MacOS

First [install brew](https://brew.sh/) then use it to install the following:
```
$ brew install cmake
$ brew tap ArmMbed/homebrew-formulae
$ brew install gcc-arm-embedded
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

## Blinking LED (Raspberry Pi Pico)
The developers of the Raspberry Pi Pico have provided us with the code we need to blink an LED on the board so we can skip this step. We still need to go through the process of building and compiling the code. In general when developing on the pico you write your code in one directory and then you create a seperate directory called `build` where all the files generated from the building process are stored. Since the code for blink is stored in `$HOME/pico/pico-examples/blink` we will create the the build directory at `$HOME/pico/pico-examples/build`:
```
$ cd $HOME/pico/pico-examples
$ mkdir build
$ cd build
```
now that we are inside the build directory we can run the following:
```
$ cmake ..
```
You'll notice there are now a ton of files in the build directory, hence why we don't build in the same directory as the source code. Next we have to actually compile the code for blink which we can do by running:
```
$ cd blink
$ make -j4
```
This will generate a file called `blink.uf2` among others. All we need to do is copy this file to the board and then it will reboot and run the blink code immediately.
> Note: running make with -j4 means that 4 processors/threads will execute the command in parallel, you may choose a higher or lower number depending on your processor or omit the -j entirely

## Blinking LED (Raspberry Pi Pico W)
The developers of the Raspberry Pi Pico have provided us with the code we need to blink an LED on the board so we can skip the step of actually writing the code. We still need to go throught the process of building and compiling the code. In general when developing on the pico you write your code and then you create a seperate directory called `build` where all the files generated from building and compilation are stored. Since the code for blink is stored in `$HOME/pico/pico-examples/blink` we will create the the build directory at `$HOME/pico/pico-examples/build`:
```
$ cd $HOME/pico/pico-examples
$ mkdir build
$ cd build
```
now that we are inside the build directory we can run the following:
```
$ cmake .. -DPICO_BOARD=pico_w
```
You'll notice there are now a ton of files in the build directory, hence why we don't build in the same directory as the source code. Next we have to actually compile the code for blink which we can do by running:
```
$ cd pico_w/wifi/blink
$ make -j4
```
This will generate a file called `picow_blink.uf2` among others. All we need to do is copy this file to the board and then it will reboot and run the blink code immediately.
> Note: running make with -j4 means that 4 processors/threads will execute the command in parallel, you may choose a higher or lower number depending on your processor or omit the -j entirely
