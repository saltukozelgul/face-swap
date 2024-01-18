//
//  LoopVideoPlayer.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 15.01.2024.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct LoopVideoPlayer: View {
    let videoName: String
    @State var player: AVQueuePlayer?
    @State var looper: AVPlayerLooper?
    var body: some View {
        VStack {
            VideoPlayer(player: player)
                .disabled(true)
                .frame(maxWidth: .infinity)
                .onAppear {
                    self.player = AVQueuePlayer(playerItem: AVPlayerItem(url: Bundle.main.url(forResource: videoName, withExtension: ".mp4")!))
                    self.looper = AVPlayerLooper(player: player!, templateItem: AVPlayerItem(url: Bundle.main.url(forResource: videoName, withExtension: ".mp4")!))
                    player?.play()
                }
                .scaleEffect(1.5)
        }
        .frame(width: UIScreen.main.bounds.width, height: 500)
        .padding(.vertical, 90)
        .background(.red)
    }
}

#Preview {
    LoopVideoPlayer(videoName: "paywall_video")
}
