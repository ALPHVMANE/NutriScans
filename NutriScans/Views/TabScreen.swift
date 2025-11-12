//
//  TabScreen.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-03.
//

import SwiftUI


struct TabScreen: View {
    
    @StateObject private var auth = AuthService.shared
    
    var body: some View {
        TabView{
            
            HomeView()
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            CameraView()
                .tabItem{
                    Image(systemName: "barcode.viewfinder")
                    Text("Scanner")
                }
            if(auth.currentUser == nil){
                AuthGate()
                    .tabItem{
                        Image(systemName: "lock.fill")
                        Text("Login/Register")
                    }
            } else{
                ProfileView()
                    .tabItem{
                        Image(systemName:"person.fill")
                        Text("Profile")
                    }
            }
        }.accentColor(Color(hex: 0x5f6935))
//        .onAppear() {
//            UITabBar.appearance().backgroundColor = UIColor(hex:"#904a48ff")
//        }
    }
}


#Preview {
    TabScreen()
}
