//
//  ScannerView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-03.
//

import SwiftUI


struct ScannerView: View {
    @EnvironmentObject var model: CameraModel
    @State private var isRecording: Bool = false

    private let footerHeight: CGFloat = 110.0

    var body: some View {
        
        ImageView(image: model.previewImage )
            .padding(.bottom, footerHeight)
            .overlay(alignment: .bottom) {
                buttonsView()
                    .frame(height: footerHeight)
                    .background(.gray.opacity(0.4))
            }
            .padding(.top, 40)
            .background(Color.black)

    }

    private func buttonsView() -> some View {
        GeometryReader { geometry in
            let frameHeight = geometry.size.height
            HStack {

                Button {
                } label: {
                    Image(systemName: "camera.fill")

                }
                
                Spacer()

                    Button {
                        model.camera.takePhoto()
                    } label: {
                        ZStack {
                            Circle()
                                .strokeBorder(.white, lineWidth: 3)
                                .frame(width: frameHeight, height:  frameHeight)
                            Circle()
                                .fill(.white)
                                .frame(width:  frameHeight-10, height: frameHeight-10)
                            
                        }
                    }

                Spacer()

                Button {
                    model.camera.switchCaptureDevice()
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath")
                }

            }
            .font(.system(size: 28, weight: .bold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .center)
            
        }
        .padding(.vertical, 24)
        .padding(.bottom, 8)
        .padding(.horizontal, 32)

    }
}

#Preview {
    ScannerView()
}
