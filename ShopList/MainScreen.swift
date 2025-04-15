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
    
    @Query(filter: #Predicate { !$0.isDone }, sort: \Items.timestamp, order: .reverse)
    private var itemsToBuy: [Items]

    @Query(filter: #Predicate { $0.isDone }, sort: \Items.timestamp, order: .reverse)
    private var boughtItems: [Items]
 
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(itemsToBuy, id: \.self) { items in
                        TextRowInList(items: items)
                            .swipeActions(edge: .leading) {
                                Button {
                                    markAsBought(items: items)
                                } label: {
                                    Label("Na dół", systemImage: "arrow.down")
                                }
                            }
                    }
                    .onDelete(perform: delete)
                    .listRowBackground(Color.accentColor)
                } header: {
                    HStack {
                        Text("Lista")
                        Image(systemName: "list.bullet.clipboard")
                       
                    }
                    .font(.title)
                }
                .navigationTitle("Zakupy")
                
                Section {
                    ForEach(boughtItems, id: \.self) { items in
                        TextRowInList(items: items)
                            .swipeActions(edge: .trailing) {
                                Button {
                                               items.isDone = false
                                           } label: {
                                               Label("Cofnij", systemImage: "arrow.uturn.left")
                                           }
                            }
                    }
                    .listRowBackground(Color.gray)
                } header: {
                    Label("Kupione", systemImage: "checkmark")
                        .font(.title2)
                }
                  
             
            }
            Button {
                deleteBoughtItems()
            } label: {
                Text("Wyczyść")
            }

        }
     
        
        Spacer()
        
        TextFieldView()

    }
    func deleteBoughtItems() {
        for item in boughtItems {
            context.delete(item)
        }
    }
    
    func markAsBought(items: Items) {
        items.isDone = true
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



struct TextRowInList: View {
    let items: Items
    var body: some View {

        Text(items.nameItem.capitalized)
            .font(.title2)
            .foregroundStyle(Color.white)
            .padding()
    }
}
