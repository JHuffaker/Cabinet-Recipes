//
//  Extensions.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/25/21.
//

import SwiftUI

// Extension for capitalizing the first letter
// of each ingredient
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
