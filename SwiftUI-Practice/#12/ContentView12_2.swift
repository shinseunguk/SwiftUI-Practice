//
//  ContentView12_2.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/11/24.
//

import SwiftUI

struct ContentView12_2: View {
    @State private var isPressed1 = false
    @State private var isPressed2 = false
    @State private var isPressed3 = false
    
    var body: some View {
        
        GeometryReader { geometryReader in
            VStack(spacing: 0) {
                Button(action: {
                    isPressed1.toggle()
                }) {
                    Text("1")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: isPressed1 ? geometryReader.size.width / 3 : geometryReader.size.width / 8, height: geometryReader.size.height / 3)
                        .foregroundColor(.white)
                        .background(.red)
                }
                
                Button(action: {
                    isPressed2.toggle()
                }) {
                    Text("2")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: isPressed2 ? geometryReader.size.width / 3 : geometryReader.size.width / 8, height: geometryReader.size.height / 3)
                        .foregroundColor(.white)
                        .background(.purple)
                }
                
                Button(action: {
                    isPressed3.toggle()
                }) {
                    Text("3")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: isPressed3 ? geometryReader.size.width / 3 : geometryReader.size.width / 8, height: geometryReader.size.height / 3)
                        .foregroundColor(.white)
                        .background(.green)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.yellow)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView12_2()
}

