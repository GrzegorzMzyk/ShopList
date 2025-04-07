//
//  Model.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 07/04/2025.
//

import Foundation
import SwiftData

@Model
class Items {
    var nameItem: String
    init(nameItem: String) {
        self.nameItem = nameItem
    }
}
