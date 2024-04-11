#!/usr/bin/env bash

mkdir -p d10_src
cd d10_src/
cp -r /etc .
mkdir aa
mkdir bb
cd etc
mv a* ../aa
mv b* ../bb

