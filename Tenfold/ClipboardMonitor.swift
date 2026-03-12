import AppKit

class ClipboardMonitor {
    private var lastChangeCount: Int
    private let pasteboard: NSPasteboard
    private let manager: ClipboardManager
    
    init(manager: ClipboardManager) {
        self.manager = manager
        self.pasteboard = NSPasteboard.general
        self.lastChangeCount = pasteboard.changeCount
        startMonitoring()
    }
    
    private func startMonitoring() {
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { [weak self] _ in
            self?.checkClipboard()
        }
    }
    
    private func checkClipboard() {
        if pasteboard.changeCount != lastChangeCount {
            
            if HotkeyManager.shouldIgnoreNextChange {
                lastChangeCount = pasteboard.changeCount
                return
            }
            
            
            HotkeyManager.shouldIgnoreNextChange = false
            
            lastChangeCount = pasteboard.changeCount
            
            if let newContent = pasteboard.string(forType: .string) {
                DispatchQueue.main.async {
                    self.manager.addContent(newContent)
                }
            }
        }
    }
}
