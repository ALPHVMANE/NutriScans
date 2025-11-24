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
        VStack{
            Spacer()

            Text("Login")
                .font(.custom("Colus-Regular", size: 30))
                .foregroundColor(Color(hex: 0xc9cb77))
                .padding(.bottom, -10)
            Form{
                Section("") {
                    TextField("", text: $email, prompt: Text("Email").foregroundColor(.gray))
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                        .foregroundStyle(Color(hex: 0x7e8039))
                    SecureField("", text: $password, prompt: Text("Password (Min 6 characters)").foregroundColor(.gray))

                        .foregroundColor(Color(hex: 0x7e8039))
                    
                }.listRowBackground(Color(hex: 0x394c4c))
                    .foregroundStyle(Color(hex: 0xffb3af))
                
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(Color(hex: 0xffdad6))
                        .listRowBackground(Color(hex: 0x93000a))
                }
                
                

                Button(action: {
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
                }){
                    
                    HStack(){
                        Text("Log In")
                            .foregroundStyle(Color(hex:0x1a1111))
                        Image(systemName: "iphone.and.arrow.right.inward")
                            .foregroundStyle(Color(hex:0x1a1111))
                    }.frame(maxWidth: .infinity, alignment: .center)
                    
                }.listRowBackground(Color(hex: 0x5f6935))
                    .foregroundStyle(Color(hex:0x1a1111))
                    .disabled(email.isEmpty || password.isEmpty)
                    
                
            }.scrollContentBackground(.hidden)
                .background(Color(hex: 0x1a1110))
                .frame(maxWidth: .infinity, maxHeight: 500)
                .scrollDisabled(true)
            
        }.background(Color(hex: 0x1a1110))
    }
}

#Preview {
    LoginView()
}
