//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 6/11/2023.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            VStack {
                Image("asian-flank-steak")
                        .resizable()
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
                    VStack (spacing: 6) {
                        Text("Calories")
                            .fontWeight(.regular)
                        Text("700")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                    }
                    VStack (spacing: 6) {
                        Text("Calories")
                            .fontWeight(.regular)
                        Text("700")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                    }
                    VStack (spacing: 6) {
                        Text("Calories")
                            .fontWeight(.regular)
                        Text("700")
                            .foregroundColor(.secondary)
                            .fontWeight(.semibold)
                    }
                }
                .padding(33)
                Spacer()
                Button {
                    //
                } label : {
                    Text("\(appetizer.price, specifier: "%.2f") $ - Add To Order")
                        .frame(width: 280, height: 50)
                        .background(Color("brandPrimary"))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                }
            .padding(.bottom,30)
        }
        .frame(width: 320, height: 580, alignment: .center)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            //
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        },
                 alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer)
    }
}
