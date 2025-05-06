//
//  PrewiewView.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 06/05/2025.
//
import SwiftUI

struct PrewiewView: View {

    var body: some View {
        ShopListViewBuilder {
            ShopList()
        } purchasedShopList2: {
            PurchasedShopList()
        }

    }
}
#Preview {
    PrewiewView()
        .modelContainer(for: Items.self)
}
