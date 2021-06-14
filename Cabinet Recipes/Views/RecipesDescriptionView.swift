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
    @State private var deleteAlert = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {

            ScrollView {
                ZStack {
                    VStack(alignment: .leading) {
                        
                        Text("Ingredients")
                            .font(.title2)
                            .padding(.top)
                        ForEach(recipe.ingredients, id: \.self) { ingredient in
                            HStack(alignment: .top) {
                                Text("• ")
                                Text(ingredient)
                            }
                        }
                        
                        Divider()
                        
                        Text("Directions")
                            .font(.title2)
                        ForEach(0..<recipe.directions.count) { index in
                            HStack(alignment: .top) {
                                Text("\(index + 1).")
                                Text(recipe.directions[index])
                            }
                        }
                        Spacer()
                    }.padding([.leading, .trailing], 20)
                    .navigationBarTitle(recipe.name)
                    .navigationBarItems(trailing: NavigationLink(destination: EditRecipeView(recipe: recipe)) {
                        Text("Edit")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        }
                    )
                    .background(
                        Rectangle()
                            .foregroundColor(.white)
                            .padding([.leading, .trailing], 10)
                            .opacity(/*@START_MENU_TOKEN@*/0.9/*@END_MENU_TOKEN@*/)
                    )
                    .toolbar {
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button("Delete") {
                                        self.deleteAlert = true
                            }
                            Spacer()
                        }
                    }.alert(isPresented: $deleteAlert) {
                        Alert(title: Text("Are you sure you want to delete this?"), message: Text("You will not be able to undo this action"), primaryButton: .destructive(Text("Delete")) {
                            deleteRecipe(docName: recipe.docName)
                        },
                        secondaryButton: .cancel())
                    }
                }
            }
//            .background(CircleImage())
    }
    
    func deleteRecipe(docName: String) {
        let db = Firestore.firestore()
        let documentName = db.collection("sub recipes").document(docName)
        documentName.delete() { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                return
            }
        }
        presentationMode.wrappedValue.dismiss()
    }
}

struct RecipesDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        let foods = RecipesData()
        let recipe = foods.recipes[0]
        
        RecipesDescriptionView(recipe: recipe)
    }
}
