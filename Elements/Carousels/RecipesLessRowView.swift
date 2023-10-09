//
//  RecipesLessRowView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 28/03/2023.
//

import SwiftUI

struct RecipeLessRowView: View {

    @StateObject var myLessRecipe = Recipes()
    @State var clickRecipe: Bool = false

    var body: some View {

        ForEach(myLessRecipe.recipesArray) {recipe in

            ZStack{

            RoundedRectangle(cornerRadius: 10)
                .frame(width: 150, height: 190)
                .foregroundColor(.white)
                .shadow(radius: 3, y: 2)

            VStack(alignment: .center){

                    VStack(alignment: .leading){
                        Image(recipe.recipeImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
//                                            .scaledToFit()
                            .shadow(radius: 3, y: 2)
                            .frame(width: 100, height: 90)
                            .cornerRadius(10)
                            .shadow(radius: 3, y: 2)
                            .padding(2)
                        Button {
                            clickRecipe = true
                        } label : {
                            VStack(alignment: .leading){
                                Text(recipe.recipeName)
                                    .font(.title2)
                                    .padding(2)
                                    .foregroundColor(.black)
                                HStack{
                                    Image(systemName: "stopwatch")
                                    //                                .resizable()
                                    //                                .scaledToFit()
                                    //                                .frame(width: 40, height: 40)
                                        .foregroundColor(.black)


                                    Text("\(recipe.preparationTime)mn")
                                        .foregroundColor(.black)

                                }//HStack
                                .opacity(0.6)
                            }//VStack button
                        }//Button
                        .sheet(isPresented: $clickRecipe) {
                            detailRecipe(item: recipe)
                        }//sheet

                    }//VSTack
                    .frame(minWidth: 110, minHeight: 90)
                    .frame(maxWidth: 110, maxHeight: 90)
                }//VStack
                .frame(minWidth: 110, minHeight: 90)

//                    Spacer()
            }//ZStack
        }//ForEach
    }
}
struct OneRecipeLessRowView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeLessRowView()
    }
}
