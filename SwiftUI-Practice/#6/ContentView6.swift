//
//  ContentView6.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI

struct ContentView6: View {
    var body: some View {
        VStack {
            CircleImageView6()
            
            HStack {
                NavigationLink(destination: MyWebview4(urlToLoad: "https://www.naver.com")
                    .edgesIgnoringSafeArea(.all)){
                    Text("구독")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(20)
                }
                
                NavigationLink(destination: MyWebview4(urlToLoad: "https://www.google.com")
                    .edgesIgnoringSafeArea(.all)){
                    Text("오픈카톡방")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(20)
                }

            } // HStack
            .padding(50)
        }
        .padding()
    }
}

#Preview {
    ContentView6()
}

