//
//  MainScreen.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 07/04/2025.
//

import SwiftUI
import SwiftData


struct MainScreen: View {
    
    var body: some View {
        
        VStack{
            NavigationStack {
                List {
                    Section {
                        ShopList()
                    } header: {
                        HStack {
                            Text("Lista")
                            Image(systemName: "list.bullet.clipboard")
                        }
                        .font(.title)
                    }
                    .navigationTitle("Zakupy")
                    
                    Section {
                        PurchasedShopList()
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
#Preview {
    MainScreen()
        .modelContainer(for: Items.self)
}







