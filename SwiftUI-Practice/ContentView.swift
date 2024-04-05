//
//  ContentView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI

enum Constants {
    static let section1 = ["SwiftUI 기초(default 화면)"]
    static let section2 = ["WebView 기초"]
    static let section3 = ["Text 기초 및 속성"]
    static let section4 = ["Image 기초 및 속성"]
    static let section5 = ["VStackView", "HStackView", "ZStackView"]
}

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Practice#1~3")) {
                    ForEach(Constants.section1, id: \.self) { item in
                        NavigationLink(destination: ContentView1()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("WebView#4")) {
                    ForEach(Constants.section2, id: \.self) { item in
                        NavigationLink(destination: ContentView4()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Text#5")) {
                    ForEach(Constants.section3, id: \.self) { item in
                        NavigationLink(destination: ContentView5()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Image#6")) {
                    ForEach(Constants.section4, id: \.self) { item in
                        NavigationLink(destination: ContentView6()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Stack#7")) {
                    ForEach(Constants.section5, id: \.self) { item in
                        NavigationLink(destination: determineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
            }
            .navigationBarTitle("SwiftUI-Practice")
        }
    }
}

func determineDestination(item: String) -> some View {
        switch item {
        case "VStackView":
            return AnyView(VStackView7())
        case "HStackView":
            return AnyView(HStackView7())
        case "ZStackView":
            return AnyView(ZStackView7())
        default:
            return AnyView(EmptyView()) // Default case, do nothing
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


