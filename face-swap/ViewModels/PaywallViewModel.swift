//
//  PaywallViewModel.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 12.01.2024.
//

import Foundation

class PaywallViewModel: ObservableObject {
    
    @Published var selectedType: PaywallSelectableTypes = .yearly
    
    
    func delay(seconds: Double, closure: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: closure)
    }
}

enum PaywallSelectableTypes: String {
    case yearly = "Yearly"
    case monthly = "Monthly"
    case weekly = "Weekly"
}
