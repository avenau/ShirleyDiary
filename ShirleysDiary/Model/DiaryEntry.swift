import Foundation
import SwiftData

@Model
class DiaryEntry {
    var content: String
    var date: Date
    
    init(content: String = "", date: Date = .now) {
        self.content = content
        self.date = date
    }
} 