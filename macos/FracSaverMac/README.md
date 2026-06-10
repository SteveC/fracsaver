# FracSaverMac

Native macOS 26 screen saver port of the Visual Basic 5 FracSaver archive.

This subproject builds a local `.saver` bundle using Swift, AppKit, and Apple's ScreenSaver framework. It preserves the historical module catalog and defaults while storing settings with native macOS screen saver preferences.

## Build

```sh
make
```

The bundle is written to:

```text
macos/FracSaverMac/build/FracSaverMac.saver
```

## Local Install

For local testing, copy the bundle into your user Screen Savers folder:

```sh
make install-local
```

Then open macOS System Settings and choose `FracSaver`.

The current build is ad-hoc signed for local testing, not notarized.
