//
//  ContentView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-02.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @StateObject private var auth = AuthService.shared
    @State private var isLoaded = false
    
    
    var body: some View {
        Group{
            
            if !isLoaded{
                ProgressView()
                    .onAppear {
                        auth.fetchCurrentAppUser { _ in
                            isLoaded = true
                        }
                    }
            } else {
                TabScreen()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
