//
//  File.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 18.01.2024.
//

import Foundation
import SwiftUI

public extension View {
    
    func onBecomingVisible(withThreshold threshold: CGFloat = 0.5, perform action: @escaping () -> Void) -> some View {
        modifier(BecomingVisible(action: action, threshold: threshold))
    }
}

private struct BecomingVisible: ViewModifier {
    
    @State var action: (() -> Void)?
    var threshold: CGFloat

    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: VisibleKey.self,
                        value: threshold == 0 ? UIScreen.main.bounds.intersects(proxy.frame(in: .global)) : calculateVisibility(proxy.frame(in: .global))
                    )
                    .onPreferenceChange(VisibleKey.self) { isVisible in
                        guard isVisible, let action = action else { return }
                        action()
                    }
            }
        }
    }

    func calculateVisibility(_ frame: CGRect) -> Bool {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let horizontalThreshold = screenWidth * (1 - threshold)
        let verticalThreshold = screenHeight * (1 - threshold)
        
        return frame.midX > horizontalThreshold &&
               frame.midX < screenWidth - horizontalThreshold &&
               frame.midY > verticalThreshold &&
               frame.midY < screenHeight - verticalThreshold
    }

    struct VisibleKey: PreferenceKey {
        static var defaultValue: Bool = false
        static func reduce(value: inout Bool, nextValue: () -> Bool) { }
    }
}

