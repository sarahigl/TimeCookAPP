//
//  CaroucelprofileTest.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import SwiftUI

struct CaroucelprofileTest: View {
    @EnvironmentObject var recipeVM: Recipes
    @EnvironmentObject var manager: Manager
    var body: some View {
        HStack{
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(recipeVM.recipesArray) { carousel in
                            VStack{
                                Image(carousel.recipeImage)
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .aspectRatio(80, contentMode: .fill)
                                    .padding(1)
                                    .cornerRadius(20)
        
                                    Text(carousel.recipeName)
                        }
                            .frame(width: 160, height: 200)
                    }
                    
                }
            }
        }
    }
}

struct CaroucelprofileTest_Previews: PreviewProvider {
    static var previews: some View {
        CaroucelprofileTest()
            .environmentObject(Recipes())
            .environmentObject(Manager())
    }
}
