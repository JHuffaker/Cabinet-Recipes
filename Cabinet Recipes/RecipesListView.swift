//
//  RecipesListView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 5/28/21.
//

import SwiftUI
import Firebase

struct RecipesListView: View {
    
    @EnvironmentObject var data: RecipesData
    @State var counter = 0
    
    var body: some View {
        
        NavigationView {
            List(data.recipes) { recipe in
                Text(recipe.name)
            }
            .navigationBarTitle("Recipes")
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
            .environmentObject(RecipesData())
    }
}
