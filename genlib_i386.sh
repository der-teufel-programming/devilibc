#!/bin/sh
cd i386
gcc -m32 -nostdlib -c *.s
ar rvs ../libs/libdevil_i386.a *.o
rm *.o
cd ..
