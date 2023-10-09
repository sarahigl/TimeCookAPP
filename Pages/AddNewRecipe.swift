//
//  AddNewRecipe.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 24/03/2023.
//

import SwiftUI

struct AddNewRecipe: View {
    @EnvironmentObject var manager : Manager
    @EnvironmentObject var recipeVM : Recipes
    @EnvironmentObject var listEtapes : ListEtapes

    @State private var titreRecette = ""
    @State private var dureeCuisson = ""
    @State private var dureePreparation = ""
    @State var showSheet = false

    var tempsTotal: Int {
        let dureeCuissonInt = Int(dureeCuisson) ?? 0
        let dureePreparationInt = Int(dureePreparation) ?? 0
        return dureeCuissonInt + dureePreparationInt
    }
//    var tempsTotel = Int(dureeCuisson) + Int(dureePreparation)

    var body: some View {
        VStack {
            ZStack{
                Rectangle()
                    .foregroundColor(GrayColor)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 150)
                    .padding(.bottom, 50)
                Image("radis")
                    .padding(.trailing, 320)
                    .padding(.bottom, 80)
                Image("tomate")
                    .padding(.leading, 350)
                    .padding(.bottom, 80)
                Image("salade")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .offset(y : 20)
            }
            ScrollView{
                VStack(alignment: .leading){
                    Text("Ajouter une nouvelle recette")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                    Text("Titre de la recette")
                        .padding(.leading, 20)
                        .font(.headline)
                        .fontWeight(.bold)
                    TextField("Ajoutez un titre à la recette...", text: $titreRecette)
                        .foregroundColor(.black)
                        .padding(5)
                        .frame(width: 300)
                        .multilineTextAlignment(.leading)
                        .background(GrayColor)
                        .padding(.leading, 20)
                    Text("Informations de base")
                        .font(.headline)
                        .padding(.leading, 20)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .padding(.bottom, -10)
                    VStack(alignment: .leading){
                        HStack {
                            TextField("0", text: $dureeCuisson)
                                .foregroundColor(.black)
                                .padding(5)
                                .frame(width: 50)
                                .multilineTextAlignment(.center)
                                .background(GrayColor)
                            Text("min")
                            Text("Temps de cuisson")
                                .padding(5)
                                .frame(width: 190)
                                .background(CouleurOrangeClaire)
                                .cornerRadius(10)
                        }
                        HStack {
                            TextField("0", text: $dureePreparation)
                                .foregroundColor(.black)
                                .padding(5)
                                .frame(width: 50)
                                .multilineTextAlignment(.center)
                                .background(GrayColor)
                            Text("min")
                            Text("Temps de Préparation")
                                .padding(5)
                                .frame(width: 190)
                                .background(CouleurJaune)
                                .cornerRadius(10)
                        }
                        HStack {
                            Text("\(tempsTotal)")
                                .frame(maxWidth: 32)
                                .padding(.leading, 10)
                                .padding(.top, 5)
                            Text("min")
                                .padding(.leading, 10)
                            Text("Temps total")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(5)
                                .frame(width: 120)
                                .background(CouleurVert)
                                .cornerRadius(10)
                        }
                    }
                    .frame(width: 350, height: 150)
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                    .shadow(radius: 3, y: 2)

                    VStack(alignment : .leading){
                        Text("Ingrédients de la recette")
                            .fontWeight(.bold)
                            .padding(.leading, 20)
                            .padding(.bottom, 1)
                            .font(.headline)
                        Text("Cliquez sur \"+\" pour ajouter un ingrédient")
                            .foregroundColor(GraySomberColor)
                            .padding(.leading, 20)
                        ModaleIngredients()
                            .frame(height: 140)
                            .padding(.top, -20)
                            .padding(.bottom, -10)
                        Text("Etapes de la recette")
                            .padding(.leading, 20)
                            .padding(.bottom, 1)
                            .fontWeight(.bold)
                            .font(.headline)
                        Text("Cliquez sur \"+\" pour ajouter une étape")
                            .foregroundColor(GraySomberColor)
                            .padding(.leading, 20)
                        ModaleEtapesRecette()
                            .frame(minHeight: 150)
                            .padding(.leading, 20)
                    }
                    Button{}
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(CouleurVert)
                                .frame(width: 200)
                            Text("Publier ma recette")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding([.top, .bottom], 10)
                                .padding([.leading, .trailing],50)
                                .cornerRadius(10)
                        }
                        .padding(.bottom, 70)
                    }
                }
            }
            .padding()
            .frame(minHeight: 600)
        }
    }
}

struct AddNewRecipe_Previews: PreviewProvider {
    static var previews: some View {
        AddNewRecipe()
            .environmentObject(Recipes())
            .environmentObject(Manager())
            .environmentObject(ListEtapes())
    }
}
