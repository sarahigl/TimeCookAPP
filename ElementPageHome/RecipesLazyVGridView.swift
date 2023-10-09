//
//  RecipesLazyVGridView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 53 on 27/03/2023.
//

import SwiftUI

struct RecipesLazyVGridView: View {

   @EnvironmentObject var recipesVM: Recipes
    @State var searchText: String = ""

    var recipes: [Recipe] {
        if searchText.isEmpty{
            return recipesVM.recipesArray
        } else {
            return recipesVM.recipesArray.filter{
                $0.recipeName.lowercased().contains(searchText.lowercased())
            }
        }
    }//var filteredRecipes

    var filteredRecipes: [Recipe]{
        return recipesVM.recipesArray.filter { item in
            (item.recipeName.lowercased().hasPrefix(searchText.lowercased()))
        }
    }


    var body: some View {

        NavigationStack {


            SearchBarView(text: $searchText)
            if (searchText != ""){
                if (filteredRecipes.isEmpty){
                    Text("Aucun nom de Recette n'est disponible pour cette recherche.")
                }
                else{
                    VStack {
                        ScrollView(showsIndicators: false) {
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                ForEach(filteredRecipes){ recipe in
                                    VStack(alignment: .leading){
                                        Spacer()
                                        RecipeMoreRowView(recipe: recipe)

                                    }
                                }
                                .padding()
                            }//LazyVGrid
                        }//ScrollView
                    }//VStack
                    //            .searchable(text: $searchText, prompt: "Recherche")
                }
                //                    .navigationTitle("Liste des recettes")
            }


            CategoryButtonView(category: .constant(""))
                .frame(height: 45)

            if (searchText == ""){

                VStack {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                            ForEach(recipesVM.recipesArray){ recipe in
                                VStack(alignment: .leading){
                                    Spacer()
                                    RecipeMoreRowView(recipe: recipe)
                                }
                            }
                            .padding()
                        }//LazyVGrid
                    }//ScrollView
                }//VStack
            }//if
        }
        .navigationTitle("Liste des recettes")
        }
    }


struct SearchBarView: View {
    @Binding var text: String
    var body: some View {
            ZStack{
                HStack {
                    VStack{

                                    }.searchable(text: $text, prompt: "Recherche")
                                            .font(.title2)
                                            .padding(8)
                                            .background(Color(.systemGray6))
                                            .cornerRadius(8)
                                    }
                                    .padding(.horizontal)
                                }

                            }
                        }//struct SearchBar


struct RecipesLazyVGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesLazyVGridView()
            .environmentObject(Recipes())
//        RecipesLazyVGridView(recipesVM: recipesArray)
//            .environmentObject(Recipes())

    }
}
