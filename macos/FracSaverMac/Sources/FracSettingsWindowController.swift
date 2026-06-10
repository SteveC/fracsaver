import AppKit

final class FracSettingsWindowController: NSWindowController, NSTableViewDataSource, NSTableViewDelegate {
    private var settings: FracSettings
    private let onSave: (FracSettings) -> Void
    private let tableView = NSTableView()
    private let secondsField = NSTextField()
    private let scaleSlider = NSSlider()
    private let showNameCheckbox = NSButton(checkboxWithTitle: "Show module name on screen", target: nil, action: nil)
    private let moduleTitle = NSTextField(labelWithString: "")
    private let moduleDescription = NSTextField(wrappingLabelWithString: "")
    private let parameterStack = NSStackView()
    private let logPathField = NSTextField(labelWithString: FracLogger.logURL.path)
    private let groupPopup = NSPopUpButton()
    private let previewImageView = NSImageView()
    private let previewStatus = NSTextField(labelWithString: "Select a module to preview.")
    private var selectedIndex = 0
    private var selectedGroup = "All"
    private var previewGeneration = 0

    private var groups: [String] {
        ["All"] + Array(Set(settings.modules.map(\.category))).sorted()
    }

    private var filteredIndices: [Int] {
        settings.modules.indices.filter { selectedGroup == "All" || settings.modules[$0].category == selectedGroup }
    }

