PRODUCT_NAME := FracSaverMac
BUILD_DIR := build
BUNDLE := $(BUILD_DIR)/$(PRODUCT_NAME).saver
CONTENTS := $(BUNDLE)/Contents
MACOS := $(CONTENTS)/MacOS
RESOURCES := $(CONTENTS)/Resources
SWIFT_SOURCES := $(wildcard Sources/*.swift)

.PHONY: all clean install-local

all: $(BUNDLE)

$(BUNDLE): $(SWIFT_SOURCES) Resources/Info.plist
	rm -rf "$(BUNDLE)"
	mkdir -p "$(MACOS)" "$(RESOURCES)"
	cp Resources/Info.plist "$(CONTENTS)/Info.plist"
	xcrun swiftc \
		-target arm64-apple-macosx26.0 \
		-parse-as-library \
		-emit-library \
		-module-name $(PRODUCT_NAME) \
		-framework AppKit \
		-framework ScreenSaver \
		-o "$(MACOS)/$(PRODUCT_NAME)" \
		$(SWIFT_SOURCES)
	chmod +x "$(MACOS)/$(PRODUCT_NAME)"
	codesign --force --sign - "$(BUNDLE)"

install-local: all
	mkdir -p "$$HOME/Library/Screen Savers"
	rm -rf "$$HOME/Library/Screen Savers/$(PRODUCT_NAME).saver"
	cp -R "$(BUNDLE)" "$$HOME/Library/Screen Savers/"

clean:
	rm -rf "$(BUILD_DIR)"
