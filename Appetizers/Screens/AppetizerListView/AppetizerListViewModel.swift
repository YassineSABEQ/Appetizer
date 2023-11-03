//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 2/11/2023.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case let .success(response):
                    self.appetizers = response
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
