#!/bin/bash

export CopperSpice_DIR=/home/jan.wilmans/project/copperspice/install/lib/cmake/CopperSpice

cmake -G Ninja -DBUILD_WITH_UBSAN=ON -DCMAKE_BUILD_TYPE=Debug -Bbuild/debug
cmake --build build/debug --target install

cmake -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo -Bbuild/release
cmake --build build/release --target install
