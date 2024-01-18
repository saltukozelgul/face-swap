//
//  ItemScroll.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 15.01.2024.
//

import SwiftUI

struct ItemScroll<Content: View>: View {
    let screenWidth = UIScreen.main.bounds.width
    @Binding var currentIndex: Int
    let index: Int
    @ViewBuilder let content: Content
    var body: some View {
        VStack {
            content
        }
        .background(
            GeometryReader(content: { inner in
                Rectangle()
                    .foregroundColor(.clear)
                    .onChange(of: inner.frame(in: .global).midX) { oldX,newX in
                        let screenMid = screenWidth / 2
                        let threshold: CGFloat = screenWidth / 4 // Adjust the threshold as needed
                        
                        // Check if the midpoint of the current view is within our range of the screen mid
                        if newX > screenMid - threshold && newX < screenMid + threshold {
                            print("\(index) is in the middle")
                            currentIndex = index
                            print("index updated")
                            print("new index \(currentIndex)")
                        }
                    }
            })
        )
        .frame(height: UIScreen.main.bounds.height * 0.8)
        .id(index)
        .onBecomingVisible(withThreshold: 1) {
            print("New index is \(index)")
            currentIndex = index
        }
    }
}

#Preview {
    ItemScroll(currentIndex: .constant(0), index: 0) {
        Text("Hello world!")
    }
}
