//
//  HeaderTitle.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 22/03/2023.
//

import SwiftUI

struct HeaderTitle: View {
    var body: some View {
        HStack{
            VStack (alignment: .leading, spacing: 0){
                Text("Cuisinez")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Rapide, Simple.")
                    .font(.title2)
                    .fontWeight(.medium)
            }
            Spacer()
            NavigationLink(destination: RecipesListView()){
                Text("Liste")
            }
        }
    }
}

struct HeaderTitle_Previews: PreviewProvider {
    static var previews: some View {
        HeaderTitle()
    }
}
