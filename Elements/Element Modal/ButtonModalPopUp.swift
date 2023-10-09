//
//  ButtonModalPopUp.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 22/03/2023.
//

import SwiftUI

struct ButtonModalPopUp: View {
    @State var btnColor15min : Color = .white
    @State var btnColor30min : Color = .white
    @State var btnColor10min : Color = .white
    @State private var selectedButton = GrayDarkColor
    @Binding var time : Int
    var body: some View {
        HStack{
            Button(action: {
                btnColor10min = (btnColor10min == .white ? selectedButton : .white)
                btnColor30min = (btnColor30min == selectedButton ? .white : .white)
                btnColor15min = (btnColor15min == selectedButton ? .white : .white)
                if ( btnColor10min == selectedButton ){
                    time = 10
                }
                // if no time selected
                if ( btnColor15min == .white &&  btnColor30min == .white && btnColor10min == .white){
                    time = 0
                }
                // end if no time selected
            }) {
                    ZStack{
                        Circle()
                            .frame(maxWidth: 100)
                            .foregroundColor(btnColor10min)
                            .shadow(radius: 2, x:0, y: 3)
                        VStack {
                            Text("10")
                                .fontWeight(.bold)
                            Text("min")
                                .multilineTextAlignment(.center)
                        }
                    }
                }.accentColor(CouleurNoir)
            
            Button(action: {
                btnColor15min = (btnColor15min == .white ? selectedButton : .white)
                btnColor30min = (btnColor30min == selectedButton ? .white : .white)
                btnColor10min = (btnColor10min == selectedButton ? .white : .white)
                if ( btnColor15min == selectedButton ){
                    time = 15
                }
                // if no time selected
                if ( btnColor15min == .white &&  btnColor30min == .white && btnColor10min == .white){
                    time = 0
                }
                // end if no time selected
            }) {
                ZStack{
                    Circle()
                        .frame(maxWidth: 100)
                        .foregroundColor(btnColor15min)
                        .shadow(radius: 2, x:0, y: 3)
                    VStack {
                        Text("15")
                            .fontWeight(.bold)
                        Text("min")
                            .multilineTextAlignment(.center)
                    }
                }
            }.accentColor(CouleurNoir)

            Button(action: {
                btnColor30min = (btnColor30min == .white ? selectedButton : .white)
                btnColor15min = (btnColor15min == selectedButton ? .white : .white)
                btnColor10min = (btnColor10min == selectedButton ? .white : .white)
                if ( btnColor30min == selectedButton ){
                    time = 30
                }
                // if no time selected
                if ( btnColor15min == .white &&  btnColor30min == .white && btnColor10min == .white){
                    time = 0
                }
                // end if no time selected
            }) {
                    ZStack{
                        Circle()
                            .frame(maxWidth: 100)
                            .foregroundColor(btnColor30min)
                            .shadow(radius: 2, x:0, y: 3)
                        VStack {
                            Text("30")
                                .fontWeight(.bold)
                            Text("min")
                                .multilineTextAlignment(.center)
                        }
                    }
                }.accentColor(CouleurNoir)
        }
    }
}

struct ButtonModalPopUp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonModalPopUp(time: .constant(0))
    }
}

//struct ButtonModalPopUp: View {
//    var body: some View {
//        HStack{
//            ZStack {
//                Button{}
//            label: {
//                ZStack{
//                    Circle()
//                        .frame(maxWidth: 100)
//                        .foregroundColor(.white)
//                        .shadow(radius: 2, x:0, y: 3)
//                    VStack {
//                        Text("15")
//                            .fontWeight(.bold)
//                        Text("min")
//                            .multilineTextAlignment(.center)
//                    }
//                }
//                .foregroundColor(CouleurNoir)
//            }
//            }
//
//            ZStack {
//                Button{}
//            label: {
//                ZStack{
//                    Circle()
//                        .frame(maxWidth: 100)
//                        .foregroundColor(.white)
//                        .shadow(radius: 2, x:0, y: 3)
//                    VStack {
//                        Text("30")
//                            .fontWeight(.bold)
//                        Text("min")
//                            .multilineTextAlignment(.center)
//                    }
//                }
//            }
//            }
//            .foregroundColor(CouleurNoir)
//
//            ZStack {
//                Button{}
//                label: {
//                    ZStack{
//                        Circle()
//                            .frame(maxWidth: 100)
//                            .foregroundColor(.white)
//                            .shadow(radius: 2, x:0, y: 3)
//                        VStack {
//                            Text("45")
//                                .fontWeight(.bold)
//                            Text("min")
//                                .multilineTextAlignment(.center)
//                        }
//                    }
//                }
//            }
//            .foregroundColor(CouleurNoir)
//
//        }
//    }
//}
//
//struct ButtonModalPopUp_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonModalPopUp()
//    }
//}
