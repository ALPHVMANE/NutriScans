//
//  CameraView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-04.
//

import SwiftUI

struct CameraView: View {
    @StateObject private var model = CameraModel()

    var body: some View {

        ZStack {
            if let _ = model.photoToken {
                SaveImageView()
            } else {
                ScannerView()
                    .onAppear {
                        model.camera.isPreviewPaused = false
                    }
                    .onDisappear {
                        model.camera.isPreviewPaused = true
                    }
            }

        }
        .task {
            await model.camera.start()
        }
        .ignoresSafeArea(.all)
        .environmentObject(model)
    }
}

#Preview {
    CameraView()
}
