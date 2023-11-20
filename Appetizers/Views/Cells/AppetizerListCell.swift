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
            // if caching is important, we use the following AppetizerRemoteImage
            //            AppetizerRemoteImage(urlString: appetizer.imageURL)
            
            // available in iOS 15, if caching is not important, we use AsyncImage
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
            }
            .modifier(ListCellImageStyle())
            
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
