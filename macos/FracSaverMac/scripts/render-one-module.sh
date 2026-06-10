#!/bin/sh
set -eu

cd "$(dirname "$0")/.."
mkdir -p build
xcrun swiftc \
  -target arm64-apple-macosx26.0 \
  -parse-as-library \
  -framework AppKit \
  -framework ScreenSaver \
  -o build/render-one-module \
  Sources/FracCanvas.swift \
  Sources/FracRenderer.swift \
  Sources/FracSettings.swift \
  Tools/RenderOneModule.swift
build/render-one-module "${1:-life}"
