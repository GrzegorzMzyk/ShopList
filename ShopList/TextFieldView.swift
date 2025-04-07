//
//  TextFieldView.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 07/04/2025.
//

import SwiftUI
import SwiftData


struct TextFieldView: View {
    
    @Environment(\.modelContext) private var context
//    @Query private var itemsToBuy: [Items]
    
    
    @State private var nameItem: String = ""

    var body: some View {
        VStack(spacing: 16) {
            TextField("Wpisz coś...", text: $nameItem)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Dodaj") {
               add()
            }
            .buttonStyle(.borderedProminent)
        }
        
        .padding()
    }
    
    
    func add() {
        let newItem = Items(nameItem: nameItem)
        context.insert(newItem)
    }
}
#Preview {
    TextFieldView()
}
