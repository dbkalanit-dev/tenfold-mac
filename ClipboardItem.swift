import Foundation

struct ClipboardItem: Identifiable {
    let id: Int // 1-10
    var content: String
    var timestamp: Date
    
    // We'll add more properties here later (like data type or masking)
}