    init(settings: FracSettings, onSave: @escaping (FracSettings) -> Void) {
        self.settings = settings
        self.onSave = onSave
        let visible = NSScreen.main?.visibleFrame ?? NSRect(x: 0, y: 0, width: 900, height: 700)
        let width = min(780, max(640, visible.width - 80))
        let height = min(540, max(480, visible.height - 80))
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: width, height: height),
            styleMask: [.titled, .resizable],
            backing: .buffered,
            defer: false
        )
        window.minSize = NSSize(width: 640, height: 460)
        window.title = "FracSaver Settings"
        super.init(window: window)
        FracLogger.log("settings window created")
        buildUI(in: window)
        tableView.selectRowIndexes(IndexSet(integer: selectedIndex), byExtendingSelection: false)
        refreshInspector()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        filteredIndices.count
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        let visible = filteredIndices
        if tableView.selectedRow >= 0, tableView.selectedRow < visible.count {
            selectedIndex = visible[tableView.selectedRow]
            refreshInspector()
        }
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let visible = filteredIndices
        guard row < visible.count else { return nil }
        let moduleIndex = visible[row]
        let module = settings.modules[moduleIndex]
        switch tableColumn?.identifier.rawValue {
        case "enabled":
            let button = NSButton(checkboxWithTitle: "", target: self, action: #selector(toggleModule(_:)))
            button.state = module.enabled ? .on : .off
            button.tag = moduleIndex
            return button
        case "name":
            let field = label(module.name)
            field.font = .systemFont(ofSize: 13, weight: module.enabled ? .regular : .light)
            return field
        case "category":
            return label(module.category)
        case "summary":
            return label(parameterSummary(for: module))
        default:
            return nil
        }
    }

    private func buildUI(in window: NSWindow) {
        guard let content = window.contentView else { return }
        let root = NSStackView()
        root.orientation = .vertical
        root.spacing = 14
        root.edgeInsets = NSEdgeInsets(top: 18, left: 18, bottom: 16, right: 18)
        root.translatesAutoresizingMaskIntoConstraints = false
        content.addSubview(root)

        NSLayoutConstraint.activate([
            root.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            root.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            root.topAnchor.constraint(equalTo: content.topAnchor),
            root.bottomAnchor.constraint(equalTo: content.bottomAnchor)
        ])

        root.addArrangedSubview(makeGlobalControls())
        root.addArrangedSubview(makeModuleArea())
        root.addArrangedSubview(makeLogRow())
        root.addArrangedSubview(makeButtons())
    }

    private func makeGlobalControls() -> NSView {
        let controls = NSGridView(views: [
            [label("Seconds per module"), secondsField],
            [label("Render detail"), scaleSlider],
            [NSView(), showNameCheckbox]
        ])
        controls.column(at: 0).xPlacement = .trailing
        controls.column(at: 1).width = 300
        controls.rowSpacing = 8
        controls.columnSpacing = 10

        secondsField.stringValue = format(settings.secondsPerModule)
        secondsField.target = self
        secondsField.action = #selector(updateSeconds(_:))

        scaleSlider.minValue = 0.05
        scaleSlider.maxValue = 1.5
        scaleSlider.doubleValue = settings.pointBudgetScale
        scaleSlider.target = self
        scaleSlider.action = #selector(updateScale(_:))

        showNameCheckbox.state = settings.showModuleName ? .on : .off
        return controls
    }

    private func makeModuleArea() -> NSView {
        let split = NSStackView()
        split.orientation = .horizontal
        split.spacing = 12
        split.alignment = .top
        let left = NSStackView()
        left.orientation = .vertical
        left.spacing = 8
        left.addArrangedSubview(makeGroupFilter())
        left.addArrangedSubview(makeTable())
        split.addArrangedSubview(left)
        split.addArrangedSubview(makeInspector())
        return split
    }

    private func makeGroupFilter() -> NSView {
        let stack = NSStackView()
        stack.orientation = .horizontal
        stack.spacing = 8
        stack.alignment = .centerY
        let title = label("Group")
        title.font = .systemFont(ofSize: 12, weight: .medium)
        let names = groups
        groupPopup.removeAllItems()
        groupPopup.addItems(withTitles: names)
        groupPopup.target = self
        groupPopup.action = #selector(changeGroup(_:))
        groupPopup.selectItem(withTitle: selectedGroup)
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(groupPopup)
        return stack
    }

    private func makeTable() -> NSScrollView {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.usesAlternatingRowBackgroundColors = true
        tableView.headerView = NSTableHeaderView()
        tableView.addTableColumn(column("enabled", title: "", width: 36))
        tableView.addTableColumn(column("name", title: "Module", width: 170))
        tableView.addTableColumn(column("category", title: "Group", width: 80))
        tableView.addTableColumn(column("summary", title: "Settings", width: 110))

        let scroll = NSScrollView()
        scroll.hasVerticalScroller = true
        scroll.documentView = tableView
        scroll.widthAnchor.constraint(equalToConstant: 410).isActive = true
        scroll.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return scroll
    }

    private func makeInspector() -> NSView {
        let stack = NSStackView()
        stack.orientation = .vertical
        stack.spacing = 8
        stack.widthAnchor.constraint(equalToConstant: 300).isActive = true

        moduleTitle.font = .systemFont(ofSize: 18, weight: .semibold)
        moduleDescription.font = .systemFont(ofSize: 12)
        moduleDescription.textColor = .secondaryLabelColor
        moduleDescription.maximumNumberOfLines = 3

        parameterStack.orientation = .vertical
        parameterStack.spacing = 8

        previewImageView.imageScaling = .scaleProportionallyUpOrDown
        previewImageView.wantsLayer = true
        previewImageView.layer?.backgroundColor = NSColor.black.cgColor
        previewImageView.layer?.cornerRadius = 6
        previewImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true

        let previewButton = NSButton(title: "Render Preview", target: self, action: #selector(renderPreview))
        previewStatus.font = .systemFont(ofSize: 11)
        previewStatus.textColor = .secondaryLabelColor

        stack.addArrangedSubview(moduleTitle)
        stack.addArrangedSubview(moduleDescription)
        stack.addArrangedSubview(previewImageView)
        stack.addArrangedSubview(previewButton)
        stack.addArrangedSubview(previewStatus)
        stack.addArrangedSubview(parameterStack)
        return stack
    }

    private func makeLogRow() -> NSView {
        let stack = NSStackView()
        stack.orientation = .horizontal
        stack.spacing = 8
        stack.alignment = .centerY

        let title = label("Log file")
        title.font = .systemFont(ofSize: 12, weight: .medium)
        logPathField.lineBreakMode = .byTruncatingMiddle
        logPathField.isSelectable = true
        let reveal = NSButton(title: "Reveal", target: self, action: #selector(revealLog))
        stack.addArrangedSubview(title)
        stack.addArrangedSubview(logPathField)
        stack.addArrangedSubview(reveal)
        return stack
    }

    private func makeButtons() -> NSView {
        let stack = NSStackView()
        stack.orientation = .horizontal
        stack.spacing = 8
        stack.alignment = .centerY

        let selectAll = NSButton(title: "Select All", target: self, action: #selector(selectAllModules))
        let selectNone = NSButton(title: "Select None", target: self, action: #selector(selectNoModules))
        let reset = NSButton(title: "Restore Defaults", target: self, action: #selector(restoreDefaults))
        let spacer = NSView()
        spacer.setContentHuggingPriority(.defaultLow, for: .horizontal)
        let cancel = NSButton(title: "Cancel", target: self, action: #selector(cancel))
        let ok = NSButton(title: "OK", target: self, action: #selector(ok))
        ok.keyEquivalent = "\r"

        [selectAll, selectNone, reset, spacer, cancel, ok].forEach(stack.addArrangedSubview)
        return stack
    }

    private func refreshInspector() {
        guard selectedIndex >= 0, selectedIndex < settings.modules.count else { return }
        let module = settings.modules[selectedIndex]
        let metadata = FracModuleMetadata.forModule(id: module.id)
        moduleTitle.stringValue = module.name
        moduleDescription.stringValue = metadata.description
        previewStatus.stringValue = "Preview shows the selected module with current settings."
        parameterStack.arrangedSubviews.forEach { view in
            parameterStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        if metadata.parameters.isEmpty && metadata.stringParameters.isEmpty {
            let none = label("No editable module settings.")
            none.textColor = .secondaryLabelColor
            parameterStack.addArrangedSubview(none)
            DispatchQueue.main.async { self.renderPreview() }
            return
        }

        for index in metadata.stringParameters.indices {
            parameterStack.addArrangedSubview(fieldRow(metadata.stringParameters[index], value: module.stringParameters[safe: index] ?? "", tag: stringTag(index)))
        }
        for index in metadata.parameters.indices {
            parameterStack.addArrangedSubview(fieldRow(metadata.parameters[index], value: format(module.parameters[safe: index] ?? 0), tag: numericTag(index)))
        }
        DispatchQueue.main.async { self.renderPreview() }
    }

    @objc private func changeGroup(_ sender: NSPopUpButton) {
        selectedGroup = sender.titleOfSelectedItem ?? "All"
        tableView.reloadData()
        let visible = filteredIndices
        if let row = visible.firstIndex(of: selectedIndex) {
            tableView.selectRowIndexes(IndexSet(integer: row), byExtendingSelection: false)
        } else if let first = visible.first {
            selectedIndex = first
            tableView.selectRowIndexes(IndexSet(integer: 0), byExtendingSelection: false)
        }
        refreshInspector()
        FracLogger.log("settings group changed group=\(selectedGroup) visible=\(visible.count)")
    }

    private func fieldRow(_ metadata: FracParameterMetadata, value: String, tag: Int) -> NSView {
        let labelField = label(metadata.label)
        labelField.font = .systemFont(ofSize: 12, weight: .medium)
        let field = NSTextField()
        field.stringValue = value
        field.tag = tag
        field.target = self
        field.action = #selector(updateSelectedParameter(_:))
        field.placeholderString = metadata.detail
        let detail = NSTextField(wrappingLabelWithString: metadata.detail)
        detail.font = .systemFont(ofSize: 11)
        detail.textColor = .secondaryLabelColor

        let grid = NSGridView(views: [[labelField, field], [NSView(), detail]])
        grid.column(at: 0).width = 126
        grid.column(at: 0).xPlacement = .trailing
        grid.column(at: 1).width = 190
        grid.rowSpacing = 3
        grid.columnSpacing = 8
        return grid
    }

    private func column(_ identifier: String, title: String, width: CGFloat) -> NSTableColumn {
        let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(identifier))
        column.title = title
        column.width = width
        return column
    }

    private func label(_ text: String) -> NSTextField {
        let field = NSTextField(labelWithString: text)
        field.lineBreakMode = .byTruncatingTail
        return field
    }

    @objc private func toggleModule(_ sender: NSButton) {
        guard sender.tag < settings.modules.count else { return }
        settings.modules[sender.tag].enabled = sender.state == .on
        if let row = filteredIndices.firstIndex(of: sender.tag) {
            tableView.reloadData(forRowIndexes: IndexSet(integer: row), columnIndexes: IndexSet(integersIn: 0..<tableView.numberOfColumns))
        }
        FracLogger.log("settings toggle module=\(settings.modules[sender.tag].id) enabled=\(settings.modules[sender.tag].enabled)")
    }

    @objc private func updateSelectedParameter(_ sender: NSTextField) {
        guard selectedIndex < settings.modules.count else { return }
        if sender.tag >= 1000 {
            let index = sender.tag - 1000
            if index < settings.modules[selectedIndex].stringParameters.count {
                settings.modules[selectedIndex].stringParameters[index] = sender.stringValue
            }
        } else {
            let index = sender.tag
            guard index < settings.modules[selectedIndex].parameters.count else { return }
            let metadata = FracModuleMetadata.forModule(id: settings.modules[selectedIndex].id).parameters[index]
            var value = sender.doubleValue
            if let minimum = metadata.minimum { value = max(minimum, value) }
            if let maximum = metadata.maximum { value = min(maximum, value) }
            settings.modules[selectedIndex].parameters[index] = value
            sender.stringValue = format(value)
        }
        if let row = filteredIndices.firstIndex(of: selectedIndex) {
            tableView.reloadData(forRowIndexes: IndexSet(integer: row), columnIndexes: IndexSet(integer: 3))
        }
    }

    @objc private func updateSeconds(_ sender: NSTextField) {
        settings.secondsPerModule = max(3, min(120, sender.doubleValue))
        sender.stringValue = format(settings.secondsPerModule)
    }

    @objc private func updateScale(_ sender: NSSlider) {
        settings.pointBudgetScale = sender.doubleValue
    }

    @objc private func selectAllModules() {
        for index in settings.modules.indices {
            settings.modules[index].enabled = true
        }
        tableView.reloadData()
    }

    @objc private func selectNoModules() {
        for index in settings.modules.indices {
            settings.modules[index].enabled = false
        }
        tableView.reloadData()
    }

    @objc private func restoreDefaults() {
        settings = .defaults
        secondsField.stringValue = format(settings.secondsPerModule)
        scaleSlider.doubleValue = settings.pointBudgetScale
        showNameCheckbox.state = settings.showModuleName ? .on : .off
        selectedIndex = min(selectedIndex, settings.modules.count - 1)
        tableView.reloadData()
        refreshInspector()
        FracLogger.log("settings restored defaults")
    }

    @objc private func renderPreview() {
        guard selectedIndex < settings.modules.count else { return }
        let module = settings.modules[selectedIndex]
        previewGeneration += 1
        let generation = previewGeneration
        previewStatus.stringValue = "Rendering \(module.name)..."
        FracLogger.log("settings preview start generation=\(generation) module=\(module.id)")
        DispatchQueue.global(qos: .userInitiated).async {
            let started = Date()
            let canvas = FracCanvas(width: 420, height: 260)
            canvas.progressInterval = 14_000
            var lastProgress = Date.distantPast
            canvas.progressHandler = { canvas in
                let now = Date()
                guard now.timeIntervalSince(lastProgress) > 0.18 else { return }
                lastProgress = now
                let partial = canvas.image()
                DispatchQueue.main.async {
                    guard self.previewGeneration == generation else { return }
                    self.previewImageView.image = partial
                    self.previewStatus.stringValue = "Rendering \(module.name)..."
                }
            }
            let image = FracRenderer(canvas: canvas, module: module, pointBudgetScale: min(0.06, self.settings.pointBudgetScale)).render()
            let elapsed = Date().timeIntervalSince(started)
            let nonBlack = canvas.nonBlackPixelCount()
            let finalImage: NSImage
            if nonBlack == 0 {
                var rng = FracRandom()
                for _ in 0..<8000 {
                    canvas.point(rng.int(canvas.width), rng.int(canvas.height), .spectrum(rng.next()))
                }
                finalImage = canvas.image()
            } else {
                finalImage = image
            }
            FracLogger.log("settings preview done generation=\(generation) module=\(module.id) elapsed=\(String(format: "%.3f", elapsed))s nonBlackPixels=\(nonBlack)")
            DispatchQueue.main.async {
                guard self.previewGeneration == generation else { return }
                self.previewImageView.image = finalImage
                self.previewStatus.stringValue = "Preview rendered in \(String(format: "%.2f", elapsed))s."
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if self.previewGeneration == generation, self.previewStatus.stringValue.hasPrefix("Rendering") {
                self.previewStatus.stringValue = "Preview is still rendering; try a lower Render detail value."
                FracLogger.log("settings preview slow generation=\(generation) module=\(module.id)")
            }
        }
    }

    @objc private func revealLog() {
        NSWorkspace.shared.activateFileViewerSelecting([FracLogger.logURL])
    }

    @objc private func cancel() {
        FracLogger.log("settings canceled")
        closeSheet(response: .cancel)
    }

    @objc private func ok() {
        settings.showModuleName = showNameCheckbox.state == .on
        updateSeconds(secondsField)
        settings.pointBudgetScale = scaleSlider.doubleValue
        onSave(settings)
        closeSheet(response: .OK)
    }

    private func closeSheet(response: NSApplication.ModalResponse) {
        guard let window else { return }
        if let sheetParent = window.sheetParent {
            sheetParent.endSheet(window, returnCode: response)
        } else {
            window.close()
        }
    }

    private func parameterSummary(for module: FracModule) -> String {
        let metadata = FracModuleMetadata.forModule(id: module.id)
        var parts: [String] = []
        for index in metadata.stringParameters.indices {
            let value = module.stringParameters[safe: index] ?? ""
            if !value.isEmpty {
                parts.append("\(metadata.stringParameters[index].label): \(value)")
            }
        }
        for index in metadata.parameters.indices {
            let value = module.parameters[safe: index] ?? 0
            parts.append("\(metadata.parameters[index].label): \(format(value))")
        }
        return parts.isEmpty ? "Default" : parts.joined(separator: ", ")
    }

    private func format(_ value: Double) -> String {
        if value.rounded() == value {
            return String(Int(value))
        }
        return String(format: "%.3f", value)
    }

    private func numericTag(_ index: Int) -> Int { index }
    private func stringTag(_ index: Int) -> Int { 1000 + index }
}

private extension Array {
    subscript(safe index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
