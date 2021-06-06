//
//  AddRecipeView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/5/21.
//

import SwiftUI

struct AddRecipeView: View {
    @State var recipeName = ""
    @State var ingredients = ""
    @State var directions = ""
    
    @State var counter = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Recipe name", text: $recipeName)
                }
                Section {
                    TextField("Ingredients", text: $ingredients)
                }
                Section {
                    TextField("Directions", text: $directions)
                }
            }.navigationBarTitle("Add Recipe")
            .navigationBarItems(trailing: NavigationLink(destination: RecipesListView()) {
                Text("Save")
                    .padding(20)
                    .foregroundColor(.blue)
            }.simultaneousGesture(TapGesture().onEnded{
                let directionsList = directions.components(separatedBy: ".")
                let ingredientsList = ingredients.components(separatedBy: ".")
                addRecipe(name: recipeName, directions: directionsList, ingredients: ingredientsList)
            })
            )
        }
    }
}

struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
    }
}
