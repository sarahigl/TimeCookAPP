//
//  RecipeVideoPlayer.swift
//  RatatouillePrototype
//
//  Created by Apprenant 17 on 28/03/2023.
//

import SwiftUI
import WebKit

struct RecipeVideoPlayer : UIViewRepresentable{
    let videoID : String
    
    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
            configuration.allowsInlineMediaPlayback = true
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
//        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string : "https://www.youtube.com/embed/\(videoID)") else { return }
                uiView.scrollView.isScrollEnabled = true
                uiView.load(URLRequest(url: youtubeURL))
    }
}

