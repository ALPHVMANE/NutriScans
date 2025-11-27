//
//  AuthGate.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-03.
//

import SwiftUI

struct AuthGate: View {
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(hex: "#534342FF")
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(hex: "#FFb3ADFF")], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(hex: "#C9CB77FF")], for: .normal)
    }
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
        }.background(Color(hex: 0x1a1111))
    }
}

#Preview {
    AuthGate()
}
