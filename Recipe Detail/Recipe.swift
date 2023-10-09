//
//  Recipe.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 22/03/2023.
//

import SwiftUI
import Foundation

enum RecipeCategory: String, CaseIterable {
case equilibre = "Equilibré", vegan = "Vegan", asiatique = "Asiatique", vegetarien = "Végétarien"
}//enum

struct Recipe: Identifiable {

    var id: UUID = UUID()
    var recipeName: String
    var recipeTimeCategory: Int
    var recipeCategory: String //RecipeCategory
    var cookingTime: Int
    var preparationTime: Int
    var totalDuration: Int
    var recipeIngredientsArray: [Ingredient] //RecipeIngredient  Ingredient
    //    var recipeIconIngredient: String
    var recipeDescriptionsArray: RecipeDescription
    //    var recipeImageDescription: String
    var recipeImage: String
    var recipeVideo: String // ou  URL
    var budgetCategory: Int
    var isliked : Bool = false
    var recipeAuthor : Person

}//struct Recipe


class Recipes: ObservableObject {
//    [carotte, courgette, huileolive, huile, lait, mozzarella, noix, oeuf, parmesan, penne, spaghetti, riz, sel, thym, tomate, ail, oignon, poulet, boeuf, basilic, porc, vinaigre, sucre, pimentepice, aubergine]
    @Published var recipesArray: [Recipe] = [
        Recipe(recipeName: "Omelette aux légumes", recipeTimeCategory: 10, recipeCategory: "Equilibré", cookingTime: 10, preparationTime: 10, totalDuration: 20, recipeIngredientsArray: [oeuf, tomate, oignon, mozzarella, huileolive, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "omelette", recipeVideo: "GfdH_v3uciY", budgetCategory: 10, recipeAuthor: users[0]),
        Recipe(recipeName: "Riz sauté aux légumes", recipeTimeCategory: 30, recipeCategory: "Vegan", cookingTime: 20, preparationTime: 10, totalDuration: 30, recipeIngredientsArray: [riz, carotte, oignon, ail, huile, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "rizlegume", recipeVideo: "maEytoU4BOk", budgetCategory: 10, recipeAuthor: users[1]),
        Recipe(recipeName: "Pâtes à la sauce tomate et aux épinards", recipeTimeCategory: 20, recipeCategory: "Equilibré", cookingTime: 10, preparationTime: 10, totalDuration: 30, recipeIngredientsArray: [spaghetti, tomate, ail, huileolive, sel, parmesan], recipeDescriptionsArray: omeletteLegume, recipeImage: "PateTomateEpinard", recipeVideo: "gtFLa3JOXTk", budgetCategory: 10, recipeAuthor: users[2]),
        Recipe(recipeName: "Pennes, sauce champignon au thym", recipeTimeCategory: 30, recipeCategory: "Equilibré", cookingTime: 10, preparationTime: 10, totalDuration: 20, recipeIngredientsArray: [penne, ail, huileolive, parmesan, thym, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "pennechampignon", recipeVideo: "vCHSB5wwvyc", budgetCategory: 10, recipeAuthor: users[0]),
        Recipe(recipeName: "Linguines à la roquette et au fromage bleu", recipeTimeCategory: 30, recipeCategory: "Equilibré", cookingTime: 10, preparationTime: 10, totalDuration: 20, recipeIngredientsArray: [spaghetti, huileolive, parmesan, noix, thym, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "Linguine", recipeVideo: "7j8156cY2pY", budgetCategory: 10, recipeAuthor: users[1]),
        Recipe(recipeName: "Oeufs cocotte à la vache qui rit", recipeTimeCategory: 15, recipeCategory: "Equilibré", cookingTime: 8, preparationTime: 7, totalDuration: 15, recipeIngredientsArray: [oeuf, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "Oeufs", recipeVideo: "aGT85yoU3hg", budgetCategory: 10, recipeAuthor: users[2]),
        Recipe(recipeName: "Risotto Champignon", recipeTimeCategory: 30, recipeCategory: "Equilibré", cookingTime: 20, preparationTime: 10, totalDuration: 30, recipeIngredientsArray: [sel, poulet, riz, parmesan, huileolive], recipeDescriptionsArray: omeletteLegume, recipeImage: "RisottoChampignon", recipeVideo: "sM2W2x1BVIM", budgetCategory: 10, recipeAuthor: users[0]),
        Recipe(recipeName: "Salade chèvre chaud", recipeTimeCategory: 30, recipeCategory: "Equilibré", cookingTime: 5, preparationTime: 20, totalDuration: 25, recipeIngredientsArray: [oeuf, tomate, huileolive, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "SaladeChevre", recipeVideo: "zuROAfqsZzw", budgetCategory: 10, recipeAuthor: users[1]),
        Recipe(recipeName: "Taboulé aux céréales saumon fumé et olives noires", recipeTimeCategory: 15, recipeCategory: "Equilibré", cookingTime: 8, preparationTime: 7, totalDuration: 15, recipeIngredientsArray: [tomate, huileolive, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "Taboulé", recipeVideo: "c-Ul3NkFGTM", budgetCategory: 10, recipeAuthor: users[2]),
        Recipe(recipeName: "Salad jar", recipeTimeCategory: 10, recipeCategory: "Equilibré", cookingTime: 10, preparationTime: 15, totalDuration: 25, recipeIngredientsArray: [penne, tomate, parmesan, huileolive, sel], recipeDescriptionsArray: omeletteLegume, recipeImage: "SaladeJAr", recipeVideo: "_Bod_pnSHIo", budgetCategory: 10, recipeAuthor: users[0])
    ]

    var recipeIngredientsArray: [Ingredient] {
        recipesArray[recipeId].recipeIngredientsArray
    }//var

    var recipeDescriptionsArray: RecipeDescription {
        recipesArray[recipeId].recipeDescriptionsArray
    }// var

    var recipeId = 0

    func addRecipe(recipeName: String, recipeTimeCategory: Int, recipeCategory: RecipeCategory, cookingTime: Int, preparationTime: Int, totalDuration: Int, recipeIngredientsArray: [RecipeIngredient], recipeDescriptionsArray: [RecipeDescription], recipeImage: String, recipeVideo: String, budgetCategory: Int) {}

    func addRecipeIngredient(recipeIngredient: String, recipeIconIngredient: String) {}

    func addRecipeDescription(recipeDescription: String, recipeImageDescription: String) {}


}//class
