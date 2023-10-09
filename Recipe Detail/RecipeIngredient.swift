//
//  RecipeIngredient.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import Foundation


struct RecipeIngredient: Identifiable {

    var id: UUID = UUID()
    var recipeIngredient: [Ingredient]
//    var recipeIconIngredient: String

    var recipeId: Int

}//struct

