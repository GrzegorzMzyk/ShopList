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
        ZStack{
        VStack(spacing: 16) {
            TextField("min 3 znaki", text: $nameItem)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .background(Color.gray.opacity(0.3).clipShape(RoundedRectangle(cornerRadius: 10)))
                .font(.headline)
            
            Button(action: {
                if textIsAppropriate() {
                    add()
                }
            }, label: {
                Text("Dodaj 🤑 ".uppercased())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(textIsAppropriate() ? Color.green : Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(Color.white)
                    .font(.headline)
            })
            .disabled(!textIsAppropriate())
        }
        
        .padding()
        }
        .background(Color.accentColor)
        
    }
    
    
    func add() {
        
        let newItem = Items(nameItem: nameItem)
        context.insert(newItem)
        nameItem = ""
    }
    func textIsAppropriate() -> Bool {
        if nameItem.count >= 3 {
            return true
        }
        return false
    }
    
}
#Preview {
    TextFieldView()
}
