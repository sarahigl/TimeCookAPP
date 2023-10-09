//
//  ChargementView.swift
//  RatatouillePrototype
//
//  Created by sarah iglla on 29/03/2023.
//

import SwiftUI

struct ChargementView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var offset1: CGSize = .zero
       @State private var offset2: CGSize = .zero
       @State private var offset3: CGSize = .zero
    
    var body: some View {
        ZStack{
            Color("CouleurVert")
                .ignoresSafeArea()
                .opacity(0.20)
            if isActive {
                ContentView()
            } else {
                VStack{
                    VStack{
                        Image("logo_transparent")
                            .resizable()
                            .scaledToFit()
                            .padding(30)
                        
                            .scaleEffect(size)
                            .opacity(opacity)
                            .onAppear{
                                withAnimation(.easeIn(duration: 1.2)) {
                                    self.size = 0.9
                                    self.opacity = 1.0
                                }
                            }
                        
                            .onAppear{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    self.isActive = true
                                }
                            }
                    }
                    HStack {
                        Circle()
                            .fill(AngularGradient(gradient: Gradient(colors: [Color("CouleurVert"), Color("")]), center: .trailing))
                            .frame(width: 25, height: 25)
                            .padding()
                            .offset(offset1)
                            .onAppear() {
                                withAnimation(Animation.spring().repeatForever(autoreverses: true).speed(2.4)) {
                                    self.offset1.height = 8
                                }
                            }
                        
                        Circle()
                            .fill(AngularGradient(gradient: Gradient(colors: [Color("CouleurVert"), Color("")]), center: .trailing))
                            .frame(width: 25, height: 25)
                            .padding()
                            .offset(offset2)
                            .onAppear() {
                                withAnimation(Animation.spring().repeatForever(autoreverses: true).speed(2.3)) {
                                    self.offset2.height = 8
                                }
                            }
                        
                        Circle()
                            .fill(AngularGradient(gradient: Gradient(colors: [Color("CouleurVert"), Color("")]), center: .trailing))
                            .frame(width: 25, height: 25)
                            .padding()
                            .offset(offset3)
                            .onAppear() {
                                withAnimation(Animation.spring().repeatForever(autoreverses: true).speed(2)) {
                                    self.offset3.height = 8
                                }
                            }
                            .onAppear() {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                    //                                                            self.showNextScreen = true
                                    
                                }
                            }
                    }
                }
            }
                            
        }
    }
}

struct ChargementView_Previews: PreviewProvider {
    static var previews: some View {
        ChargementView()
    }
}
