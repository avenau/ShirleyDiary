//
//  Item.swift
//  DearDiary
//
//  Created by Aven Au on 19/1/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
