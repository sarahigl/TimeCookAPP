//
//  Recettes30minutes.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//


import SwiftUI

struct Recettes15minutes: View {
    @EnvironmentObject var recipeVM: Recipes
    let rowsCarousel = [GridItem(.flexible())]
    var recipesFilter30 : [Recipe]{
        return recipeVM.recipesArray.filter { item in
            (item.recipeTimeCategory) <= 15 &&  (item.recipeTimeCategory) >= 10
        }
    }

    var body: some View {
        VStack(alignment: .leading){
            Text("Recette en moins de 15 min")
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false ) {
                LazyHGrid(rows: rowsCarousel) {
                    if (recipesFilter30.isEmpty){
                      ZStack{
                          Rectangle()
                              .foregroundColor(Color.white)
                              .frame(width: 130, height: 130)
                              .cornerRadius(10)
                              .shadow(radius: 2, y: 3)
                          Text("Aucune recette \nn'est disponible")
                      }
                    }
                    ForEach(recipesFilter30) { item in
                        NavigationLink(destination: detailRecipe(item : item)){
                            VStack{
                                Image(item.recipeImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(10)
                                    .shadow(radius: 2, y: 3)
                                VStack (alignment: .leading){
                                    Text(item.recipeName)
                                    CategoryClock(recipeTimeCategory: item.recipeTimeCategory)
                                }
                            }
                            .frame(width: 130, height: 200)
                        }
                        .accentColor(.black)
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            Spacer()
        }
    }
}

struct Recettes15minutes_Previews: PreviewProvider {
    static var previews: some View {
        Recettes15minutes()
            .environmentObject(Recipes())
    }
}
