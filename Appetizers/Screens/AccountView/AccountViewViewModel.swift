//
//  AccountViewViewModel.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 12/11/2023.
//

import SwiftUI

final class AccountViewViewModel: ObservableObject {
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var birthDay = Date()
    @Published var isExtraNapkins = true
    @Published var isFrequentRefills = false
    @Published var alertItem: AlertItem?
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    
    var isValidForm: Bool {
        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        print("Changes have been saved")
    }
    
}
