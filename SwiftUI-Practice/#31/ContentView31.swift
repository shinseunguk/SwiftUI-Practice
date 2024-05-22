//
//  ContentView31.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/22/24.
//

import SwiftUI

struct ContentView31: View {
    
    @EnvironmentObject var viewModel: ContentViewModel31
    
    @State var count = 0
    
    @State var appTitle: String = ""
    
    var body: some View {
        TabView {
            
            VStack {
                Text(appTitle)
                Text("1 count: \(count)")
                    .padding()
                Button {
                    count += 1
                    viewModel.appTitle = "일상 \(count)일차"
                } label: {
                    Text("count ⬆️")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10.0)
                }
            }
            .tabItem { Label("One", systemImage: "pencil.circle") }
                
            
            Text("2")
                .tabItem { Label("two", systemImage: "folder.fill") }
            
            Text("3")
                .tabItem { Label("three", systemImage: "paperplane.fill") }
        }
        .onReceive(viewModel.$appTitle, perform: { appTitle in
            self.appTitle = appTitle
        })
    }
}

//#Preview {
//    ContentView31()
//}
