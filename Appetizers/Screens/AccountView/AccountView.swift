//
//  AccountView.swift
//  Appetizers
//
//  Created by Yassine Sabeq on 29/10/2023.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewViewModel()
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Info")) {
                    TextField("First Name", text: $viewModel.user.firstName)

                    TextField("Last Name", text: $viewModel.user.lastName)

                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                   
                    DatePicker("BirthDay",
                               selection: $viewModel.user.birthdate, displayedComponents: .date)

                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                }
                .tint(Color("brandPrimary"))
            }
            .navigationTitle("🤣 Account") 
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
