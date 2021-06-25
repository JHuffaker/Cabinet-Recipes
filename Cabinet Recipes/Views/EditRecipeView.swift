//
//  EditRecipeView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/5/21.
//

import SwiftUI
import FirebaseFirestore

struct EditRecipeView: View {
    @State var recipe: Recipe
    @State var name = ""
    @State var deleteAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            Form {
                // Allow user to edit name
                Section(header: Text("Name")) {
                    TextField(recipe.name, text: $name)
                }
                // Allow user to edit the ingredients
                Section(header: Text("Ingredients")) {
                    ForEach(0..<recipe.ingredients.count) {
                        TextField(recipe.ingredients[$0], text: $recipe.ingredients[$0])
                    }
                }
                // Allow user to edit the instructions
                Section(header: Text("Instructions")) {
                    ForEach(0..<recipe.directions.count) {
                        TextField("\($0 + 1). \(recipe.directions[$0])", text: $recipe.directions[$0])
                    }
                }
            }.navigationBarTitle("Edit Recipe")
            // Edits the recipe
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Save") {
                        editRecipe()
                    }
                }
            }
            // Deletes the recipe
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("Delete") {
                        self.deleteAlert = true
                    }
                }
            }
            // Alerts the user that the recipe is about to
            // be deleted and confirms intention
            .alert(isPresented: $deleteAlert) {
                Alert(title: Text("Are you sure you want to delete this?"), message: Text("You will not be able to undo this action"), primaryButton: .destructive(Text("Delete")) {
                    deleteRecipe(docName: recipe.docName)
                }, secondaryButton: .cancel())
            }
    }
    
    // Deletes the recipe from the database
    func deleteRecipe(docName: String) {
        let db = Firestore.firestore()
        let documentName = db.collection("sub recipes").document(docName)
        documentName.delete() { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                return
            }
        }
        // Returns to the list view
        presentationMode.wrappedValue.dismiss()
    }
    
    // Edits the recipe in the database
    func editRecipe() {
        
        var newName =  self.name.trimmingCharacters(in: .whitespacesAndNewlines).capitalizingFirstLetter()
        if newName == "" {
            newName = recipe.name
        }
        
        var newIngredients = [String]()
        for ingredient in recipe.ingredients {
            if ingredient != "" {
                newIngredients.append(ingredient.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).capitalizingFirstLetter())
            }
        }
        
        var newInstructions = [String]()
        for instruction in recipe.directions {
            if instruction != "" {
                newInstructions.append(instruction.lowercased().trimmingCharacters(in: .whitespacesAndNewlines).capitalizingFirstLetter())
            }
        }
        
        let db = Firestore.firestore()
        
        let documentName = db.collection("sub recipes").document(recipe.docName)
        documentName.setData(["name": newName, "directions": newInstructions, "ingredients": newIngredients])
        
        // Returns to the list view
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let data = RecipesData()
        let recipe = data.recipes[0]
        EditRecipeView(recipe: recipe)
    }
}
