//
//  RecipesListView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 5/28/21.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct RecipesListView: View {
    
    @EnvironmentObject var data: RecipesData
    
    var body: some View {
        
        NavigationView {
            List(data.recipes) { recipe in
                NavigationLink(
                    destination: RecipesDescriptionView(recipe: recipe),
                            label: {
                                Text(recipe.name)
                            }
                )
            }
            .navigationBarTitle("Recipes")
            .navigationBarItems(trailing: NavigationLink(destination: AddRecipeView()) {
                Image(systemName: "plus")
                    .resizable()
                    .padding(6)
                    .frame(width: 32, height: 32)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .foregroundColor(.white)
                }
            )
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
            .environmentObject(RecipesData())
    }
}
