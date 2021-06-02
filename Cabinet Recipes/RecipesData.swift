//
//  RecipesData.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 5/29/21.
//

import Foundation
import Firebase

class RecipesData: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    private var db = Firestore.firestore()
    
    init() {
        db.collection("recipes").addSnapshotListener { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
          }
          self.recipes = documents.map { queryDocumentSnapshot -> Recipe in
            let data = queryDocumentSnapshot.data()
            let name = data["name"] as? String ?? ""
            return Recipe(id: .init(), name: name, docID: queryDocumentSnapshot.documentID)
          }
        }
      }

}

struct Recipe: Identifiable {
    var id = UUID()
    var name: String
    var docID: String
}

