#!/bin/bash
# Get the source code
git clone https://github.com/microsoft/CBL-Mariner.git
pushd CBL-Mariner/toolkit

# Checkout the desired release branch. The 1.0-stable tag tracks the $
git checkout 1.0-stable

sudo make package-toolkit REBUILD_TOOLS=y
popd


