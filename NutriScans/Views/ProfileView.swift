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
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color(hex: 0x271d1c))
                .frame(height: 30)
            ZStack {
                // Cover banner
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color(hex: 0x534342))
                    .frame(height: 150)
                
                // Overlapping avatar
                VStack {
                    Image("HomeLogo")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                }
                .padding(.bottom, -110) // pushes avatar outside the banner
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
                Section() {
                    TextField("", text: $newName, prompt: Text("Change your name").foregroundColor(.gray))
                        .foregroundStyle(Color(hex: 0x7e8039))

                    
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
                    }.foregroundStyle(Color(hex: 0xc9cb77))
                }
                .listRowBackground(Color(hex: 0x394c4c))
                .foregroundStyle(Color(hex: 0xffb3af))
                    .padding(.top,10)
                
                
                if let errorText {
                    Text(errorText)
                        .foregroundColor(Color(hex: 0xffdad6))
                        .listRowBackground(Color(hex: 0x93000a))
                }
                
                
                Button(role: .destructive, action: {
                    let result = auth.signOut()
                    if case .failure(let err) = result {
                        errorText = err.localizedDescription
                    } else {
                        errorText = nil
                    }
                }) {
                    HStack(){

                        Text("Log Out")
             .foregroundStyle(Color(hex:0x1a1111))
                        Image(systemName: "iphone.and.arrow.right.outward")
                            .foregroundStyle(Color(hex:0x1a1111))
                    }

                }.listRowBackground(Color(hex: 0x5f6935))
                    .frame(width: 400, alignment: .init(horizontal: .center, vertical: .center))
            

                
            }.onAppear {
                auth.fetchCurrentAppUser { _ in }
               
            }.scrollContentBackground(.hidden)
                .frame(height: 450)

                .background(Color(hex: 0x1a1110))
                .clipShape(
                    .rect(
                        topLeadingRadius: 40,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 40
                    )
                )
                .padding(.bottom, -50)
        }.background(Color(hex: 0x271d1c))
        
    }
}

#Preview {
    ProfileView()
}
