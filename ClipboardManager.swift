import SwiftUI
import AppKit

@Observable
class ClipboardManager {
    var items: [ClipboardItem] = [] 
    
    init() {
        for i in 1...10 {
            items.append(ClipboardItem(id: i, content: "", timestamp: Date()))
        }
    }
    
    func addContent(_ newContent: String) {
        var currentContents = items.map { $0.content }
        
        if let index = currentContents.firstIndex(of: newContent) {
            currentContents.remove(at: index)
        }
        
        currentContents.insert(newContent, at: 0)
        let tenItems = currentContents.prefix(10)
        
        for i in 0..<10 {
            if i < tenItems.count {
                items[i].content = String(tenItems[i])
            } else {
                items[i].content = ""
            }
        }
    }
}
