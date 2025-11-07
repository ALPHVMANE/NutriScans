//
//  DashboardView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-03.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack{
            ZStack{
                
                Rectangle()
                    .fill(Color(hex: 0x733332))
                    .frame(width: 450, height: 100)
                    .opacity(0.8)
                Text("NutriScan")
                    .font(.custom("Colus-Regular",size: 67))
                    .foregroundColor(Color(hex: 0x7e8139))
                    .padding(2)
                
                
            }.background(Image("BgHome"))
            HStack{
                Spacer()
                Rectangle()
                    .fill(Color(hex: 0x1a3b4d))
                    .frame(width: 190, height: 30)
                    .opacity(0.8)
            }
        }
    }
}

#Preview {
    HomeView()
}
