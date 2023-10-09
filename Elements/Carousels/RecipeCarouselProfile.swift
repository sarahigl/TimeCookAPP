//
//  RecipeCarouselProfile.swift
//  RatatouillePrototype
//
//  Created by sarah iglla on 24/03/2023.
//

import SwiftUI

struct RecipeCarouselProfile: View {
    @EnvironmentObject var recipeVM: Recipes
    let recipes : [Recipe]
    let rowsCarousel = [GridItem(.flexible())]
    
    var body: some View {
        VStack{
            Text("Recettes Proposées")
                .font(.title2)
                .fontWeight(.bold)
            
            GeometryReader { geometry in
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rowsCarousel, spacing: 10) {
                        ForEach(recipeVM.recipesArray) { carousel in
                            VStack{
                                Image(carousel.recipeImage)
                                Text(carousel.recipeName)
                            }
                            .frame(minWidth: geometry.size.width/2, maxWidth: geometry.size.width, minHeight: 180, maxHeight: 180)
                        }
                        .scrollContentBackground(.hidden)
                    }
                }
            }
        }
    }
}

struct RecipeCarouselProfile_Previews: PreviewProvider {
    static var previews: some View {
        RecipesScrollView(recipes: Recipes().recipesArray)
            .environmentObject(Recipes())
    }
}
