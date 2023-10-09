//
//  RecipesCatEquilibreLazyVGridView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 30/03/2023.
//

import SwiftUI

struct RecipesCatEquilibreLazyVGridView: View {
    @EnvironmentObject var recipesVM: Recipes

 //    @StateObject var recipesVM = Recipes()
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
    var recipesCatEquilibreFilter : [Recipe]{
        return recipesVM.recipesArray.filter { item in
            (item.recipeCategory) == ("Equilibré")
        }
    }//var recipesCatEquilibre

     var filteredRecipes: [Recipe]{
         return recipesVM.recipesArray.filter { item in
             (item.recipeName.lowercased().hasPrefix(searchText.lowercased()))
         }
     }


     var body: some View {

         NavigationStack {
             //            SelectedCategoryButtonView()
             //                .frame(height: 45)

             SearchBarView(text: $searchText)
             if (searchText != ""){
                 if (filteredRecipes.isEmpty){
                     Text("Aucun nom de Recette n'est disponible pour cette recherche.")
                 }
                 else{
                     VStack {
                         ScrollView(showsIndicators: false) {
                             LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                                 if (recipesCatEquilibreFilter.isEmpty){
                                   ZStack{
                                       Rectangle()
                                           .foregroundColor(Color.white)
                                           .frame(width: 130, height: 130)
                                           .cornerRadius(10)
                                           .shadow(radius: 2, y: 3)
                                       Text("Aucune recette \nn'est disponible")
                                   }
                                 }
                                 ForEach(recipesCatEquilibreFilter){ recipe in
                                     VStack(alignment: .leading){
                                         Spacer()
                                         RecipeMoreRowView(recipe: recipe)

                                     }
                                     .scrollContentBackground(.hidden)
                                 }
                                 .padding()
                             }//LazyVGrid
                         }//ScrollView
                     }//VStack
                     //            .searchable(text: $searchText, prompt: "Recherche")
                 }
                 //                    .navigationTitle("Liste des recettes")
             }

 //            SelectedCategoryButtonView()
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



struct RecipesCatEquilibreLazyVGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesCatEquilibreLazyVGridView()
    }
}
