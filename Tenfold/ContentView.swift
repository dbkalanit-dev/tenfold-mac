import SwiftUI

struct ContentView: View {
    var manager: ClipboardManager
    @State private var isTrusted = AXIsProcessTrusted()

    var body: some View {
        Group {
            if isTrusted {
                List(manager.items, id: \.id) { item in
                    HStack {
                        Text("\(item.id).")
                            .fontWeight(.bold)
                            .frame(width: 25, alignment: .leading)
                        Text(item.content.isEmpty ? "(Empty)" : item.content)
                            .lineLimit(1)
                    }
                }
            } else {
                VStack(spacing: 20) {
                    Text("Tenfold needs Accessibility Access.")
                        .font(.headline)
                    Text("1. Open System Settings > Privacy & Security > Accessibility.")
                    Text("2. Find 'Tenfold' in the list and toggle it ON.")
                    Button("Open Settings") {
                        let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility")!
                        NSWorkspace.shared.open(url)
                    }
                }
                .padding()
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
            let wasTrusted = isTrusted
            isTrusted = AXIsProcessTrusted()
            if !wasTrusted && isTrusted {
                HotkeyManager.shared.registerHotkeys(manager: manager)
            }
        }
    }
}
