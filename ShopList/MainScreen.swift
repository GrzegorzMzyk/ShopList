//
//  MainScreen.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 07/04/2025.
//

import SwiftUI
import SwiftData


struct MainScreen: View {
    
    @Environment(\.modelContext) private var context
    @Query private var itemsToBuy: [Items]
    
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(itemsToBuy, id: \.self) { fruit in
                        Text(fruit.nameItem.capitalized)
                            .font(.caption)
                            .foregroundStyle(Color.white)
                            .padding()
                            .background(Color.pink)
                    }
                    .onDelete(perform: delete)
                    .listRowBackground(Color.green)
                    
                } header: {
                    HStack {
                        Text("Zakupy")
                        Image(systemName: "list.bullet.clipboard")
                       
                    }
                    .font(.title)
                }
                
                
                .tint(.green)
                .navigationTitle("Grocery List")
            }
            .tint(.red)
        }
        
        Spacer()
        
        TextFieldView()

    }
    
    
    

    
    func delete(indexSet: IndexSet) {
        for index in indexSet {
            let item = itemsToBuy[index]
            context.delete(item)
            
        }
    }
}
    


#Preview {
    MainScreen()
        .modelContainer(for: Items.self, inMemory: true)
}
