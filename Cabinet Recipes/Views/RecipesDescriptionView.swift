//
//  RecipesDescriptionView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/2/21.
//

import SwiftUI
import Firebase

struct RecipesDescriptionView: View {
    var recipe: Recipe
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

        Form {
            // Display the ingredients
            Section(header: Text("Ingredients")) {
                ForEach(recipe.ingredients, id: \.self) {
                    Text($0)
                }
            }
            // Display the instructions
            Section(header: Text("Instructions")) {
                ForEach(0..<recipe.directions.count) {
                    Text("\($0 + 1). \(recipe.directions[$0])")
                }
            }
        }.navigationBarTitle(recipe.name)
        // Edit button
        .navigationBarItems(trailing: NavigationLink(destination: EditRecipeView(recipe: recipe)) {
                Text("Edit")
                .foregroundColor(.blue)
            }
        )
    }
}

struct RecipesDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let foods = RecipesData()
        let recipe = foods.recipes[0]
        
        RecipesDescriptionView(recipe: recipe)
    }
}
