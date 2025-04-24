//
//  Model.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 07/04/2025.
//

import Foundation
import SwiftData

@Model
final class Items {
    var nameItem: String
    var timestamp: Date
    var isDone: Bool
    
    init(nameItem: String, timestamp: Date = Date(), isDone: Bool = false) {
       self.nameItem = nameItem
        self.timestamp = timestamp
        self.isDone = isDone
    }
}
