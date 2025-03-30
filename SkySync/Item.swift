//
//  Item.swift
//  SkySync
//
//  Created by Carlos Hernandez on 3/29/25.
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
