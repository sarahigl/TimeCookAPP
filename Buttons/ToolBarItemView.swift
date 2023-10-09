//
//  ToolBarItemView.swift
//  RatatouillePrototype
//
//  Created by sarah iglla on 24/03/2023.
//

import SwiftUI

struct ToolBarItemView: View {
    @EnvironmentObject var manager : Manager
    @EnvironmentObject var recipeVM : Recipes
    var body: some View {
        NavigationStack{
            Text("")
            .toolbar{
                ToolbarItem(placement:
                        .navigationBarTrailing){
                            Button(action: {
                            }, label: {
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(Color.black)
                            })
                        }
//                rapprocher les boutons? spacer X
                ToolbarItem(placement:
                        .navigationBarTrailing){
                            Button(action: {
                            }, label: {
                                Image(systemName: "gear")
                                    .foregroundColor(Color.black)
                            })
                        }
            }
        }
    }
}

struct ToolBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToolBarItemView()
            .environmentObject(Manager())
            .environmentObject(Recipes())
    }
}
