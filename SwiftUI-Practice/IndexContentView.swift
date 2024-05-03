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
    static let section6 = ["Layout 기초"]
    static let section7 = ["Geometry-Reader 기초1", "Geometry-Reader 기초2"]
    static let section8 = ["Tabbar 기초1", "Tabbar 기초2"]
    static let section9 = ["QR 코드 리더"]
}

struct IndexContentView: View {
    
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
                        NavigationLink(destination: chapter7DetermineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Layout#8~11")) {
                    ForEach(Constants.section6, id: \.self) { item in
                        NavigationLink(destination: ContentView8()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("GeometryReader#12")) {
                    ForEach(Constants.section7, id: \.self) { item in
                        NavigationLink(destination: chapter12DetermineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Tabbar#13~14")) {
                    ForEach(Constants.section8, id: \.self) { item in
                        NavigationLink(destination: chapter13DetermineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Tabbar#15")) {
                    ForEach(Constants.section9, id: \.self) { item in
                        NavigationLink(destination: ContentView15()) {
                            Text(item)
                        }
                    }
                }
            }
            .navigationBarTitle("SwiftUI-Practice")
        }
    }
}

func chapter7DetermineDestination(item: String) -> some View {
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


func chapter12DetermineDestination(item: String) -> some View {
    switch item {
    case "Geometry-Reader 기초1":
        return AnyView(ContentView12())
    case "Geometry-Reader 기초2":
        return AnyView(ContentView12_2())
    default:
        return AnyView(EmptyView()) // Default case, do nothing
    }
}

func chapter13DetermineDestination(item: String) -> some View {
    switch item {
    case "Tabbar 기초1":
        return AnyView(TabView13())
    case "Tabbar 기초2":
        return AnyView(TabView14(tabIndex: .home))
    default:
        return AnyView(EmptyView()) // Default case, do nothing
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IndexContentView()
    }
}


