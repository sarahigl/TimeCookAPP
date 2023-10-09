//
//  SelectedIngredientsScrollView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 29/03/2023.
//

import SwiftUI

//struct SelectedIngredientsScrollView: View {
//    let rows = [GridItem(.fixed(10), spacing: 10)]
//    @State var selectedIngredient: Ingredient? // variable d'état pour stocker l'ingrédient sélectionné
//    var body: some View {
//        ScrollView (.horizontal, showsIndicators: false){
//            LazyHGrid(rows: rows){
//                ForEach(ingredientsArray){ ingredient in
//                    VStack (alignment: .center){
//                        ZStack{
//                            RoundedRectangle(cornerRadius: 10)
//                                .foregroundColor(selectedIngredient == ingredient ? CouleurVert : .white) // Condition pour changer la couleur du rectangle en vert si l'ingrédient est sélectionné
//                                .shadow(radius: 3, y: 2)
//
//                            VStack{
//                                Image(ingredient.ingredientIcon)
//                                    .resizable()
//                                    .frame(width: 40, height: 40)
//                                Text(ingredient.ingredientName)
//                                    .foregroundColor(selectedIngredient == ingredient ? .white : CouleurNoir)
//                            }
//                        }
//                        .frame(minWidth: 110, minHeight: 90)
//                        .onTapGesture {
//                        selectedIngredient = ingredient // Mise à jour de la variable d'état lorsque l'ingrédient est sélectionné
//                        }
//                    }
//                }
//            }
//            .padding(.leading, 4)
//        }
//    }
//}

struct SelectedIngredientsScrollView: View {
    let rows = [GridItem(.fixed(10), spacing: 10)]
    @State private var selectedIngredients : Set<String> = []
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(ingredientsArray) { ingredient in
                    VStack(alignment: .center) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(radius: 3, y: 2)
                            VStack {
                                Image(ingredient.ingredientIcon)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text(ingredient.ingredientName)
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(minWidth: 110, minHeight: 90)
//                        .overlay(
//                            ZStack {
//                                Image(systemName: "checkmark.circle.fill")
//                                    .font(.custom("", size : 30))
//                                    .foregroundColor(Color.green)
//                                    .offset(x: 45, y: -40)
//                                    .opacity(selectedIngredients.contains(ingredient.ingredientName) ? 1 : 0)
//                            }
//                        )
//                        .onTapGesture {
//                            if selectedIngredients.contains(ingredient.ingredientName) {
//                                selectedIngredients.remove(ingredient.ingredientName)
//                            } else {
//                                selectedIngredients.insert(ingredient.ingredientName)
//                            }
//                        }
                    }
                }
            }
            .padding(.leading, 4)
        }
    }
}

struct SelectedIngredientsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedIngredientsScrollView()
    }
}
