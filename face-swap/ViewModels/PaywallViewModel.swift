//
//  PaywallViewModel.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 12.01.2024.
//

import Foundation

class PaywallViewModel: ObservableObject {
    
    
    
    func delay(seconds: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: closure)
    }
}
