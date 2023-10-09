import SwiftUI

struct CategoryButtonView: View {
    @State var equilibreCategory : Color = GrayColor
    @State var veganCategory : Color = GrayColor
    @State var asiatiqueCategory : Color = GrayColor
    @State var vegetarienCategory : Color = GrayColor

    @State private var selectedButton = CouleurVert
    @Binding var category : String
    @State var clickCategory: Bool = false
    
    @State var rows = [GridItem(.flexible())]

    var body: some View {
        ScrollView (.horizontal, showsIndicators: false){
            LazyHGrid(rows : rows, spacing : 5){
//                HStack{
                    Button(action: {

                        equilibreCategory = (equilibreCategory == GrayColor ? selectedButton : GrayColor)
                        veganCategory = (veganCategory == selectedButton ? GrayColor : GrayColor)
                        asiatiqueCategory = (asiatiqueCategory == selectedButton ? GrayColor : GrayColor)
                        vegetarienCategory = (vegetarienCategory == selectedButton ? GrayColor : GrayColor)
                        if ( equilibreCategory == selectedButton ){
                            category = "Equilibré"
                            clickCategory = true
                        }
                        // if no category selected
                        if ( equilibreCategory == GrayColor &&  veganCategory == GrayColor && asiatiqueCategory == GrayColor &&
                             vegetarienCategory == GrayColor){
                            category = ""
                        }
                    }) {
                        ZStack{
                            Text("Equilibré")
                            //                        .foregroundColor(equilibreCategory)
                                .foregroundColor(category.contains("Equilibré") ? .white : .black)
                                .padding([.bottom, .top], 5)
                                .padding([.leading, .trailing], 10) //au lieu de 15
                                .background(equilibreCategory)
                            //                        .background(category.contains("Equilibré") ? CouleurVert : GrayColor)
                                .cornerRadius(250)


                        }//ZStack
                    }.accentColor(CouleurNoir) //Button
                        .sheet(isPresented: $clickCategory) { RecipesCatEquilibreLazyVGridView()}


                    Button(action: {
                        veganCategory = (veganCategory == GrayColor ? selectedButton : GrayColor)
                        equilibreCategory = (equilibreCategory == selectedButton ? GrayColor : GrayColor)
                        asiatiqueCategory = (asiatiqueCategory == selectedButton ? GrayColor : GrayColor)
                        vegetarienCategory = (vegetarienCategory == selectedButton ? GrayColor : GrayColor)
                        if ( veganCategory == selectedButton ){
                            category = "Vegan"
                        }
                        // if no category selected
                        if ( equilibreCategory == GrayColor &&  veganCategory == GrayColor && asiatiqueCategory == GrayColor &&
                             vegetarienCategory == GrayColor){
                            category = ""
                        }
                        // end if no category selected
                    }) {
                        ZStack{
                            Text("Vegan")
                                .foregroundColor(category.contains("Vegan") ? .white : .black)
                                .padding([.bottom, .top], 5)
                                .padding([.leading, .trailing], 10) //au lieu de 15
                                .background(veganCategory)
                            //                        .background(category.contains("Vegan") ? CouleurVert : GrayColor)
                                .cornerRadius(250)
                        }//ZStack
                    }.accentColor(CouleurNoir) //Button
                        .sheet(isPresented: $clickCategory) { RecipesLazyVGridView()}

                    Button(action: {
                        asiatiqueCategory = (asiatiqueCategory == GrayColor ? selectedButton : GrayColor)
                        veganCategory = (veganCategory == selectedButton ? GrayColor : GrayColor)
                        equilibreCategory = (equilibreCategory == selectedButton ? GrayColor : GrayColor)
                        vegetarienCategory = (vegetarienCategory == selectedButton ? GrayColor : GrayColor)
                        if ( asiatiqueCategory == selectedButton ){
                            category = "Asiatique"
                        }
                        // if no category selected
                        if ( equilibreCategory == GrayColor &&  veganCategory == GrayColor && asiatiqueCategory == GrayColor &&
                             vegetarienCategory == GrayColor){
                            category = ""
                        }
                        // end if no category selected
                    }) {
                        ZStack{
                            Text("Asiatique")
                                .foregroundColor(category.contains("Asiatique") ? .white : .black)
                                .padding([.bottom, .top], 5)
                                .padding([.leading, .trailing], 10) //au lieu de 15
                                .background(asiatiqueCategory)
                            //                            .background(category.contains("Asiatique") ? CouleurVert : GrayColor)
                                .cornerRadius(250)
                        }//ZStack
                    }.accentColor(CouleurNoir) //Button
                        .sheet(isPresented: $clickCategory) { RecipesLazyVGridView()}

                    Button(action: {
                        vegetarienCategory = (vegetarienCategory == GrayColor ? selectedButton : GrayColor)
                        asiatiqueCategory = (asiatiqueCategory == selectedButton ? GrayColor : GrayColor)
                        veganCategory = (veganCategory == selectedButton ? GrayColor : GrayColor)
                        equilibreCategory = (equilibreCategory == selectedButton ? GrayColor : GrayColor)
                        if ( vegetarienCategory == selectedButton ){
                            category = "Végétarien"
                        }
                        // if no category selected
                        if ( equilibreCategory == GrayColor &&  veganCategory == GrayColor && asiatiqueCategory == GrayColor &&
                             vegetarienCategory == GrayColor){
                            category = ""
                        }

                        // end if no category selected
                    }) {
                        ZStack{
                            Text("Végétarien")
                                .foregroundColor(category.contains("Végétarien") ? .white : .black)
                                .padding([.bottom, .top], 5)
                                .padding([.leading, .trailing], 10) //au lieu de 15
                                .background(vegetarienCategory)
                            //                            .background(category.contains("Asiatique") ? CouleurVert : GrayColor)
                                .cornerRadius(250)
                        }//ZStack
                    }.accentColor(CouleurNoir) //Button
                        .sheet(isPresented: $clickCategory) { RecipesLazyVGridView()}

//                }//HStack
            }
        }


    }
}

struct CategoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButtonView(category: .constant(""))
    }
}
