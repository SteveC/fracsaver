#!/bin/sh
set -eu

cd "$(dirname "$0")/.."
mkdir -p build
xcrun swiftc \
  -target arm64-apple-macosx26.0 \
  -parse-as-library \
  -framework AppKit \
  -framework ScreenSaver \
  -o build/settings-window-smoke-test \
  Sources/FracCanvas.swift \
  Sources/FracLogger.swift \
  Sources/FracModuleMetadata.swift \
  Sources/FracRenderer.swift \
  Sources/FracSettings.swift \
  Sources/FracSettingsWindowController.swift \
  Tools/SettingsWindowSmokeTest.swift
build/settings-window-smoke-test
