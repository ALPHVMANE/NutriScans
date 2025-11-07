//
//  ImageView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-04.
//

import SwiftUI

let img = Image(systemName: "Cereal")


struct ImageView: View {
    var image: Image?
    var body: some View {
        GeometryReader { geometry in
            if let image = image {
                image
                    .resizable()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}
#Preview {
    ImageView(image:img)
}
