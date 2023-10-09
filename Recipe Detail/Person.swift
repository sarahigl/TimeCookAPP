//
//  Person.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import SwiftUI

struct Person: Identifiable {
    var id: UUID = UUID()
    var userName: String
    var userPhoto: String
    var userDescription: String
    var userRecipe: String
    var badges : [Badge]
}

var users = [
    Person(userName: "John Doe", userPhoto: "John Doe", userDescription: "Je n'ai pas le temps et pas l'inspi 🤨 \n Time to cook m'a motivé à manger sainement.", userRecipe: "", badges : [topChef]),
    Person(userName: "Elisa Cila", userPhoto: "Elisa Cila", userDescription: "Cheffe cuistot à mes heures perdues", userRecipe: "", badges : [fiveRecipe]),
    Person(userName: "Evelyne Depardieu", userPhoto: "Evelyne Depardieu", userDescription: "Je suis là pour partager \nmes recettes de grand-mère", userRecipe: "", badges : [fastRecipe, topChef, fiveRecipe])
]

