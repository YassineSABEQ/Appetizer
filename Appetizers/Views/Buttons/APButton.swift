//
//  APButton.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 10/11/2023.
//

import SwiftUI

struct APButton: View {
    
    let title: LocalizedStringKey
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(Color("brandPrimary"))
            .font(.system(size: 20, weight: .bold, design: .default))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Title Button")
    }
}

