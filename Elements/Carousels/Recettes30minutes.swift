import SwiftUI

struct Recettes30minutes: View {
    @EnvironmentObject var recipeVM: Recipes
    let rowsCarousel = [GridItem(.flexible())]
    var recipesFilter30 : [Recipe]{
        return recipeVM.recipesArray.filter { item in
            (item.recipeTimeCategory) < 30 &&  (item.recipeTimeCategory) >= 15
        }
    }

    var body: some View {
        VStack(alignment: .leading){
            Text("Recette en moins de 30 min")
                .font(.title2)
                .fontWeight(.bold)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rowsCarousel, spacing: 10) {
                    if (recipesFilter30.isEmpty){
                        ZStack{
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(width: 130, height: 130)
                                .cornerRadius(10)
                                .shadow(radius: 2, y: 3)
                            Text("Aucune recette \nn'est disponible")
                        }
                    }
                    ForEach(recipesFilter30) { item in
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

struct Recettes30minutes_Previews: PreviewProvider {
    static var previews: some View {
        Recettes30minutes()
            .environmentObject(Recipes())
    }
}
