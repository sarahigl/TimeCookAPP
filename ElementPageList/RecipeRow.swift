//
//  RecipeRow.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 22/03/2023.
//

import SwiftUI

struct RecipeRow: View {
    @EnvironmentObject var recipeVM: Recipes
    var likeButton = true
    var recipe : Recipe
    
    var body: some View {
        VStack(alignment : .leading){
            NavigationLink(destination : detailRecipe(item : recipe)){
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height : 110)
                        .foregroundColor(.white)
                        .shadow(radius: 3, y : 3)
                    VStack {
                        HStack {
                            Image(recipe.recipeImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .cornerRadius(50)
                                .padding(.trailing)
                            VStack(alignment: .leading) {
                                Text(recipe.recipeName)
                                    .fontWeight(.semibold)
                                    .multilineTextAlignment(.leading)
                                Text("En \(recipe.totalDuration) min maximum")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            if likeButton {
                                VStack{
                                    let index = recipeVM.recipesArray.firstIndex(where: { $0.id == recipe.id })
                                    if let index {
                                        FavoriteButton(isliked: $recipeVM.recipesArray[index].isliked)
                                            .padding(.bottom)
                                            .offset(y: -20)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .accentColor(CouleurNoir)
        }
    }
}

struct RecipeRow_Previews: PreviewProvider {
    static var previews: some View {
        RecipeRow(recipe: Recipe(recipeName: "Linguines à la roquette et au fromage bleu", recipeTimeCategory: 30, recipeCategory: "Equilibré", cookingTime: 10, preparationTime: 10, totalDuration: 20, recipeIngredientsArray: [], recipeDescriptionsArray: omeletteLegume, recipeImage: "Linguine", recipeVideo: "", budgetCategory: 1, recipeAuthor: users[0]))
            .environmentObject(Recipes())
    }
}

