//
//  RecipesData.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 5/29/21.
//

import Foundation
import FirebaseFirestore

class RecipesData: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    private var db = Firestore.firestore()
    
    init() {
        db.collection("sub recipes").addSnapshotListener { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
          }
          self.recipes = documents.map { queryDocumentSnapshot -> Recipe in
            let docName = queryDocumentSnapshot.documentID
            let data = queryDocumentSnapshot.data()
            let name = data["name"] as? String ?? ""
            let ingredients = data["ingredients"] as? [String] ?? [String]()
            let directions = data["directions"] as? [String] ?? [String]()
            return Recipe(id: .init(), name: name,  ingredients: ingredients, directions: directions, docName: docName)
          }
        }
      }
}

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var ingredients: [String]
    var directions: [String]
    var docName: String
}
