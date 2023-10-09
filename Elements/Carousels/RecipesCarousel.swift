import SwiftUI

struct RecipesCarousel: View {
    //var recipes = [Recipe]()
    @EnvironmentObject var recipeVM: Recipes
    let rowsCarousel = [GridItem(.flexible())]
    var recipesFilter10 : [Recipe]{
        return recipeVM.recipesArray.filter { item in
                (item.recipeTimeCategory) <= 10
            }
        }

    var body: some View {
        VStack(alignment: .leading){
            Text("Recette en moins de 10 min")
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rowsCarousel) {
                    if (recipesFilter10.isEmpty){
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(width: 130, height: 130)
                                .cornerRadius(10)
                                .shadow(radius: 2, y: 3)
                            Text("Aucune recette \nn'est disponible")
                        }
                    }
                    ForEach(recipesFilter10) { item in
                        NavigationLink(destination: detailRecipe(item : item)){
                            VStack{
                                Image(item.recipeImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 130, height: 130)
                                    .cornerRadius(10)
                                    .shadow(radius: 2, y: 3)
                                VStack (alignment: .leading){
                                    Text(item.recipeName)
                                    CategoryClock(recipeTimeCategory: item.recipeTimeCategory)
                                }
                            }
                            .frame(width: 130, height: 200)
                        }
                        .accentColor(.black)
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            Spacer()
        }
       .padding(.top)
    }
}

struct RecipesCarousel_Previews: PreviewProvider {
    static var previews: some View {
        RecipesCarousel()
            .environmentObject(Recipes())
    }
}
