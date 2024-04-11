//
//  ContentView12.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/11/24.
//

import SwiftUI

struct ContentView12: View {
    @State private var isPressed1 = false
    @State private var isPressed2 = false
    @State private var isPressed3 = false
    
    var body: some View {
        
        GeometryReader { geometryReader in
            HStack(spacing: 0) {
                Button(action: {
                    isPressed1.toggle()
                }) {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: geometryReader.size.width / 3, height: isPressed1 ? geometryReader.size.height / 3 : geometryReader.size.height / 15)
                        .foregroundColor(.white)
                        .background(.red)
                }
                
                Button(action: {
                    isPressed2.toggle()
                }) {
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: geometryReader.size.width / 3, height: isPressed2 ? geometryReader.size.height / 3 : geometryReader.size.height / 15)
                        .foregroundColor(.white)
                        .background(.purple)
                }
                
                Button(action: {
                    isPressed3.toggle()
                }) {
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: geometryReader.size.width / 3, height: isPressed3 ? geometryReader.size.height / 3 : geometryReader.size.height / 15)
                        .foregroundColor(.white)
                        .background(.green)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.yellow)
    }
}

#Preview {
    ContentView12()
}
