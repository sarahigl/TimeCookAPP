//
//  ModaleIngredients.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 28/03/2023.
//

import SwiftUI
import Foundation


class Manager : ObservableObject {

    @Published var chosenProducts : [Ingredient] = []
    var products = ingredientsArray
}


struct ModaleIngredients: View {
    @EnvironmentObject var manager : Manager
    @EnvironmentObject var recipeVM : Recipes

    @State var isSheetOpened = false
    let rows = [GridItem(.fixed(10), spacing: 10)]
    @State private var selectedIngredients : Set<String> = []

    var body: some View {
        HStack {
            Button(action: {
//                isSheetOpened.toggle()
                self.isSheetOpened.toggle()
            }) {
                ZStack {
                    Circle()
                        .frame(width: 50)
                        .foregroundColor(.white)
                        .shadow(radius: 3)
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                        .font(.custom("", size: 25))
                        .fontWeight(.bold)
                }
            }
            ScrollView (.horizontal, showsIndicators: false){
                LazyHGrid(rows: rows) {
                    ForEach(manager.chosenProducts) { product in
                        VStack (alignment: .center) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .shadow(radius: 3, y: 2)
                                VStack {
                                    Image(product.ingredientIcon)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text(product.ingredientName)
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(minWidth: 100, minHeight: 100)
                            .overlay(
                                ZStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.custom("", size : 30))
                                        .foregroundColor(Color.green)
                                        .offset(x: 45, y: -40)
                                        .opacity(selectedIngredients.contains(product.ingredientName) ? 1 : 0)
                                }
                            )
//                            .onTapGesture {
//                                self.manager.chosenProducts.remove(at: index)
//                            }
//                                if selectedIngredients.contains(product.ingredientName) {
//                                    selectedIngredients.remove(product.ingredientName)
//                                } else {
//                                    selectedIngredients.insert(product.ingredientName)
//                                }
//                                delete(indexes: <#T##IndexSet?#>)
//                            .onDelete(perform : delete)
                        }
                    }
                } .padding(.leading, 4)
            }
            .sheet(isPresented: self.$isSheetOpened) {
                Sheet(isSheetOpened: self.$isSheetOpened)
                    .environmentObject(self.manager)
                    .environmentObject(self.recipeVM)
            }
        } .padding()
    }
    
//    func delete(indexes: IndexSet?){
//        if let indexes {
//            for index in indexes {
//                manager.chosenProducts.remove(at:index)
//            }
//        }
//    }
}


struct ModaleIngredients_Previews: PreviewProvider {
    static var previews: some View {
        ModaleIngredients()
            .environmentObject(Manager())
            .environmentObject(Recipes())
    }
}


struct Sheet: View {

    @EnvironmentObject var manager : Manager
    @EnvironmentObject var recipeVM : Recipes

    @Binding var isSheetOpened : Bool

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    @State var searchIngredient = ""
    

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(manager.products) { product in
                        Button(action: {
                            self.manager.chosenProducts.append(product)
                            self.isSheetOpened = false
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(minWidth: 100, minHeight: 100)
                                    .foregroundColor(.white)
                                    .shadow(radius: 3, y: 2)
                                VStack {
                                    Image(product.ingredientIcon)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text(product.ingredientName)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            .searchable(text: $searchIngredient)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Text("Choisissez votre produit")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
    }
}

//struct Sheet_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ModaleIngredients()
//            .environmentObject(Manager())
//            .environmentObject(Recipes())
//    }
//}

