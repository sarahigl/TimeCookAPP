//
//  IngredientsListScrollView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 22/03/2023.
//

import SwiftUI

struct IngredientsScrollView: View {
    let rows = [GridItem(.fixed(10), spacing: 10)]
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false){
            LazyHGrid(rows: rows){
                ForEach(ingredientsArray){ ingredient in
                    VStack (alignment: .center){
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .shadow(radius: 3, y: 2)
                            VStack{
                                Image(ingredient.ingredientIcon)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                Text(ingredient.ingredientName)
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(minWidth: 110, minHeight: 90)
                    }
                }
            }
            .padding(.leading, 4)
        }
    }
}

struct IngredientsScrollView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsScrollView()
    }
}
