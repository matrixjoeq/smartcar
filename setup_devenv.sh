#!/bin/bash

# setup development environment on Pi
sudo apt-get install gcc g++ gdb cmake git-core vim tmux ssh

# get WiringPi library
if [ ! -d ./externals/WiringPi ]; then
    git clone https://github.com/WiringPi/WiringPi.git ./externals/WiringPi
    if [ $? -eq 0 ]; then
        pushd ./externals/WiringPi
	./build
	popd
    fi
fi

# get GTest library
if [ ! -d ./externals/googletest ]; then
    git clone https://github.com/google/googletest.git ./externals/googletest
    if [ $? -eq 0 ]; then
        pushd ./externals/googletest
	git checkout -b r180 release-1.8.0
	mkdir build
	cd build
	cmake ../
	make && sudo make install
	popd
    fi
fi

