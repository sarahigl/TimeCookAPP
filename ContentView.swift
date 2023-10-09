//
//  ContentView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipeVM: Recipes
    @EnvironmentObject var manager: Manager
    @EnvironmentObject var listEtapes: ListEtapes
    init() {
        UITabBar.appearance().backgroundColor = .white
    } //Initialiser la couleur de fond de la tabView
    var body: some View {
        TabView {
            Group {
                RecipesHome()
                    .tabItem {
                        Image(systemName: "fork.knife")
                        Text("Recettes")
                            .font(.title3)
                    }
                ConvertisseurView()
                    .tabItem {
                        Image(systemName: "arrow.left.arrow.right")
                        Text("Convertisseur")
                            .font(.title3)
                    }
//                ProfilPublicUtilisateur(userApp : users[2])
                ProfilePersoView(userApp: users[2])
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profil")
                            .font(.title3)
                    }
            }
        }
        .accentColor(CouleurOrangeClaire)
        .environmentObject(Recipes())
        .environmentObject(Manager())
        .environmentObject(ListEtapes())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Recipes())
            .environmentObject(Manager())
            .environmentObject(ListEtapes())
    }
}
