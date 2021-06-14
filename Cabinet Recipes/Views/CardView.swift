//
//  CardView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 6/14/21.
//

import SwiftUI

struct CardView: View {
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .frame(width: 360, height: 200, alignment: .center)
                .foregroundColor(.blue)
            Text(recipe.name)
                .font(.title)
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes = RecipesData()
        let recipe = recipes.recipes[0]
        CardView(recipe: recipe)
//        CardView()
    }
}
