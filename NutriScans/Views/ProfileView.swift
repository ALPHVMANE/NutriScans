//
//  ProfileView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-06.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var auth = AuthService.shared
    @State private var newName = ""
    @State private var errorText: String?
    
    init(){
          
          UITableView.appearance().backgroundColor = .clear
      }
    
    var body: some View {
        VStack(spacing: 12) {
            
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: 0x271d1c))
                .frame(height: 50)
            ZStack {
                // Cover banner
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: 0x534342))
                    .frame(height: 120)
                
                // Overlapping avatar
                VStack {
                    Image("Cereal")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
                .padding(.bottom, -90) // pushes avatar outside the banner
            }
            .padding(.horizontal)
            
            
            // Name
            VStack(spacing: 8) {
                Text(auth.currentUser?.displayName ?? "None")
                    .font(.title2)
                    .foregroundStyle(Color(hex: 0xffb3ad))
                Text(auth.currentUser?.email ?? "None")
                    .font(.subheadline)
                    .foregroundStyle(Color(hex: 0xffb3ad))
                
            }.padding(.top, 60)
            
            Spacer()
            
            Form {
                Section("Update  Name") {
                    TextField("New Display Name", text: $newName)
                    
                    Button("Save") {
                        guard !newName.trimmingCharacters(in: .whitespaces).isEmpty else {
                            errorText = "Display name cannot be empty"
                            return
                        }
                        
                        auth.updateProfile(displayName: newName) { result in
                            switch result {
                            case .success:
                                newName = ""
                                errorText = nil
                            case .failure(let err):
                                errorText = err.localizedDescription
                            }
                        }
                    }
                }.foregroundStyle(Color(hex: 0xffdad6))
                    .padding(.top,10)
                
                
                if let errorText {
                    Text(errorText)
                        .foregroundColor(.red)
                }
                
                Button(role: .destructive, action: {
                    let result = auth.signOut()
                    if case .failure(let err) = result {
                        errorText = err.localizedDescription
                    } else {
                        errorText = nil
                    }
                }) {
                    Text("Sign Out")
                }
            }.onAppear {
                auth.fetchCurrentAppUser { _ in }
               
            }.scrollContentBackground(.hidden)
                .background(Color(hex: 0x1a1110))
        }.background(Color(hex: 0x271d1c))
    }
}

#Preview {
    ProfileView()
}
