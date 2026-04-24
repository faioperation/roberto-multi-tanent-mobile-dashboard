#!/bin/bash

# Exit on error
set -e

echo "--- Fixing Git Permissions ---"
git config --global --add safe.directory "*"

echo "--- Installing Flutter SDK ---"

# Download Flutter (matching the SDK version in pubspec.yaml if possible)
# Vercel environment is Linux-based
FLUTTER_VERSION="3.41.7" # Updated to match project requirements
FLUTTER_CHANNEL="stable"

if [ ! -d "flutter" ]; then
  curl -C - https://storage.googleapis.com/flutter_infra_release/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz -o flutter.tar.xz
  tar xf flutter.tar.xz
  rm flutter.tar.xz
fi

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

echo "--- Flutter Version ---"
git config --global --add safe.directory "$(pwd)/flutter"
flutter --version

echo "--- Enabling Web ---"
flutter config --enable-web

echo "--- Fetching Dependencies ---"
flutter pub get

echo "--- Building for Web ---"
# Building with --release for production
flutter build web --release

echo "--- Build Complete ---"
