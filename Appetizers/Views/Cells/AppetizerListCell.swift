//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 30/10/2023.
//

import SwiftUI

struct AppetizerListCell: View {
    
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
//            Image("asian-flank-steak")
                .aspectRatio(contentMode: .fit)
                .frame(width: 120.0, height: 90.0)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("\(appetizer.price, specifier: "%.2f") $")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
