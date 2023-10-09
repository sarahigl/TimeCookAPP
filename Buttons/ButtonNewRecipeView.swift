//
//  ButtonNewRecipeView.swift
//  RatatouillePrototype
//
//  Created by sarah iglla on 24/03/2023.
//

import SwiftUI

struct ButtonNewRecipeView: View {
    @EnvironmentObject var recipeVM : Recipes
    @EnvironmentObject var manager : Manager
    
    var body: some View {
        NavigationLink(destination: AddNewRecipe()){
            ZStack(alignment: .trailing){
                Text("Nouvelle Recette")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(8)
//                    .padding(.horizontal)
                    .background(
                        CouleurVert
                            .cornerRadius(20)
                            .shadow(radius: 3, y : 2)
                        )
            }
        }
    }
}

struct ButtonNewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNewRecipeView()
            .environmentObject(Recipes())
            .environmentObject(Manager())
    }
}
