import AppKit

final class FracSettingsWindowController: NSWindowController, NSTableViewDataSource, NSTableViewDelegate {
    private var settings: FracSettings
    private let onSave: (FracSettings) -> Void
    private let tableView = NSTableView()
    private let secondsField = NSTextField()
    private let scaleSlider = NSSlider()
    private let showNameCheckbox = NSButton(checkboxWithTitle: "Show module name", target: nil, action: nil)

    init(settings: FracSettings, onSave: @escaping (FracSettings) -> Void) {
        self.settings = settings
        self.onSave = onSave
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 720, height: 520),
            styleMask: [.titled],
            backing: .buffered,
            defer: false
        )
        window.title = "FracSaver Settings"
        super.init(window: window)
        buildUI(in: window)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func numberOfRows(in tableView: NSTableView) -> Int {
        settings.modules.count
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
            return label(module.name)
        case "category":
            return label(module.category)
        case "parameters":
            let field = NSTextField()
            field.isBordered = true
            field.isBezeled = true
            field.font = .monospacedSystemFont(ofSize: 12, weight: .regular)
            field.stringValue = parameterText(for: module)
            field.tag = row
            field.target = self
            field.action = #selector(updateParameters(_:))
            return field
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

        let controls = NSGridView(views: [
            [label("Seconds per module"), secondsField],
            [label("Render detail"), scaleSlider],
            [NSView(), showNameCheckbox]
        ])
        controls.column(at: 0).xPlacement = .trailing
        controls.column(at: 1).width = 280
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

        root.addArrangedSubview(controls)
        root.addArrangedSubview(makeTable())
        root.addArrangedSubview(makeButtons())
    }

    private func makeTable() -> NSScrollView {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.usesAlternatingRowBackgroundColors = true
        tableView.headerView = NSTableHeaderView()
        tableView.addTableColumn(column("enabled", title: "", width: 42))
        tableView.addTableColumn(column("name", title: "Module", width: 220))
        tableView.addTableColumn(column("category", title: "Category", width: 130))
        tableView.addTableColumn(column("parameters", title: "Parameters", width: 250))

        let scroll = NSScrollView()
        scroll.hasVerticalScroller = true
        scroll.documentView = tableView
        scroll.heightAnchor.constraint(equalToConstant: 350).isActive = true
        return scroll
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
    }

    @objc private func updateParameters(_ sender: NSTextField) {
        guard sender.tag < settings.modules.count else { return }
        if settings.modules[sender.tag].id == "ThrowPic" {
            let parts = sender.stringValue.split(separator: ",", maxSplits: 1).map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
            if let path = parts.first {
                settings.modules[sender.tag].stringParameters = [path]
            }
            if parts.count > 1, let seconds = Double(parts[1]) {
                settings.modules[sender.tag].parameters = [max(1, seconds)]
            }
            sender.stringValue = parameterText(for: settings.modules[sender.tag])
            return
        }
        let values = sender.stringValue
            .split(separator: ",")
            .compactMap { Double($0.trimmingCharacters(in: .whitespacesAndNewlines)) }
        if values.count == settings.modules[sender.tag].parameters.count {
            settings.modules[sender.tag].parameters = values
        } else {
            sender.stringValue = parameterText(for: settings.modules[sender.tag])
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
        tableView.reloadData()
    }

    @objc private func cancel() {
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

    private func format(_ value: Double) -> String {
        if value.rounded() == value {
            return String(Int(value))
        }
        return String(format: "%.3f", value)
    }

    private func parameterText(for module: FracModule) -> String {
        if module.id == "ThrowPic" {
            let path = module.stringParameters.first ?? ""
            let seconds = module.parameters.first ?? 10
            return "\(path), \(format(seconds))"
        }
        return module.parameters.map { format($0) }.joined(separator: ", ")
    }
}
