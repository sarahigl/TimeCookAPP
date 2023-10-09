import SwiftUI
import Foundation

struct RecipesListView: View {
    @EnvironmentObject var recipeVM: Recipes
    @State private var searchTerm: String = ""
    @State var searchText = ""

    var recipesFilter : [Recipe]{
        return recipeVM.recipesArray.filter { item in
            (item.recipeName.lowercased().hasPrefix(searchTerm.lowercased()))
        }
    }

    var recipes : [Recipe] {
        if searchText.isEmpty{
            return recipeVM.recipesArray
        } else {
            return recipeVM.recipesArray.filter{
                $0.recipeName.lowercased().contains(searchText.lowercased())
            }
        }
    }

    var body: some View {
        NavigationStack {
            SearchBar(text: $searchTerm)
            if (searchTerm != ""){
                if (recipesFilter.isEmpty){
                    Text("Aucun nom de Recette n'est disponible pour cette recherche.")
                }
                else{
                    VStack {
                        ScrollView(showsIndicators: false) {
                            ForEach(recipesFilter){ item in
                                VStack(alignment: .leading){
                                    Spacer()
                                    RecipeRow(recipe: item)
                                }
                            }
                            .padding()
                        }
                    }
                }
                Spacer()
            }

            if (searchTerm == "") {
                CategoryButtonView(category: .constant(""))
                    .frame(height: 45)
                    .padding(.leading)
            }

            if (searchTerm == ""){
                VStack {
                    ScrollView(showsIndicators: false) {
                        ForEach(recipeVM.recipesArray){ item in
                            VStack(alignment: .leading){
                                Spacer()
                                RecipeRow(recipe: item)
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationTitle("Liste des recettes")
    }
}

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        ZStack{
            HStack {
                VStack{}
                    .font(.title2)
                    .padding(8)
                    .background(Color.white)
                    .cornerRadius(8)
                    .searchable(text: $text, prompt: "Recherche")
            }
            .padding(.horizontal)
        }

    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipesListView()
            .environmentObject(Recipes())
    }
}
