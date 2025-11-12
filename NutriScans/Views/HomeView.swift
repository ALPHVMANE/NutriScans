//
//  DashboardView.swift
//  NutriScans
//
//  Created by Ace of Heart on 2025-11-03.
//

import SwiftUI
import AVKit

struct HomeView: View {
    var body: some View {
        ZStack{
               HStack{
                   AmbienceVid()
               }
               .edgesIgnoringSafeArea(.all)
           }
    }
}

struct AmbienceVid: UIViewRepresentable {
   func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<AmbienceVid>) {
   }

   func makeUIView(context: Context) -> UIView {
     return PlayerUIView(frame: .zero)
   }
 }


class PlayerUIView: UIView {
   private var playerLooper: AVPlayerLooper?
   private var playerLayer = AVPlayerLayer()
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }

   override init(frame: CGRect) {
       super.init(frame: frame)
       // Load the resource
       let fileUrl = Bundle.main.url(forResource: "HomeBg", withExtension: "mp4")!
       let asset = AVURLAsset(url: fileUrl)
       let item = AVPlayerItem(asset: asset)
       
       // Setup the player
       let player = AVQueuePlayer()
       playerLayer.player = player
       playerLayer.videoGravity = .resizeAspectFill
       layer.addSublayer(playerLayer)
        
       // Create a new player looper with the queue player and template item
       playerLooper = AVPlayerLooper(player: player, templateItem: item)

       // Start the movie
       player.play()
   }

   override func layoutSubviews() {
           super.layoutSubviews()
           playerLayer.frame = bounds
   }
}


#Preview {
    HomeView()
}
