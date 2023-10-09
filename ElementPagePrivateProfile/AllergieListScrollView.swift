//
//  AllergieListScrollView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import SwiftUI

struct AllergieListScrollView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Vous êtes allergiques ou n’aimez pas ...")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top)
            IngredientsScrollView()
        }
        .padding()
    }
}

struct AllergieListScrollView_Previews: PreviewProvider {
    static var previews: some View {
        AllergieListScrollView()
    }
}
