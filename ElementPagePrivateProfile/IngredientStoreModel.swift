//
//  IngredientStoreModel.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import SwiftUI

class IngredientStoreModel: ObservableObject {
    @Published var newIngredient = Ingredient(ingredientIcon: "", ingredientName: "")
}
