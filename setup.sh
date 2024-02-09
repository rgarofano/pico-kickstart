#!/bin/bash
base_dir=$HOME/pico
echo "Creating base directory.."
mkdir -p $base_dir
cd $base_dir
echo "Cloning raspberry pi pico SDK.."
git clone https://github.com/raspberrypi/pico-sdk.git --branch master
cd pico-sdk
echo "Updating SDK.."
git submodule update --init
echo "Adding SDK path to environment.."
default_shell=$(echo $SHELL | awk -F '/' '{print $NF}')
shell_config_file=$HOME/.$(echo $default_shell)rc
echo "export PICO_SDK_PATH=$base_dir/pico-sdk" >> $shell_config_file
echo "Adding pico example code.."
cd $base_dir
git clone https://github.com/raspberrypi/pico-examples.git --branch master
echo "Done!"
