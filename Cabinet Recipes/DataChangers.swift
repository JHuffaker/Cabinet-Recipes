//
//  DataChangers.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/5/21.
//

import Foundation
import FirebaseFirestore

struct addRecipe {
    
    private var db = Firestore.firestore()
    
    init(name: String, directions: [String], ingredients: [String]) {
        let collectionName = db.collection("sub recipes")
        collectionName.addDocument(data: ["name": name, "directions": directions, "ingredients": ingredients])
    }
}

struct editRecipe {
    
    private var db = Firestore.firestore()
    
    init(name: String, directions: [String], ingredients: [String], docName: String) {
        print("here!")
        let documentName = db.collection("sub recipes").document(docName)
        documentName.setData(["name": name, "directions": directions, "ingredients": ingredients])
    }
    
}
