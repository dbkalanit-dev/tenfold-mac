import Cocoa
import Carbon
import ApplicationServices

class HotkeyManager {
    static let shared = HotkeyManager()
    
    // This is the property ClipboardMonitor is looking for
    static var shouldIgnoreNextChange = false
    
    init() {
        let checkOptionPrompt = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString
        let options = [checkOptionPrompt: true]
        let isTrusted = AXIsProcessTrustedWithOptions(options as CFDictionary)
        
        if !isTrusted {
            print("Tenfold needs Accessibility permissions.")
        }
    }
    
    func registerHotkeys(manager: ClipboardManager) {
        NSEvent.addGlobalMonitorForEvents(matching: .keyDown) { event in
            if event.modifierFlags.contains([.command, .option, .control]) {
                if let characters = event.charactersIgnoringModifiers, let index = Int(characters) {
                    let slotIndex = (index == 0) ? 9 : index - 1
                    self.performPaste(index: slotIndex, manager: manager)
                }
            }
        }
    }
    
    private func performPaste(index: Int, manager: ClipboardManager) {
        guard index >= 0 && index < manager.items.count else { return }
        let content = manager.items[index].content
        guard !content.isEmpty else { return }
        
        // Tell the monitor to ignore the next clipboard change
        HotkeyManager.shouldIgnoreNextChange = true
        
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(content, forType: .string)
        
        let source = CGEventSource(stateID: .hidSystemState)
        let vKey: CGKeyCode = 0x09
        
        let keyDown = CGEvent(keyboardEventSource: source, virtualKey: vKey, keyDown: true)
        keyDown?.flags = .maskCommand
        keyDown?.post(tap: .cghidEventTap)
        
        let keyUp = CGEvent(keyboardEventSource: source, virtualKey: vKey, keyDown: false)
        keyUp?.flags = .maskCommand
        keyUp?.post(tap: .cghidEventTap)
        
        // Reset the flag after a short delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            HotkeyManager.shouldIgnoreNextChange = false
        }
    }
}
