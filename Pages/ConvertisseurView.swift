//
//  ConvertisseurView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 16 on 23/03/2023.
//

import SwiftUI

struct ConvertisseurView: View {
    var body: some View {
        ZStack {
                VStack (alignment: .leading){
                    Image("elipse-convertisseur")
                        .ignoresSafeArea()
                        .frame(maxHeight: 110)
//                        .padding(.leading, 0)
                    Text("Convertisseur")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                        .padding(.top, 60)
                    Rectangle()
                        .frame(width: 250, height: 0.5)
                        .padding(.leading, 20)
                    Text("Conversion des unités liquide")
                        .font(.title3)
                        .fontWeight(.regular)
                        .padding(.leading, 37)
                        .padding(.top, 20)
                        .padding(.bottom, -10)
                    UnitsConversion()
                    Spacer()
                }
            Image("radis")
                .padding(.bottom, 270)
                .padding(.leading, 270)
                .opacity(0.4)
            Image("champignon")
                .padding(.top, 450)
                .padding(.leading, 250)
                .opacity(0.4)
            Image("tomate")
                .padding(.top, 680)
                .padding(.trailing, 200)
                .opacity(0.4)
        }
    }
}


struct ConvertisseurView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertisseurView()
    }
}
