//
//  ModaleAllergie.swift
//  RatatouillePrototype
//
//  Created by sarah iglla on 24/03/2023.
//

import SwiftUI

struct ModaleAllergie: View {
    @EnvironmentObject var ingredientStore: IngredientStoreModel
    @EnvironmentObject var recipeVM : Recipes
    @EnvironmentObject var manager : Manager
    @State var ingredient: Ingredient
    
        var columns : [GridItem]{
            [GridItem(.adaptive(minimum: countIngredient))]
        }
        @State var countIngredient: Double = 70
    @State var clicIngredient: Bool = false
        let ingredients: [Ingredient]

        var body: some View {
                        NavigationStack{
                            VStack{
                                ScrollView {
                                    LazyVGrid(columns: columns, spacing: 15) {
                                        ForEach(ingredients) { ingredient in
                                            Button {
                                                clicIngredient = true
//                                                save()
                                            } label : {
                                                VStack{
                                                List(ingredients) { ingredient in
                                                    
                                                }
                                                Image(ingredient.ingredientIcon)
                                                    .resizable()
                                                    .frame(maxWidth: 200, maxHeight: 200)
                                                    .cornerRadius(20)
                                                    .aspectRatio(contentMode: .fill)
                                                        
                                                Text(ingredient.ingredientName)
                                                    .foregroundColor(Color.black)
                                                }
                                            }
                                        }
                                        
                                    }
                                   
                                }
                            }
                        }
                        .padding(.horizontal)
    }
//    func save() {
//        if ingredientStore.index(for: ingredient) == nil {
//            ingredientStore.(ingredient: ingredient.index(for: ingredient.self))
////            ingredientStore.add(ingredient: Ingredient(ingredientIcon: "", ingredientName: ""))
//        }
//    }
}

struct ModaleAllergie_Previews: PreviewProvider {
    static var previews: some View {
        ModaleAllergie(ingredient: Ingredient(ingredientIcon: "", ingredientName: ""), ingredients: ingredientsArray)
            .environmentObject(IngredientStoreModel())
            .environmentObject(Recipes())
            .environmentObject(Manager())
    }
}




