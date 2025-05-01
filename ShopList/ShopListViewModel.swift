//
//  ShopListViewModel.swift
//  ShopList
//
//  Created by Grzegorz Mzyk on 22/04/2025.
//


import SwiftUI
import SwiftData

struct ShopListViewModel: View {
    @Query private var itemsToBuy: [Items]
    
    let items: [Items]
    let swipeEdge: HorizontalEdge
    let swipeLabel: String
    let swipeIcon: String
    let swipeColor: Color
    let swipeAction: (Items) -> Void
    let rowBackground: Color
    let onDelete: ((IndexSet) -> Void)?
    
    var body: some View {
        ForEach(items, id: \.persistentModelID) { item in
            TextRowInList(items: item)
                .swipeActions(edge: swipeEdge) {
                    Button {
                        swipeAction(item)
                    } label: {
                        Label(swipeLabel, systemImage: swipeIcon)
                    }
                    .tint(swipeColor)
                }
        }
        .onDelete(perform: onDelete)
        .listRowBackground(rowBackground)
    }
}



struct ShopList: View {
    
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate { !$0.isDone }, sort: \Items.timestamp, order: .reverse)
    
    private var itemsToBuy: [Items]
    
    var body: some View {
        ShopListViewModel(
            items: itemsToBuy,
            swipeEdge: .leading,
            swipeLabel: "Na dół",
            swipeIcon: "checkmark.square.fill",
            swipeColor: .green,
            swipeAction: { item in
                markAsBought(items: item)
            },
            rowBackground: Color.accentColor,
            onDelete: delete
        )
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


struct PurchasedShopList: View {
    
    @Environment(\.modelContext) private var context
    @Query(filter: #Predicate { $0.isDone == true }, sort: \Items.timestamp, order: .reverse)
   
    private var boughtItems: [Items]
    
    var body: some View {
        ShopListViewModel(
            items: boughtItems,
            swipeEdge: .trailing,
            swipeLabel: "Cofnij",
            swipeIcon: "arrow.uturn.left",
            swipeColor: .orange,
            swipeAction: { item in
                item.isDone = false
            },
            rowBackground: Color.gray,
            onDelete: deleteBoughtItems
        )
    }
    
    func deleteBoughtItems(indexSet: IndexSet) {
        for index in indexSet {
            let item = boughtItems[index]
            context.delete(item)
        }
    }
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
