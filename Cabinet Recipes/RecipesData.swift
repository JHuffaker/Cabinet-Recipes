//
//  RecipesData.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 5/29/21.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class RecipesData: ObservableObject {
    
    @Published var recipes = [Recipe]()
    var docsIDs = [String]()
    
    private var db = Firestore.firestore()
    
//    init() {
//        db.collection("recipes").addSnapshotListener { (querySnapshot, error) in
//          guard let documents = querySnapshot?.documents else {
//            print("No documents")
//            return
//          }
//          self.recipes = documents.map { queryDocumentSnapshot -> Recipe in
//            let data = queryDocumentSnapshot.data()
//            let name = data["name"] as? String ?? ""
//            let ingredients = Ingredient(data: data["ingredients"] as! [[String: Any]])
//            let instructions = data["instructions"] as? [String] ?? [String]()
//            return Recipe(id: .init(), name: name,  ingredients: ingredients, instructions: instructions)
//          }
//        }
//      }
    
    init() {
        let collectionName = db.collection("recipes")
        collectionName.getDocuments { (querySnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else if let querySnapshot = querySnapshot {
                for doc in querySnapshot.documents {
                    self.docsIDs.append(doc.documentID)
                }
            } else {
                // No data is returned, so choose how to handle it
            }
        }

//        for documentId in self.docsIDs {
//            fetchBook(documentId: documentId)
        }

      }
//    func fetchBook(documentId: String) {
//      let docRef = db.collection("recipes").document(documentId)
//      docRef.getDocument { document, error in
//        if let error = error as NSError? {
//            print(error.localizedDescription)
//        }
//        else {
//          if let document = document {
//            do {
//              let book = try document.data(as: Recipe.self)
//                if let newBook = book {
//                    self.recipes.append(newBook)
//                } else {
//                    print("you're done for!")
//                }
//            }
//            catch {
//              print(error)
//            }
//          }
//        }
//      }
//    }

}

struct Recipe: Codable {
//    var id = UUID()
    @DocumentID var id: String?
    var name: String
    var ingredients: [Ingredient]
    var instructions: [String]
}

struct Ingredient: Codable, Hashable {
    var name: String
    var num: Int
//    var denom: Int?
    var unit: String

}

