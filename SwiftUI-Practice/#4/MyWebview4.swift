//
//  MyWebview4.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI
import WebKit

struct MyWebview4: UIViewRepresentable {
    
    var urlToLoad: String
    
    // UI View 만들기
    func makeUIView(context: Context) -> some WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        let webview = WKWebView()
        webview.load(URLRequest(url: url))
        
        return webview
    }
    // 업데이트 UI View
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

#Preview {
    MyWebview4(urlToLoad: "https://www.naver.com")
}

