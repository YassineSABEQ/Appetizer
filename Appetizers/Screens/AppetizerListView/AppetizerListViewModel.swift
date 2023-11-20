//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 2/11/2023.
//

import Foundation

// by marking this view model @MainActor, anything that happens in this view model that's ui-related will be rerouted to the main thread, it's the equivalent of DispatchQueue.main.async
@MainActor final class AppetizerListViewModel: ObservableObject {
    
   @Published var appetizers: [Appetizer] = []
   @Published var alertItem: AlertItem?
   @Published var isLoading = false
   @Published var isShowingDetails = false
   @Published var selectedAppetizer: Appetizer?
    
    func getAppetizers() {
        isLoading = true
        
        // or you can add async to the end of the function signature
        Task {
            do {
                self.appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apiError = error as? APIError {
                    switch apiError {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                } else {
                    self.alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
