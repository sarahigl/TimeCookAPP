//
//  detailRecipe.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 27/03/2023.
//

import SwiftUI
import UIKit
import WebKit

func concatenatedString(inputString : String, prefix : Int) -> String {
    let words = inputString.components(separatedBy: " ")
    let firstPart = words.prefix(2).joined(separator: " ")
    let secondPart = words.suffix(from: 2).joined(separator: " ")
    let concatenatedString = firstPart + "\n" + secondPart
    switch words.count {
    case 0...2:
        return inputString.count > 10 ? String(inputString.prefix(10)) + "..." + "\n": inputString + "\n"
    default:
        return String(concatenatedString.prefix(prefix)) + "..."
    }
}

struct YouTubePlayerView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        //Modification Marine >> Pour éviter que la vidéo soit en grand écran
        let configuration = WKWebViewConfiguration()
            configuration.allowsInlineMediaPlayback = true
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
//        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        uiView.load(URLRequest(url: youtubeURL))
    }
}

struct detailRecipeVideo: View {
    @State var show : Bool = true
    var title : String
    var videoID : String
    var frameHeight : Double
    var Proposee : String
    var body: some View {
        ZStack{
            VStack{
                if (show == true){
                    Image("\(title)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: frameHeight, alignment: .center)
                }
                else{
                    YouTubePlayerView(videoID: "\(videoID)")
                        .frame(maxHeight: frameHeight)
                        .scaledToFill()
                }
            }
            NavigationStack{
                Spacer()
                ZStack{
                    HStack{
                        Spacer()
                        NavigationLink(destination: ProfilPublicUtilisateur( userApp: users[2]), label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(CouleurVert)
                                           .frame(width: 220, height: 30)
                                Text("Proposée par \(Proposee)")
                                    .foregroundColor(.white)
                            }
                        })
                        .padding(.horizontal, 20)
                        Button{
                            show.toggle()
                        }
                        label :{
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.white)
                                           .frame(width: 90, height: 30)
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                        .foregroundColor(GrayDarkColor)
                                    Text("Play")
                                        .foregroundColor(CouleurNoir)
                                }
                            }
                        }
                    }
                    .frame(width: 0)
                }
                .frame(height: 50)
            }
        }
    }
}

struct detailTitle: View {
    var recipeCategory : String //RecipeCategory
    var title : String
    var body: some View{
        HStack{
            VStack (alignment: .leading){
                Text("\(title)")
                    .font(.title2)
                    .bold()
            }
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(CouleurVert)
                           .frame(width: 100, height: 30)
                Text("\(recipeCategory)")
//                Text("\(recipeCategory.rawValue)")
                    .foregroundColor(.white)
            }
        }
    }
}

struct detailTitle2: View {
    var title : String
    var body: some View{
        VStack (alignment: .leading){
            Text("\(title)")
                .font(.title3)
                .bold()
                .padding(.bottom, -3)
        }
    }
}

struct detailRecipeClock: View {
    var cuisson : Int
    var preparation : Int
    var body: some View {
        VStack (alignment: .leading) {//clock
            HStack{
                Image(systemName: "clock")
                Text("\(cuisson) min de cuisson")
            }
            Spacer()
            HStack{
                Image(systemName: "clock")
                Text("\(preparation) min de préparation")
            }
        }// clock
        .padding(.bottom)
    }
}

struct detailRecipeIngredients: View {
    var Ingredients : [Ingredient]
    @Binding var size : Double
    var body: some View {
        VStack (alignment: .leading) {
            detailTitle2(title: "Ingrédients nécessaires")
            ScrollView (.horizontal, showsIndicators: false){
                LazyHGrid(rows: [GridItem(.fixed(10), spacing: 10)]){
                    ForEach(Ingredients){ item in
                        VStack (alignment: .center){
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.white)
                                    .shadow(radius: 3, y: 2)
                                VStack{
                                    Image(item.ingredientIcon)
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    Text(item.ingredientName)
                                        .foregroundColor(.gray)
                                }
                            }
                            .frame(minWidth: 110, minHeight: 90)
                        }
                    }
                }
                .padding(.leading, 4)
                .frame(height: size )
            }
            .padding(.bottom)
        }
    }
}

