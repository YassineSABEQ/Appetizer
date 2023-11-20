//
//  ContentView.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 29/10/2023.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var order: Order
        
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .badge(order.items.count)
        }
        .tint(Color("brandPrimary"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView()
    }
}
