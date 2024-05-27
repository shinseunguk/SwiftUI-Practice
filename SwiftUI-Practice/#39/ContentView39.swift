//
//  ContentView39.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/27/24.
//

import SwiftUI

struct ContentView39: View {
    
    @State var selectedIndex: Int = 0
    
    @Namespace var topID
    @Namespace var bottomID
    
    var selectedBG: (Int, Int) -> Color = { currentItemIndex, selectedItemIndex in
        if currentItemIndex == selectedItemIndex {
            return Color.green
        } else {
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    Button("Scroll to Bottom") {
                        withAnimation {
                            proxy.scrollTo(bottomID)
                        }
                    }
                    .id(topID)
                    
                    ForEach(0..<100) { index in
                        Text("\(index)!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                            .padding(50)
                            .background(selectedBG(index, selectedIndex))
                            .id(index)
                    }
                    .onChange(of: selectedIndex, perform: { changeIndex in
                        print("changeIndex: \(changeIndex)")
                        withAnimation {
                            proxy.scrollTo(changeIndex, anchor: .center)
                        }
                    })
                    
                    Button("Scroll to Top") {
                        withAnimation {
                            proxy.scrollTo(topID)
                        }
                    }
                    .id(bottomID)
                }
            }
            HStack(spacing: 10) {
                Button(action: {
                    selectedIndex = 6
                }, label: {
                    Text("인덱스 : 6").padding()
                })
                
                Button(action: {
                    selectedIndex = 10
                }, label: {
                    Text("인덱스 : 10").padding()
                })
                
                Button(action: {
                    selectedIndex = 90
                }, label: {
                    Text("인덱스 : 90").padding()
                })
            }
        }
    }
}

#Preview {
    ContentView39()
}
