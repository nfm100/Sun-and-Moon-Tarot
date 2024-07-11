//
//  Item.swift
//  SunAndMoonTarot
//
//  Created by Nicholas Miravich on 7/10/24.
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
