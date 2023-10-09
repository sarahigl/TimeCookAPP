//
//  BadgesScrollView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 24/03/2023.
//

import SwiftUI

struct BadgesScrollView: View {
    let badges : [Badge]
    let rows = [GridItem(.fixed(10), spacing: 5)]
    
    var body: some View {
        VStack(alignment: .leading){
            ScrollView (.horizontal, showsIndicators: false){
                LazyHGrid (rows: rows){
                    ForEach(badges) { badge in
                        VStack(alignment: .center){
                            ZStack{
    //                            RoundedRectangle(cornerRadius: 10)
                                Circle()
                                    .foregroundColor(.white)
                                    .shadow(radius: 3, y: 3)
                                Text(badge.badgeIcon)
                                    .foregroundColor(.red)
                                    .font(.custom("", size: 45))
                                    .frame(width: 60)
                                    .padding()
                            }
                            Text(badge.badgeTitle)
//                                .fontWeight(.bold)
                                .frame(width: 100, height: 50)
                        }
                    }
                }
                .padding()
            }
            .scrollContentBackground(.hidden)
        }
//        .padding(.top)
    }
}

struct BadgesScrollView_Previews: PreviewProvider {
    static var previews: some View {
        BadgesScrollView(badges: badges)
    }
}
