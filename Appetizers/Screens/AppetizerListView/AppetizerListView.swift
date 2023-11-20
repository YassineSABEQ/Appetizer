//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 29/10/2023.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetails = true
                        }
                }
                .navigationTitle("🌮 Appetizers")
                .disabled(viewModel.isShowingDetails)
            }
            
            // Similar to onAppear, benefits of task, it puts you in async context, which means you can use your async await code and what happens if the user ,avigates away from the screen before the newtork call complets, it automatically cancels the network call
            // basically tailor made for making a newtwork call before the view appears
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetails ? 20 : 0)
            
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .transition(.opacity)
            }
            
            if viewModel.isShowingDetails {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!,
                                    isShowingDetail: $viewModel.isShowingDetails)
            }
        }
        
        .alert(item: $viewModel.alertItem) { item in
            Alert(title: item.title,
                  message: item.message,
                  dismissButton: item.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

