#!/bin/bash
set -e

BUILD_DIR="build"

# Clean old build
if [ -d "$BUILD_DIR" ]; then
  echo "Cleaning previous build..."
  rm -rf "$BUILD_DIR"
fi

# Create build directory
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

# Run CMake and build
echo "Configuring project..."
cmake ..
echo "Building project..."
make -j$(nproc)

echo "✅ Build complete."
