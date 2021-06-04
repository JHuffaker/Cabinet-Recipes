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
                    destination:
//                        RecipesDescriptionView(recipe: recipe),
                        Text("hello"),
                    label: {
//                        Text(recipe.name)
                        Text("Recipe name")
                    })
            }
            .navigationBarTitle("Recipes")
        }
//        Text("Hello?")
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
            .environmentObject(RecipesData())
    }
}
