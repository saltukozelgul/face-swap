//
//  String.swift
//  face-swap
//
//  Created by Saltuk Bugra OZELGUL on 12.01.2024.
//

import Foundation

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
