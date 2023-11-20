//
//  CustomModifier.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 18/11/2023.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .tint(Color("brandPrimary"))
            .controlSize(.large)
    }
}
