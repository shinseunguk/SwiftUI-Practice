//
//  ContentView37.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/23/24.
//

import SwiftUI

struct ContentView37: View {
    
    @State var singleTapped = false
    @State var doubleTapped = false
    @State var trippleTapped = false
    
    var singleTap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in
                print("singleTap")
                singleTapped.toggle()
            }
    }
    
    var dobuleTap: some Gesture {
        TapGesture(count: 2)
            .onEnded { _ in
                print("doubleeTap")
                doubleTapped.toggle()
            }
    }
    
    var trippleTap: some Gesture {
        TapGesture(count: 3)
            .onEnded { _ in
                print("trippleTap")
                trippleTapped.toggle()
            }
    }
    
    var body: some View {
        VStack {
            Circle()
                .fill(singleTapped ? .blue : .gray)
                .modifier(CircleText(color: .blue, title: "싱글탭"))
                .gesture(singleTap)
            Circle()
                .fill(doubleTapped ? .green : .gray)
                .modifier(CircleText(color: .green, title: "더블탭"))
                .gesture(dobuleTap)
            Circle()
                .fill(trippleTapped ? .purple : .gray)
                .modifier(CircleText(color: .purple, title: "트리플탭"))
                .gesture(trippleTap)
        }
    }
}

struct CircleText: ViewModifier {
    
    var color: Color
    var title: String
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .frame(width: 150, height: 150, alignment: .center)
            .overlay(
                Text(title)
                    .font(.system(size: 35))
                    .fontWeight(.light)
                    .foregroundColor(.white)
            )
    }
}

#Preview {
    ContentView37()
}
