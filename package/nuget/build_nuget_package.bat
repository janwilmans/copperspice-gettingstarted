rd /s build
cmake -Bbuild -DNUGET_DOWNLOAD=1 -G Ninja
cd build
cpack
cd ..
