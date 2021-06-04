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
    
    var body: some View {
        VStack {
            Text(recipe.name)
//            ForEach(recipe.instructions, id: \.self) { i in
//                Text("yup")
//            }
//            Text(recipe.ingredient)
//            ForEach(recipe.ingredients, id: \.self) { p in
//                Text("Yup")
//                Text("The ingredient is: \(p.name)")
//            }
        }
    }
}

struct RecipesDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let foods = RecipesData()
        let recipe = foods.recipes[0]
        
        RecipesDescriptionView(recipe: recipe)
    }
}
