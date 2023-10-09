//
//  SearchAndScanView.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 22/03/2023.
//

import SwiftUI

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
                TextField("Rechercher", text: $search)
            }
            .padding()
            .background(GrayColor)
            .cornerRadius(10)
            .padding(.trailing)
            
            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.black)
                    .font(.custom("", size: 25))
                    .cornerRadius(10)
            }
        }
    }
}

struct SearchAndScanView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndScanView()
    }
}
