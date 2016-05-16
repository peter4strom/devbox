#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc

sudo apt-get update
sudo apt-get install --yes \
	automake autoconf libreadline-dev libncurses-dev libssl-dev libyaml-dev \
	libxslt-dev libffi-dev libtool unixodbc-dev

