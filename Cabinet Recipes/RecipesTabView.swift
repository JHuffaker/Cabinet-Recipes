//
//  RecipesTabView.swift
//  Cabinet Recipes
//
//  Created by Jordan Huffaker on 5/28/21.
//

import SwiftUI
import Firebase

struct RecipesTabView: View {
    
    @EnvironmentObject var recipes: RecipesData
    
    var body: some View {
        
        TabView {
            RecipesListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("Recipes")
                    }
                }
            
            Text("User information")
                .tabItem {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("User")
                    }
                }
        }
    }
}

struct RecipesTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipesTabView()
            .environmentObject(RecipesData())
    }
}
