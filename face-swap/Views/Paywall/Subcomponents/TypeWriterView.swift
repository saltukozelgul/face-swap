//
//  TypeWriterView.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 12.01.2024.
//

import SwiftUI

struct TypeWriterView: View {
    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    @State var currentText: String = ""
    let finalText: String
    var delay: TimeInterval = 0
    var body: some View {
        ZStack(alignment: .leading) {
            Text(finalText)
                .opacity(0)
            Text(currentText)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                        typeWriter()
                    })
                }
        }
    }
    
    
    func typeWriter(at position: Int = 0) {
        if position == 0 {
            currentText = ""
        }
        if position < finalText.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                currentText.append(finalText[position])
                impactGenerator.impactOccurred()
                typeWriter(at: position + 1)
            }
        }
    }
}

#Preview {
    TypeWriterView(finalText: "Hello world!", delay: 2)
}
