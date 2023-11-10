//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 6/11/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            VStack {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                        .frame(height: 225)
//                        .aspectRatio(contentMode: .fit)
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .foregroundColor(.secondary)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                HStack (spacing: 30) {
                    NutritionInfo(title: "Calories",
                                  value: appetizer.calories)
                    NutritionInfo(title: "Carbs",
                                  value: appetizer.carbs)
                    NutritionInfo(title: "Protein",
                                  value: appetizer.protein)
                }
                .padding(33)
                Spacer()
                Button {
                    
                } label : {
                    APButton(title: "\(appetizer.price, specifier: "%.2f") $ - Add To Order")
                }
                }
            .padding(.bottom,30)
        }
        .frame(width: 320, height: 580, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            XDismissButton()
        },
                 alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                            isShowingDetail: .constant(true))
    }
}

struct NutritionInfo: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack (spacing: 6) {
            Text(title)
                .fontWeight(.regular)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
        }
    }
}
