//
//  LoginView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-03.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var displayName = ""
    @State private var errorMessage: String?
    
    @StateObject private var auth = AuthService.shared

    
    var body: some View {
        Form{
            Section("Login") {
                TextField("Enter Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                
                SecureField("Password (Min 6 characters)", text: $password)
                
            }
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
            
            
            Button("Login"){
                
                // validations
                guard Validators.isValidEmail(email) else {
                    self.errorMessage = "Invalid Email"
                    return
                }
                
                guard Validators.isValidPassword(password) else {
                    self.errorMessage = "Invalid Passwrd"
                    return
                }
                
                // auth.sign up
                auth.login(email: email, password: password) { result in
                                    switch result {
                                    case .success:
                                        errorMessage = nil
                                    case .failure(let err):
                                        errorMessage = err.localizedDescription
                                    }
                                }
                
                
            }
            .disabled(email.isEmpty || password.isEmpty)
        }

    }
}

#Preview {
    LoginView()
}