struct detailSteps : View {
    var steps : RecipeDescription
    @Binding var size : Double
    var body: some View{
        VStack (alignment: .leading){
            detailTitle2(title: "Etapes")
        HStack (){
                Image("\(steps.recipeImageDescription)")
                            .resizable()
                            .frame(maxWidth: size , maxHeight:size)
                            .cornerRadius(10)
                            .shadow(radius: 2, y : 3)
                        Text("\(Text("\(steps.recipeDescription)"))")
                            .padding(.leading)
            }
            .padding(.bottom)
        }
    }
}

struct detailOtherRecipes: View {
    var recipeVM : Recipes
    @Binding var size : Double
    var body: some View {
        VStack (alignment: .leading){
            detailTitle2(title: "Recettes similaires")
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(recipeVM.recipesArray) { item in
                        NavigationLink(destination: detailRecipe(item : item)){
                            VStack (alignment: .leading){
                                Image("\(item.recipeImage)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size, height: size)
                                    .cornerRadius(10)
                                    .shadow(radius: 2, y: 3)
                                Text("\(concatenatedString(inputString: item.recipeName, prefix: 20))")
                            }
                        }
                        .accentColor(.black)
                    }
                    .frame(width: 105)
                }
            }
        }
    }
}

struct detailOpinionRectangle : View {
    var cornerRadius : Double
    var body: some View{
        VStack{
            RoundedRectangle(cornerRadius: 10.0)
                .padding(5)
                .foregroundColor(Color.white)
                .shadow(radius: 3, y: 2)
        }
    }
}

struct detailOpinion : View{
    var frame : Double = 50
    @State private var star : Int = 5
    var body: some View{
        VStack{
            ZStack{
                detailOpinionRectangle(cornerRadius: 10.0)
                VStack (alignment: .leading){
                    HStack{
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(maxWidth: frame, maxHeight: frame)
                            .foregroundColor(GraySomberColor)

                        VStack (alignment: .leading){
                            detailTitle2(title: "Pseudo utilisateur")
                            RatingView(rating: $star)
                        }
                        .padding(.leading)
                    }
                    .padding([.leading, .top])
                    Text("Recette simple et efficace.\nEn deux temps, trois mouvements j'ai mangé. ")
                        .padding()
                }
            }
            .padding(.vertical, 10)

            ZStack{
                detailOpinionRectangle(cornerRadius: 10.0)
                VStack (alignment: .leading){
                    HStack{
                        Image("Evelyne Depardieu")
                            .resizable()
                            .frame(maxWidth: frame, maxHeight: frame)
                            .clipShape(Circle())
                            .foregroundColor(GraySomberColor)

                        VStack (alignment: .leading){
                            detailTitle2(title: "Pseudo utilisateur")
                            RatingView(rating: $star)
                        }
                        .padding(.leading)
                    }
                    .padding([.leading, .top])
                    Text("👏 Bravo pour cette proposition simple et claire. Petit tips : Ajouter de la ciboulette si vous en avez ✅")
                        .padding()
                }
            }
        }
        .padding(.bottom, 80)
    }
}

struct detailRecipe: View {
    var item : Recipe
    @EnvironmentObject var recipeVM: Recipes
    @State private var sizeIngredients : Double = 100
    @State private var sizeSteps : Double = 80
    @State private var sizeOtherRecipes : Double = 100
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                detailRecipeVideo(title: "\(item.recipeImage)", videoID : "\(item.recipeVideo)",frameHeight: 300,Proposee: "Utilisateur2")
                ScrollView(showsIndicators: false){
                    VStack (alignment: .leading) {
                        detailTitle(recipeCategory: item.recipeCategory, title: item.recipeName)
                            .padding(.vertical, 5)
                        detailRecipeClock(cuisson: item.cookingTime, preparation: item.preparationTime)
                            .padding(.vertical, 5)
                        detailRecipeIngredients(Ingredients : item.recipeIngredientsArray,size: $sizeIngredients)
                        detailSteps(steps : item.recipeDescriptionsArray, size: $sizeSteps)
                        detailOtherRecipes(recipeVM : recipeVM, size: $sizeOtherRecipes)
                        detailTitle2(title: "Les avis")
                        detailOpinion()
                    }
                }
                .padding()
                .padding(.bottom, 20)
                .frame(height : 600)
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct detailRecipe_Previews: PreviewProvider {
    static var previews: some View {
        detailRecipe(item: Recipes().recipesArray[0])
            .environmentObject(Recipes())
    }
}
