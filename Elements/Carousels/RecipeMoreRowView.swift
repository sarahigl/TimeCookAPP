//
//  RecipeMoreRowView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 28/03/2023.
//

import SwiftUI

struct RecipeMoreRowView: View {

//    @StateObject var myMoreRecipe = Recipes()
    @EnvironmentObject var recipesVM: Recipes
    @State var clickRecipe: Bool = false
    var recipe: Recipe

    var body: some View {

//        ForEach(myMoreRecipe.recipesArray) {recipe in

            ZStack{

            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 250)
                .foregroundColor(.white)
                .shadow(radius: 3, y: 2)

            VStack(alignment: .center){

                VStack(alignment: .leading){
                        Image(recipe.recipeImage)
                            .resizable()
                        //                    .scaledToFit()
                            .shadow(radius: 3, y: 2)
                            .frame(width: 100, height: 90)
                            .cornerRadius(10)
                            .shadow(radius: 3, y: 2)
                            .padding(2)

                        Text(recipe.recipeName)
                            .font(.title2)
                            .padding(2)

                        HStack{

                            Image(systemName: "stopwatch")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)

                            Text("\(recipe.preparationTime)mn")
                                .foregroundColor(.black)
                                .padding(2)

                        }//HStack
                        .opacity(0.6)
                        Button {
                            clickRecipe = true
                        } label : {
                            Text("Consulter")
                                .foregroundColor(.white)
                                .padding([.bottom, .top], 5)
                                .padding([.leading, .trailing], 10) //au lieu de 15
                                .background(CouleurVert)
                                .cornerRadius(250)
                        }//Button
                        .sheet(isPresented: $clickRecipe) {
                            detailRecipe(item: recipe)
                        }//sheet
                RatingView(rating: .constant(4))
//                RatingView(rating: myMoreRecipe.rating)
                            .padding(2)
//                            .frame(width: 25, height: 15)

                    }//VSTack
                    .frame(minWidth: 110, minHeight: 90)
                    .frame(maxWidth: 110, maxHeight: 90)
            }//VStack
            .frame(minWidth: 110, minHeight: 90)
//                    Spacer()

            }//ZStack
            .frame(minWidth: 120, minHeight: 90)
//            .clipped()
//        }//ForEach
    }
}

struct RecipeMoreRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeMoreRowView(recipe: Recipe(recipeName: "Omelette aux légumes", recipeTimeCategory: 30, recipeCategory: "Végétarien", cookingTime: 10, preparationTime: 10, totalDuration: 20, recipeIngredientsArray: [oeuf, tomate, oignon, mozzarella, huileolive, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "omelette", recipeVideo: "vide", budgetCategory: 10, recipeAuthor: users[0]))
            .environmentObject(Recipes())
    }
}
