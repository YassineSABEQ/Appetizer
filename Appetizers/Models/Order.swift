//
//  Order.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 17/11/2023.
//

import Foundation

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        items.reduce(0) {$0 + $1.price}
    }
    
    func addItem(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func deleteItem(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
}
