//
//  RecipeDescription.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import Foundation

struct RecipeDescription: Identifiable {

    var id: UUID = UUID()
    var recipeDescription: String
    var recipeImageDescription: String
//    var recipeId: Int

}//struct
var omeletteLegume = RecipeDescription(recipeDescription: "1/ Battre les oeufs dans un bol avec une fourchette jusqu'à ce qu'ils soient bien mélangés. \n", recipeImageDescription: "scrambleEgg")

var descriptionArray : [RecipeDescription] = [omeletteLegume]
