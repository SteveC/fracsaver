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
    private var selectedIndex = 0

    init(settings: FracSettings, onSave: @escaping (FracSettings) -> Void) {
        self.settings = settings
        self.onSave = onSave
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 920, height: 600),
            styleMask: [.titled],
            backing: .buffered,
            defer: false
        )
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
        settings.modules.count
    }

    func tableViewSelectionDidChange(_ notification: Notification) {
        if tableView.selectedRow >= 0 {
            selectedIndex = tableView.selectedRow
            refreshInspector()
        }
    }

    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard row < settings.modules.count else { return nil }
        let module = settings.modules[row]
        switch tableColumn?.identifier.rawValue {
        case "enabled":
            let button = NSButton(checkboxWithTitle: "", target: self, action: #selector(toggleModule(_:)))
            button.state = module.enabled ? .on : .off
            button.tag = row
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
        split.spacing = 14
        split.alignment = .top
        split.addArrangedSubview(makeTable())
        split.addArrangedSubview(makeInspector())
        return split
    }

    private func makeTable() -> NSScrollView {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.usesAlternatingRowBackgroundColors = true
        tableView.headerView = NSTableHeaderView()
        tableView.addTableColumn(column("enabled", title: "", width: 36))
        tableView.addTableColumn(column("name", title: "Module", width: 180))
        tableView.addTableColumn(column("category", title: "Group", width: 90))
        tableView.addTableColumn(column("summary", title: "Settings", width: 180))

        let scroll = NSScrollView()
        scroll.hasVerticalScroller = true
        scroll.documentView = tableView
        scroll.widthAnchor.constraint(equalToConstant: 520).isActive = true
        scroll.heightAnchor.constraint(equalToConstant: 400).isActive = true
        return scroll
    }

    private func makeInspector() -> NSView {
        let stack = NSStackView()
        stack.orientation = .vertical
        stack.spacing = 10
        stack.widthAnchor.constraint(equalToConstant: 330).isActive = true

        moduleTitle.font = .systemFont(ofSize: 18, weight: .semibold)
        moduleDescription.font = .systemFont(ofSize: 12)
        moduleDescription.textColor = .secondaryLabelColor
        moduleDescription.maximumNumberOfLines = 4

        parameterStack.orientation = .vertical
        parameterStack.spacing = 8

        stack.addArrangedSubview(moduleTitle)
        stack.addArrangedSubview(moduleDescription)
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
        parameterStack.arrangedSubviews.forEach { view in
            parameterStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        if metadata.parameters.isEmpty && metadata.stringParameters.isEmpty {
            let none = label("No editable module settings.")
            none.textColor = .secondaryLabelColor
            parameterStack.addArrangedSubview(none)
            return
        }

        for index in metadata.stringParameters.indices {
            parameterStack.addArrangedSubview(fieldRow(metadata.stringParameters[index], value: module.stringParameters[safe: index] ?? "", tag: stringTag(index)))
        }
        for index in metadata.parameters.indices {
            parameterStack.addArrangedSubview(fieldRow(metadata.parameters[index], value: format(module.parameters[safe: index] ?? 0), tag: numericTag(index)))
        }
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
        tableView.reloadData(forRowIndexes: IndexSet(integer: sender.tag), columnIndexes: IndexSet(integersIn: 0..<tableView.numberOfColumns))
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
        tableView.reloadData(forRowIndexes: IndexSet(integer: selectedIndex), columnIndexes: IndexSet(integer: 3))
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
