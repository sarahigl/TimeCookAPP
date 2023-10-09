//
//  ModaleEtapesRecette.swift
//  RatatouillePrototype
//
//  Created by Apprenant 16 on 28/03/2023.
//

import SwiftUI

// Créer une struct Etape

struct Etape: Identifiable {
    var id = UUID()
    var descriptionEtape: String
}

// Créer une class pour lier la struct Etape au tableau vide qui stockera les étapes crées et les affichera en liste

class ListEtapes: ObservableObject {
    @Published var etapes: [Etape] = []
}

// Créer la vue principale qui affichera la liste des étapes


struct ModaleEtapesRecette: View {
    @EnvironmentObject var listEtapes: ListEtapes
    @EnvironmentObject var manager: Manager
    @EnvironmentObject var recipeVM: Recipes

    @State var isModaleEtapeOpened = false

    let columns = [GridItem(.flexible())]

    var body: some View {

        VStack(alignment: .leading) {
            ForEach(Array(listEtapes.etapes.enumerated()), id: \.1.id) { index, etape in
                ZStack {
                    HStack {
//                        Text("1.")
                        Text("\(index + 1).")
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                            .font(.title2)
                            .padding(.leading, 20)
                        Text("\(etape.descriptionEtape)")
                            .font(.body)
                        Spacer()
                    }
                    .frame(width: 330, height: 70)
                    .background(.white)
                    .cornerRadius(10)
                    .padding(5)
                    .shadow(radius: 3, y: 1)
                }
            }
            VStack(alignment: .leading) {
                Button(action: {
                    self.isModaleEtapeOpened.toggle()
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                        Image(systemName: "plus")
                            .foregroundColor(.orange)
                            .font(.custom("", size: 25))
                            .fontWeight(.bold)
                    }
                }
                .padding([.top,.bottom], 10)
                .sheet(isPresented: self.$isModaleEtapeOpened) {
                    ModaleEtape(isModaleEtapeOpened: self.$isModaleEtapeOpened)
                        .environmentObject(self.listEtapes)
                }
            }
        }
    }
}


struct ModaleEtape: View {

    @EnvironmentObject var listEtapes: ListEtapes
    @State private var descriptionEtape = ""
    @Binding var isModaleEtapeOpened : Bool

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    TextField("Décrire l'étape de votre recette", text: $descriptionEtape)
                    Button(action: {
                        if !descriptionEtape.isEmpty {
                            self.listEtapes.etapes.append(Etape(descriptionEtape: descriptionEtape))
                            self.isModaleEtapeOpened = false
                        }
                    }, label: {
                        Text("Enregistrer")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                            .cornerRadius(8)
                    })
                }
                .scrollContentBackground(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Ajouter une étape à votre recette")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct ModaleEtapesRecette_Previews: PreviewProvider {
    static var previews: some View {
        ModaleEtapesRecette()
            .environmentObject(ListEtapes())
            .environmentObject(Manager())
            .environmentObject(Recipes())
    }
}
