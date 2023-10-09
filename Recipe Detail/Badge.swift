//
//  Badge.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import SwiftUI

struct Badge: Identifiable {
    var id : UUID = UUID()
    var badgeIcon : String
    var badgeTitle : String
}

var badges : [Badge] = [topChef, fiveRecipe, fastRecipe]

var topChef = Badge(badgeIcon: "🧑‍🍳", badgeTitle: "Top Chef ✨")
var fiveRecipe = Badge(badgeIcon: "🥳", badgeTitle: "Plus de 5 recettes ✨")
var fastRecipe = Badge(badgeIcon: "⏰", badgeTitle: "Recette la plus courte")
