//
//  EditRecipeView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/5/21.
//

import SwiftUI

struct EditRecipeView: View {
    var recipe: Recipe
    @State var newName = ""
    @State var newIngredients = [String]()
    @State var newDirections = [String]()
    
    init(recipe: Recipe) {
        self.recipe = recipe
        newName = self.recipe.name
        newIngredients = self.recipe.ingredients
        newDirections = self.recipe.directions
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField(recipe.name, text: $newName)
                }
//                Section {
//                    ForEach(0..<recipe.ingredients.count) { index in
//                        TextField(recipe.ingredients[index], text: $newIngredients[index])
//                    }
//                }
//                Section {
//                    ForEach(0..<recipe.directions.count) { index in
//                        TextField(recipe.directions[index], text: $newDirections[index])
//                    }
//                }
            }.navigationBarTitle("Edit Recipe")
            .navigationBarItems(trailing: NavigationLink(destination: RecipesListView()) {
                Text("Save")
                    .padding(20)
                    .foregroundColor(.blue)
            }.simultaneousGesture(TapGesture().onEnded{
                editRecipe(name: newName, directions: newDirections, ingredients: newIngredients, docName: recipe.docName)
            })
            )
        }
    }
}

struct EditRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let foods = RecipesData()
        let recipe = foods.recipes[0]
        
        EditRecipeView(recipe: recipe)
    }
}
