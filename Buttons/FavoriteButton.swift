//
//  FavoriteButton.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 23/03/2023.
//

import Foundation
import SwiftUI

struct FavoriteButton: View {
    @Binding var isliked: Bool
    
    var body: some View{
        Button(action : {
            withAnimation{
                self.isliked.toggle()
            }
        }, label: {
            Image(systemName: isliked ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isliked ? .red : .gray)
        })
    }
}

//struct FavoriteButton: View {
//    @State private var heart: String = "heart"
//
//    var body: some View {
//        VStack{
//            Button(action: { heart = (heart == "heart" ? "heart.fill" : "heart") }) {
//                Image(systemName: heart)
//                    .resizable()
//                    .frame(width: 20, height: 20)
//                    .foregroundColor(.red)
//            }
//        }
//    }
//}
//
//struct FavoriteButton_Previews: PreviewProvider {
//    static var previews: some View {
//        FavoriteButton()
//    }
//}
