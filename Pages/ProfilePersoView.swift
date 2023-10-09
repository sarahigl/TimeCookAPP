//
//  ProfilePersoView.swift
//  RatatouillePrototype
//
//  Created by sarah iglla on 24/03/2023.
//

import SwiftUI

struct ProfilePersoView: View {
    @EnvironmentObject var recipeVM : Recipes
    @EnvironmentObject var manager : Manager
    @EnvironmentObject var listEtapes : ListEtapes
    
    @State var showSheet = false
    
    var userApp : Person
    let rowsCarousel = [GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment : .leading){
                    VStack (alignment: .center){
                        HStack{
                            Image(userApp.userPhoto)
                                .resizable()
                                .frame(width: 70,height: 70)
                                .imageScale(.large)
                                .foregroundColor(.gray)
                                .clipShape(Circle())
                            VStack(alignment: .leading){
                                Text(userApp.userName)
                                    .font(.headline)
                                Text("Votre compte")
                                    .foregroundColor(.gray)
                            }
                            ToolBarItemView()
                            Spacer()
                            ButtonNewRecipeView()
                        }
//                        .padding()
                    }
                    VStack(alignment: .leading){
                        Text("Vous êtes allergique ou n’aimez pas ...")
                            .frame(minHeight: 50)
                            .bold()
                        ModaleIngredients()
                            .frame(height : 150)
                    }
//                    .padding()
                    VStack(alignment: .leading){
                        Text("Vos recettes")
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
                        
//                        Spacer(minLength: 40)
                    Text("Vos favoris")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                    
                    let likedRecipes = recipeVM.recipesArray.filter({ $0.isliked })
                    if likedRecipes.isEmpty {
                        Spacer()

                        Text("Vous n'avez pas mis de recette dans vos favoris !")
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.leading)
                    } else {
                        ScrollView{
                            ForEach(likedRecipes){ recipe in
                                RecipeRow(recipe: recipe)
                            }
                            .padding(.vertical, 8)
                        }
                    }
                    }
                }
                .padding()
            }
        }
    }
}


struct ProfilePersoView_Previews: PreviewProvider {
    static var previews: some View {
       ProfilePersoView(userApp: users[2])
            .environmentObject(Recipes())
            .environmentObject(Manager())
            .environmentObject(ListEtapes())
    }
}
