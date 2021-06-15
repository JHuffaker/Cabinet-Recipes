//
//  AddRecipeView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/5/21.
//

import SwiftUI
import FirebaseFirestore

struct AddRecipeView: View {
    @State var recipeName = ""
    @State var ingredients = ""
    @State var ingredientsList = [String]()
    @State var directions = ""
    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Recipe name", text: $recipeName)
                }
                Section {
                    TextField("add ingredient", text: $ingredients)
                }
                Section {
                    TextField("add instruction", text: $directions)
                }
            }.navigationBarTitle("Add Recipe")
            .navigationBarItems(trailing: NavigationLink(destination: RecipesListView()) {
                Text("Create")
                    .padding(5)
                    .foregroundColor(.blue)
            }.simultaneousGesture(TapGesture().onEnded{
                let directionsList = directions.components(separatedBy: ". ")
                let ingredientsList = ingredients.components(separatedBy: ". ")
                addRecipe(name: recipeName, directions: directionsList, ingredients: ingredientsList)
            })
            )
        }
    }
    
    func addRecipe(name: String, directions: [String], ingredients: [String]) {
        
        let db = Firestore.firestore()
        
        let collectionName = db.collection("sub recipes")
        collectionName.addDocument(data: ["name": name, "directions": directions, "ingredients": ingredients])
        
        presentationMode.wrappedValue.dismiss()
    }
    
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
