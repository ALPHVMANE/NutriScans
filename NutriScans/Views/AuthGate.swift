//
//  AuthGate.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-03.
//

import SwiftUI

struct AuthGate: View {
    
    @State private var showLogin = true

    var body: some View {
        VStack{
            Picker("", selection: $showLogin) {
                Text("Login").tag(true)
                Text("Register").tag(false)
            }
            .pickerStyle(.segmented)
            .padding()
            
            
            if showLogin {
                // Login View
                LoginView()
            }else {
                // Register view
                RegisterView()
            }
        }
    }
}

#Preview {
    AuthGate()
}
