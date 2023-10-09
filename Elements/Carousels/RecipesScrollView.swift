//
//  RecipesCarousel.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 22/03/2023.
//

import SwiftUI

struct RecipesScrollView: View {
    @EnvironmentObject var recipeVM: Recipes
    @EnvironmentObject var manager: Manager
    let recipes : [Recipe]
    let rows = [GridItem(.fixed(10), spacing: 5)]
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView (.horizontal, showsIndicators: false){
                LazyHGrid (rows: rows){
                    ForEach(recipes){ recipe in
                        VStack{
                            Image(recipe.recipeImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 130, height: 130)
                                .cornerRadius(10)
                                .shadow(radius: 5, y: 3)
                            VStack (alignment: .leading){
                                Text(recipe.recipeName)
                                    .fontWeight(.bold)
                                HStack {
                                    Image(systemName: "clock")
                                        .foregroundColor(GraySomberColor)
                                    Text("\(recipe.recipeTimeCategory) min")
                                        .foregroundColor(GraySomberColor)
                                }
                                NavigationLink(destination : detailRecipe(item: recipe)){
                                    Text("Consulter")
                                        .foregroundColor(.white)
                                        .padding([.top, .bottom], 5)
                                        .padding([.leading, .trailing], 10)
                                        .background(CouleurVert)
                                        .cornerRadius(10)
                                }
                                RatingView(rating: .constant(3))
                            }
                            .frame(width: 120, height: 120)
                        }
                        .frame(width: 140)
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct RecipesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesScrollView(recipes: Recipes().recipesArray)
            .environmentObject(Recipes())
            .environmentObject(Manager())
    }
}
