//
//  ProfilPublicUtilisateur.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 23/03/2023.
//

import SwiftUI

struct ProfilPublicUtilisateur: View {
    @EnvironmentObject var recipeVM: Recipes
    @EnvironmentObject var manager: Manager
    @EnvironmentObject var listEtapes: ListEtapes
    var userApp : Person
    let rowsCarousel = [GridItem(.flexible())]
    var body: some View {
        VStack(alignment : .leading){
            
                ZStack {
                    Rectangle()
                        .foregroundColor(GrayColor)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 200)
                        .position(x: 197.0, y: 50.0)
                    Image("radis")
                        .position(x: 35.0, y: 40.0)
                        .opacity(0.6)
                    Image("tomate")
                        .position(x: 360.0, y: 80.0)
                        .opacity(0.6)
                        VStack {
                            Image(userApp.userPhoto)
                                .resizable()
                                .clipShape(Circle())
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 160)
                                .foregroundColor(.blue)
                                .cornerRadius(20)
                            Text(userApp.userName)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(userApp.userDescription)
                                .foregroundColor(GraySomberColor)
                                .multilineTextAlignment(.center)
                                .font(Font.system(size: 16).italic())
                                .padding(.bottom)
                        }
                        .position(x: 200.0, y: 180.0)
                }
                .frame(height: 300)

                ScrollView{
                    VStack(alignment: .leading){
                        Text("Recettes enregistrées")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            LazyHGrid (rows : rowsCarousel){
                                ForEach(recipeVM.recipesArray){ recipe in
                                    if recipe.recipeAuthor.id == userApp.id {
                                        VStack {
                                            Image(recipe.recipeImage)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 90, height: 90)
                                                .cornerRadius(10)
                                                .shadow(radius: 2, y : 3)
                                            Text(recipe.recipeName)
                                        }
                                        .frame(width : 100, height : 180)
                                    }
                                }
                            }
                        }
                        
                        Text("Badges obtenus")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                        BadgesScrollView(badges: userApp.badges)
                        
                        Text("Les favoris de \(userApp.userName)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top, 10)
                        
                        let likedRecipes = recipeVM.recipesArray.filter({ $0.isliked })
                        if likedRecipes.isEmpty {
                            Spacer()

                            Text("\(userApp.userName) n'a pas mis de recette en favori !")
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                        } else {
                            ScrollView{
                                ForEach(likedRecipes){ recipe in
//                                    RecipeRow(likeButton: false, recipe: recipe)
                                    RecipeRow(recipe: recipe)
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                }
                .padding(.leading)
        }
    }
}

struct ProfilPublicUtilisateur_Previews: PreviewProvider {
    static var previews: some View {
        ProfilPublicUtilisateur(userApp: users[2])
            .environmentObject(Recipes())
            .environmentObject(Manager())
            .environmentObject(ListEtapes())
    }
}
