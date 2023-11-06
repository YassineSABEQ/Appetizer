//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 2/11/2023.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case let .success(response):
                    self.appetizers = response
                case let .failure(error):
                    switch error {
                    case .invalidData :
                        self.alertItem = AlertContext.invalidData
                    case .invalidResponse :
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL :
                        self.alertItem = AlertContext.invalidURL
                    case .unableToComplete :
                        self.alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
