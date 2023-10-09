//
//  WelcomeModal.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 22/03/2023.
//

import SwiftUI

struct WelcomeModal: View {
    @Binding var showModal : Bool
    @Binding var time : Int
    var body: some View {
        VStack{
            ZStack {
                Image("avocado")
                    .opacity(0.3)
                    .padding(.leading, 145)
                    .padding(.top, 35)
                VStack (alignment: .leading){
                    Text("Bonjour !")
                        .font(.title)
                    .fontWeight(.bold)
                    Text("Combien de temps")
                        .fontWeight(.bold)
                        .foregroundColor(CouleurVert)
                    + Text(" voulez-vous cuisiner aujourd'hui ?")
                }
            }
            ButtonModalPopUp(time : $time)
            HStack{
                Button{
                    if (time != 0){
                        showModal = false
                    }
                    if (time == 0){
                        showModal = true
                    }
                }
                label : {
                    if ( time != 0 ){
                        Text("Confirmer")
                            .foregroundColor(.white)
                            .frame(width: 130, height: 40)
                            .background(CouleurVert)
                            .cornerRadius(50)
                    }
                }
                Button{
                    showModal = false
                    self.time = 0
                }
                label : {
                    Text("Passer cette étape")
                        .foregroundColor(CouleurVert)
                        .padding()
                }
            }
            .padding(.top)
        }
        .padding()
    }
}
struct WelcomeModal_Preview: PreviewProvider {
    static var previews: some View{
    WelcomeModal(showModal: .constant(true), time: .constant(15))
    }
}
