import SwiftUI

struct RecipesHome: View {
    @EnvironmentObject var recipeVM: Recipes

    @State var color10 : Color = GrayColor
    @State var color15 : Color = GrayColor
    @State var color30 : Color = GrayColor
    @State private var searchTerm: String = ""
    var recipesFilter : [Recipe]{
        return recipeVM.recipesArray.filter { item in
            (item.recipeName.lowercased().hasPrefix(searchTerm.lowercased()) )
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
    @State var searchText = ""

    @State var showModal = true
    @State var time : Int = 0

    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HeaderTitle()
                SearchAndScanView()
                    .padding(.bottom)

                ScrollView (showsIndicators: false){
                    
                    VStack(alignment: .leading){

                        VStack(alignment: .leading){
                            Text("Chez moi, j'ai ...")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Je sélectionne les ingrédients")
                                .foregroundColor(GraySomberColor)
                        }
                        
                        SelectedIngredientsScrollView() //ajouter une couleur au clic
                            .frame(height: 120)
                            .padding(.bottom)


                        HStack{
                            Button (action:{
                                if (color10 == GrayColor){
                                    color10 = CouleurVert
                                    color15 = GrayColor
                                    color30 = GrayColor
                                    time = 10
                                }
                                else{
                                    color10 = GrayColor
                                }
                            }){
                                VStack {
                                    Text("10 min")
                                        .frame(minWidth: 90)
                                        .padding([.bottom, .top], 5)
                                        .padding([.leading, .trailing], 10) //au lieu de 15
                                        .background(color10)
                                        .foregroundColor(.black)
                                        .cornerRadius(250)

                                }//VStack
                            }//Button
                            Button (action:{
                                if (color15 == GrayColor){
                                    color10 = GrayColor
                                    color15 = CouleurVert
                                    color30 = GrayColor
                                    time = 15
                                }
                                else{
                                    color15 = GrayColor
                                }
                            }){
                                VStack {
                                    Text("15 min")
                                        .frame(minWidth: 90)
                                        .padding([.bottom, .top], 5)
                                        .padding([.leading, .trailing], 10)
                                        .background(color15)
                                        .foregroundColor(.black)
                                        .cornerRadius(250)

                                }//VStack
                            }//Button
                            Button (action:{
                                if (color30 == GrayColor){
                                    color10 = GrayColor
                                    color15 = GrayColor
                                    color30 = CouleurVert
                                    time = 30
                                }
                                else{
                                    color30 = GrayColor
                                }
                            }){
                                VStack {
                                    Text("30 min")
                                        .frame(minWidth: 90)
                                        .padding([.bottom, .top], 5)
                                        .padding([.leading, .trailing], 10)
                                        .background(color30)
                                        .foregroundColor(.black)
                                        .cornerRadius(250)

                                }//VStack
                            }//Button
                        }
                        CategoryButtonView(category: .constant(""))






                        if (time == 0){
                            VStack(alignment: .leading){
                                Text("Toutes les recettes")
                                    .font(.title2)
                                    .bold()
                                ScrollView(.horizontal, showsIndicators: false) {
                                    NavigationStack{
                                        LazyHGrid(rows: [GridItem(.flexible())],spacing: 5) {
                                            ForEach(recipeVM.recipesArray) { item in
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
                                                    .frame(width: 130, height: 180)
                                                }
                                            }
                                            .scrollContentBackground(.hidden)
                                            .frame(width: 140)
                                        }
                                    }
                                    .accentColor(.black)
                                }
                                Spacer()
                            }
                           .padding(.bottom)
                        }

                        if(time == 10){
                            RecipesCarousel()//Recette en moins de 15 min
                            Spacer()
                        }
                        if(time == 15){
                            Recettes15minutes()//Recette en moins de 30 min
                            Spacer()
                        }
                        if(time == 30){//|| time == 0
                            Recettes30minutes()//Recette en moins de 45 min
                            Spacer()
                        }


                        Text("Recettes équilibrées")
                            .font(.title2)
                            .fontWeight(.bold)
                        RecipesScrollView(recipes: recipeVM.recipesArray)
                    }

                }
            }
            .padding()
        }
        .sheet(isPresented: $showModal){
            WelcomeModal(showModal: $showModal, time : $time)
                .presentationDetents([.height(360)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct RecipesHome_Previews: PreviewProvider {
    static var previews: some View {
        RecipesHome()
            .environmentObject(Recipes())
    }
}

struct CategoryClock : View {
    var recipeTimeCategory : Int
    var body: some View{
        HStack {
            Image(systemName: "clock")
                .foregroundColor(GraySomberColor)
            Text("\(recipeTimeCategory) min")
                .foregroundColor(GraySomberColor)
        }
    }
}
