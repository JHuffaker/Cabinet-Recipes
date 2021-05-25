//
//  Cabinet_RecipesApp.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 5/25/21.
//

import SwiftUI
import Firebase

@main
struct Cabinet_RecipesApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
