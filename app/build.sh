#!/bin/bash
set -e

if ! command -v conan &> /dev/null; then
    echo "Installing Conan..."
    pip3 install conan --upgrade
fi

mkdir -p build
cd build

echo "[1/3] Install dependencies Conan..."
conan install .. --output-folder=. --build=missing

echo "[2/3] Generate Makefile..."
cmake .. -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake

echo "[3/3] Building..."
cmake --build . --verbose 2>&1 | tee build.log

echo "=== Succssess! ==="
echo "Launch program:"
echo "./app"