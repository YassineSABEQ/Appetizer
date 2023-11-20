//
//  ListCellImageStyle.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 20/11/2023.
//

import SwiftUI

struct ListCellImageStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fit)
            .frame(width: 120.0, height: 90.0)
            .cornerRadius(8)
    }
}
