#!/bin/bash

# Exit on error
set -e

echo "--- Installing Flutter SDK ---"

# Download Flutter (matching the SDK version in pubspec.yaml if possible, here using stable)
# Vercel environment is Linux-based
FLUTTER_VERSION="3.22.0" # You can change this to match your local version
FLUTTER_CHANNEL="stable"

if [ ! -d "flutter" ]; then
  curl -C - https://storage.googleapis.com/flutter_infra_release/releases/${FLUTTER_CHANNEL}/linux/flutter_linux_${FLUTTER_VERSION}-${FLUTTER_CHANNEL}.tar.xz -o flutter.tar.xz
  tar xf flutter.tar.xz
  rm flutter.tar.xz
fi

# Add Flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

echo "--- Flutter Version ---"
flutter --version

echo "--- Enabling Web ---"
flutter config --enable-web

echo "--- Fetching Dependencies ---"
flutter pub get

echo "--- Building for Web ---"
# Building with --release for production
flutter build web --release

echo "--- Build Complete ---"
