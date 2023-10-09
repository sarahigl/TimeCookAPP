//
//  Ingredient.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//


import Foundation
import SwiftUI

struct Ingredient: Identifiable, Equatable {

    var id: UUID = UUID()
    var ingredientIcon: String
    var ingredientName: String

}//struct

var carotte = Ingredient(ingredientIcon: "carotte", ingredientName: "Carottes")
var courgette = Ingredient(ingredientIcon: "courgette", ingredientName: "Courgettes")
var huileolive = Ingredient(ingredientIcon: "huileolive", ingredientName: "Huile d'olives")
var huile = Ingredient(ingredientIcon: "huile", ingredientName: "Huile")
var lait = Ingredient(ingredientIcon: "lait", ingredientName: "Lait")
var mozzarella = Ingredient(ingredientIcon: "mozzarella", ingredientName: "Mozzarella")
var noix = Ingredient(ingredientIcon: "noix", ingredientName: "Noix")
var oeuf = Ingredient(ingredientIcon: "oeuf", ingredientName: "Oeufs")
var parmesan = Ingredient(ingredientIcon: "parmesan", ingredientName: "Parmesan")
var penne = Ingredient(ingredientIcon: "penne", ingredientName: "Pennes")
var spaghetti = Ingredient(ingredientIcon: "spaghetti", ingredientName: "Spaghettis")
var riz = Ingredient(ingredientIcon: "riz", ingredientName: "Riz")
var sel = Ingredient(ingredientIcon: "sel", ingredientName: "Sel")
var thym = Ingredient(ingredientIcon: "thym", ingredientName: "Thym")
var tomate = Ingredient(ingredientIcon: "tomateIcon", ingredientName: "Tomates")
var ail = Ingredient(ingredientIcon: "ail", ingredientName: "Ail")
var oignon = Ingredient(ingredientIcon: "oignon", ingredientName: "Oignon")
var poulet = Ingredient(ingredientIcon: "poulet", ingredientName: "Poulet")
var boeuf = Ingredient(ingredientIcon: "boeuf", ingredientName: "Boeuf")
var basilic = Ingredient(ingredientIcon: "basilic", ingredientName: "Basilic")
var porc = Ingredient(ingredientIcon: "porc", ingredientName: "Porc")
var vinaigre = Ingredient(ingredientIcon: "vinaigre", ingredientName: "Vinaigre")
var sucre = Ingredient(ingredientIcon: "sucre", ingredientName: "Sucre")
var pimentepice = Ingredient(ingredientIcon: "pimentepice", ingredientName: "Piment")
var aubergine = Ingredient(ingredientIcon: "aubergine", ingredientName: "Aubergines")



var ingredientsArray: [Ingredient] = [carotte, courgette, huileolive, huile, lait, mozzarella, noix, oeuf, parmesan, penne, spaghetti, riz, sel, thym, tomate, ail, oignon, poulet, boeuf, basilic, porc, vinaigre, sucre, pimentepice, aubergine]
