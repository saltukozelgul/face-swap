//
//  PaywallView.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 12.01.2024.
//

import SwiftUI
import AVFoundation
import _AVKit_SwiftUI

struct PaywallView: View {
    @ObservedObject var viewModel = PaywallViewModel()
    var body: some View {
        ScrollViewReader { scrollProxy in
            ScrollView {
                LazyVStack {
                    topContainer
                    firstText
                    goDownButton
                    joinTheFunText
                    TransationImages(viewModel: viewModel)
                    goDownButton
                    RewriteHistoryImages(viewModel: viewModel)
                    goDownButton
                    numberOneVector
                    ScrollableCommentsView(initalIndex: 1)
                    goDownButton
                    LoopVideoPlayer(videoName: "paywall_video")
                }
            }
            .ignoresSafeArea()
            .background(Color(red: 0.12, green: 0, blue: 0.29))
        }

    }
    
    var topContainer: some View {
        ZStack(alignment: .bottom) {
            Image("paywall_image")
                .frame(height: 270, alignment: .top)
                .clipped()
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 270)
                .background(
                  LinearGradient(
                    stops: [
                      Gradient.Stop(color: Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.5), location: 0.00),
                      Gradient.Stop(color: Color(red: 0.12, green: 0, blue: 0.29), location: 1),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                  )
                )
            VStack(spacing: 10) {
                Text("FaceSwap")
                  .font(
                    Font.custom("Montserrat", size: 32)
                      .weight(.semibold)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(.white)
                
                    HStack(spacing: 0) {
                        Text("Join 100K+ and ")
                          .foregroundColor(.white)
                        TypeWriterView(finalText: "re-write the history").foregroundColor(Color(hex: "#50FF8C"))
                    }
                
                .font(
                    Font.custom("Montserrat", size: 16)
                      .weight(.semibold)
                  )
                  .multilineTextAlignment(.center)

            }
            .padding(.bottom)
        }
    }
    
    var firstText: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Text("A good ")
                    .foregroundColor(.white)
                TypeWriterView(finalText: "quality", delay: 4.2).foregroundColor(Color(hex: "#50FF8C"))
                Text(" is")
                    .foregroundColor(.white)
            }
            HStack {
                Text(" is never ")
                    .foregroundColor(.white)
                TypeWriterView(finalText: "FREE!", delay: 4.2 + 1.4).foregroundColor(Color(hex: "#50FF8C"))
            }
            Text("and")
                .foregroundColor(.white)
            HStack(spacing: 0) {
                TypeWriterView(finalText: "You", delay: 4.2 + 1.4 + 1).foregroundColor(Color(hex: "#50FF8C"))
                Text(" know you ")
                    .foregroundColor(.white)
            }
            HStack(spacing: 0) {
                TypeWriterView(finalText: "deserve", delay: 4.2 + 1.4 + 1 + 0.6).foregroundColor(Color(hex: "#50FF8C"))
                Text(" to have ")
                    .foregroundColor(.white)
            }
            HStack(spacing: 0) {
                TypeWriterView(finalText: "some fun", delay: 4.2 + 1.4 + 1 + 0.6 + 1.4).foregroundColor(Color(hex: "#50FF8C"))
                Text(" like all!")
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .font(
            Font.custom("Montserrat", size: 32)
                .weight(.semibold)
        )
        .frame(width: 301, alignment: .top)
        .multilineTextAlignment(.center)
    }
    
    var goDownButton: some View {
        Button(action: {
            
        }, label: {
            VStack(alignment: .center) {
                Image(systemName: "chevron.left")        .rotationEffect(.degrees(-90))
                Image(systemName: "chevron.left")        .rotationEffect(.degrees(-90))
                    .offset(x: 0, y: -9)
            }
            .scaleEffect(1.2)
            .padding(.bottom, 5)
            .padding(.top, 10)
            .foregroundColor(.white)
        })
    }
    
    var joinTheFunText: some View {
        Text("Join the Fun!")
          .font(
            Font.custom("Montserrat", size: 35)
              .weight(.semibold)
          )
          .multilineTextAlignment(.center)
          .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
    }
    
    var numberOneVector: some View {
        HStack(spacing: 30) {
            Image("#1_left")
            (
            Text("#")
              .font(
                Font.custom("Montserrat", size: 64)
                  .weight(.bold)
              ) +
            Text("1")
              .font(
                Font.custom("Montserrat", size: 128)
                  .weight(.bold)
              )

            )            
            .multilineTextAlignment(.center)
            .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
            Image("#1_right")
        }
    }
}

struct TransationImages: View {
    @ObservedObject var viewModel: PaywallViewModel
    @State var animation1 = false
    @State var animation2 = false
    @State var animation3 = false
    var  body: some View {
        ZStack(alignment: .topLeading) {
            Image("paywall_before")
                .offset(x: animation1 ? -75 : 5000, y: 0)
            ZStack {
                Image("paywall_before")
                    .offset(x: animation2 ? 0 : 5000, y: 100)
            }
            Image("paywall_after")
                .offset(x: animation3 ? 75 : 5000, y: 200)
        }
        .padding(.bottom, 200)
        .onAppear(perform: {
            withAnimation(.spring(duration: 1)) {
                animation1 = true
                viewModel.delay(seconds: 1) {
                    withAnimation(.spring(duration: 1)) {
                        animation2 = true
                        viewModel.delay(seconds: 1) {
                            withAnimation(.spring(duration: 1)) {
                                animation3 = true
                            }
                        }
                    }
                }
            }
        })
    }
}

struct RewriteHistoryImages: View {
    @ObservedObject var viewModel: PaywallViewModel
    @State var animation1 = false
    @State var animation2 = false
    @State var animation3 = false
    var body: some View {
        VStack(spacing: 0) {
            title
            HStack{
                Image("paywall_before_2")
                Spacer()
                Text("Pick your scene")
                Spacer()
            }
            .offset(x: animation1 ? 0 : 5000, y: 0)
            HStack{
                ZStack {
                    Image("paywall_before_2")
                }
                Spacer()
                Text("Wait for the magic")
                Spacer()
            }
            .offset(x: animation2 ? 0 : 5000, y: 0)
            HStack{
                Image("paywall_after_2")
                Spacer()
                Text("Enjoy your\nnew\nversion!")
                Spacer()
            }
            .offset(x: animation3 ? 0 : 5000, y: 0)
        }
        .font(
          Font.custom("Montserrat", size: 20)
            .weight(.semibold)
        )
        .multilineTextAlignment(.center)
        .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
        .padding(.leading, 25)     
        .onAppear(perform: {
            viewModel.delay(seconds: 3) {
                withAnimation(.spring(duration: 1)) {
                    animation1 = true
                    viewModel.delay(seconds: 1) {
                        withAnimation(.spring(duration: 1)) {
                            animation2 = true
                            viewModel.delay(seconds: 1) {
                                withAnimation(.spring(duration: 1)) {
                                    animation3 = true
                                }
                            }
                        }
                    }
                }
            }
        })
    }
    
    var title: some View {
        Text("Rewrite the History")
          .font(
            Font.custom("Montserrat", size: 32)
              .weight(.semibold)
          )
          .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
    }
}

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
    PaywallView()
}
