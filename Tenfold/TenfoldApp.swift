import SwiftUI

@main
struct TenfoldApp: App {
    @State private var manager = ClipboardManager()
    
    init() {
        let checkOptionPrompt = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString
        let options = [checkOptionPrompt: true]
        AXIsProcessTrustedWithOptions(options as CFDictionary)
    }

    var body: some Scene {
        MenuBarExtra("Tenfold", image: "MenuBarIcon") {
            MenuContentView(manager: manager)
        }
        .menuBarExtraStyle(.window) // Uses a window-like popover
    }
}

// This helper view handles the logic that couldn't be in the Scene
struct MenuContentView: View {
    var manager: ClipboardManager
    @State private var monitor: ClipboardMonitor?
    
    var body: some View {
        ContentView(manager: manager)
            .frame(width: 300, height: 400)
            .onAppear {
                self.monitor = ClipboardMonitor(manager: manager)
                HotkeyManager.shared.registerHotkeys(manager: manager)
            }
    }
}
