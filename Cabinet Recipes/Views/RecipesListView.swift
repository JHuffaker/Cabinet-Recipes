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
            ScrollView {
                VStack {
                    Spacer()
                    ForEach(data.recipes) { recipe in
                        NavigationLink(
                            destination: RecipesDescriptionView(recipe: recipe),
                            label: {
                                CardView(recipe: recipe)
                            })
                    }
                    .navigationBarTitle("Recipes")
                    .navigationBarItems(leading: NavigationLink(destination: AddRecipeView()) {
                        Image(systemName: "plus")
                            .resizable()
                            .padding(4)
                            .frame(width: 32, height: 32)
                        }, trailing: NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                                .resizable()
                                .padding(4)
                                .frame(width: 32, height: 32)
                    })
                }
            }
        }
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
            .environmentObject(RecipesData())
    }
}
