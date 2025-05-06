//
//  ShopListViewBuilder.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 06/05/2025.
//
import SwiftUI
import SwiftData

struct ShopListViewBuilder<ShopListView2: View, PurchasedShopListView2: View>: View {
    
    @ViewBuilder var shopList2 :ShopListView2
    @ViewBuilder var purchasedShopList2: PurchasedShopListView2
    
    var body: some View {
        VStack{
            NavigationStack {
                List {
                    Section {
                        shopList2
                    } header: {
                        HStack {
                            Text("Lista")
                            Image(systemName: "list.bullet.clipboard")
                        }
                        .font(.title)
                    }
                    .navigationTitle("Zakupy")
                    
                    Section {
                        purchasedShopList2
                    } header: {
                        Label("Kupione", systemImage: "checkmark")
                            .font(.title2)
                    }
                }
                
                Button {
                    
                    
                } label: {
                    Text("Wyczyść")
                }
            }
            Spacer()
            TextFieldView()
        }
    }
    
}


