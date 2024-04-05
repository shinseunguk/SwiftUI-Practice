//
//  ContentView4.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI

enum WebviewConstant {
    case naver
    case google
    case kakao
    
    var url: String {
        switch self {
        case .naver:
            return "https://www.naver.com"
        case .google:
            return "https://www.google.com"
        case .kakao:
            return "https://www.kakao.com"
        }
    }
    
    var title: String {
        switch self {
        case .naver:
            return "네이버"
        case .google:
            return "구글"
        case .kakao:
            return "카카오"
        }
    }
    
    var backgroundColor: Color {
        switch self {
            
        case .naver:
            return .green
        case .google:
            return .orange
        case .kakao:
            return .yellow
        }
    }
}

struct ContentView4: View {
    
    private var constant = WebviewConstant.self
    
    var body: some View {
        HStack {
            NavigationLink(destination:
                            MyWebview4(urlToLoad: constant.naver.url)
                .edgesIgnoringSafeArea(.all)
            ) {
                Text(constant.naver.title)
                    .fontWeight(.bold)
                    .padding(20)
                    .background(constant.naver.backgroundColor)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            
            NavigationLink(destination:
                            MyWebview4(urlToLoad: constant.google.url)
                .edgesIgnoringSafeArea(.all)
            ) {
                Text(constant.google.title)
                    .fontWeight(.bold)
                    .padding(20)
                    .background(constant.google.backgroundColor)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
            
            NavigationLink(destination:
                            MyWebview4(urlToLoad: constant.kakao.url)
                .edgesIgnoringSafeArea(.all)
            ) {
                Text(constant.kakao.title)
                    .fontWeight(.bold)
                    .padding(20)
                    .background(constant.kakao.backgroundColor)
                    .foregroundColor(Color.white)
                    .cornerRadius(20)
            }
        }
    }
}

#Preview {
    ContentView4()
}
