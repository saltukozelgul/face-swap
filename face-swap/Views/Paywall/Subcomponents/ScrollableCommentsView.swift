//
//  ScrollableComments.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 12.01.2024.
//

import SwiftUI

struct ScrollableCommentsView: View {
    var initalIndex: Int = 1
    let images: [String] = ["comment-pp-1", "comment-pp-1", "comment-pp-1", "comment-pp-1"]
    let comments: [String] = ["The premium version is totally worth it. The additional features, especially in video swapping, have taken my edits to the next level!","As a graphic designer, I'm really particular about app functionalities. Swap Face hits the mark with its precision and variety of editing tools.","Really impressed with the user interface, it’s super intuitive. However, I wish there were more filter options. Looking forward to future updates!","Incredible app! The face swap feature works like magic – both in photos and videos. It's my go-to app for creating fun content for social media."]
    var body: some View {
        ScrollViewReader(content: { proxy in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(comments.indices, id: \.self) { index in
                        CommentView(image: images[index], text: comments[index]).id(index)
                    }
                }.padding(.horizontal, 25)
            }
            .onAppear {
                proxy.scrollTo(initalIndex, anchor: .center)
            }
        })
    }
}

private struct CommentView: View {
    let image: String
    let text: String
    var body: some View {
        VStack(spacing: 10) {
            Image(image)
            Text(text)
              .font(Font.custom("Montserrat", size: 16))
              .foregroundColor(.white)
              .frame(width: 240, alignment: .topLeading)
            Text("⭐️⭐️⭐️⭐️⭐️")
              .font(
                Font.custom("Aileron", size: 24)
                  .weight(.light)
              )
              .foregroundColor(Color(red: 0.98, green: 0.98, blue: 0.98))
        }
        .frame(width: 280, height: 250)
        .background {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 280, height: 250)
              .background(Color(red: 0.59, green: 0.28, blue: 1))
              .cornerRadius(20)
        }
    }
}

#Preview {
    ScrollableCommentsView()
}

