//
//  TabView13.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/15/24.
//

import SwiftUI

struct TabView13: View {
    var body: some View {
        TabView {
            ContentView13(
                title: "1번",
                bgColor: .red
            )
                .tabItem {
                    Image(systemName: "airplane")
                    Text("1")
                }
                .tag(0)
            
            ContentView13(
                title: "2번",
                bgColor: .orange
            )
                .tabItem {
                    Image(systemName: "flame.fill")
                    Text("2")
                }
                .tag(1)
            
            ContentView13(
                title: "3번",
                bgColor: .yellow
            )
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("3")
                }
                .tag(2)
        }
    }
}

#Preview {
    TabView13()
}
