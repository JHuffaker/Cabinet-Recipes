//
//  AddRecipeView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/5/21.
//

import SwiftUI
import FirebaseFirestore

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

struct AddRecipeView: View {
    @State private var recipeName = ""
    @State private var newIngredient = ""
    @State private var newInstruction = ""
    @State private var ingredientsList = [String]()
    @State private var instructionsList = [String]()
    @State private var showingAlert = false
    @Environment(\.presentationMode) var presentationMode
        
    var body: some View {
        Form {
            // Ask user for the name of the recipe
            Section(header: Text("Name")) {
                TextField("Recipe name", text: $recipeName)
            }
            
            // Ask user for the ingredients. Displays
            // ingredients as user adds them
            Section(header: Text("Ingredients")) {
                ForEach(ingredientsList, id: \.self) {
                    Text($0)
                }
                TextField("add ingredient", text: $newIngredient, onCommit: addNewIngredient)
            }
            
            // Ask user for the instructions. Displays
            // instructions as the user adds them
            Section(header: Text("Instructions")) {
                ForEach(instructionsList, id: \.self) {
                    Text($0)
                }
                TextField("add instruction", text: $newInstruction, onCommit: addNewInstruction)
            }
            
        }.navigationBarTitle("Add Recipe")
        .navigationBarItems(trailing: NavigationLink(destination: RecipesListView()) {
            Text("Create")
                .padding(5)
                .foregroundColor(.blue)
            // Call addRecipe when the user hits the
            // "Create" button
        }.simultaneousGesture(TapGesture().onEnded{
            addRecipe(name: recipeName, instructions: instructionsList, ingredients: ingredientsList)
        })
        )
        // Alert the user that the recipe has been created
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Recipe successfully created"), dismissButton: .default(Text("OK")))
        }
    }
    
    // Add the new ingredient to the list
    func addNewIngredient() {
        // Lowercase and eliminate whitespace
        let ingredient = newIngredient.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Make sure the ingredient is not an empty string
        guard ingredient.count > 0 else {
            return
        }
        
        // Capitalize the first letter of the ingredient
        // and add it to the list
        ingredientsList.append(ingredient.capitalizingFirstLetter())
        // Make newIngredient an empty string again so
        // the user can add additional ingredients
        newIngredient = ""
    }
    
    // Add the new instruction to the list
    func addNewInstruction() {
        // Lowercase and eliminate whitespace
        let instruction = newInstruction.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Make sure the instruction is not an empty string
        guard instruction.count > 0 else {
            return
        }
        
        // Capitalize the first letter of the ingredient
        // and add it to the list
        instructionsList.append(instruction.capitalizingFirstLetter())
        // Make newInstruction an empty string again so
        // the user can add additional ingredients
        newInstruction = ""
    }
    
    // Add the recipe to the database
    func addRecipe(name: String, instructions: [String], ingredients: [String]) {
        
        let db = Firestore.firestore()
        
        let collectionName = db.collection("sub recipes")
        collectionName.addDocument(data: ["name": name, "directions": instructions, "ingredients": ingredients])
        
        // Show alert
        showingAlert = true
        
        // Return the the home screen
        presentationMode.wrappedValue.dismiss()
    }
    
    
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
