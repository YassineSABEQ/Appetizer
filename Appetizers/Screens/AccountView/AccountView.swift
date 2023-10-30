//
//  AccountView.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 29/10/2023.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationStack {
            Text("Account View")
                .navigationTitle("👨 Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
