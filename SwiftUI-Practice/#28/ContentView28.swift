//
//  ContentView28.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/22/24.
//

import SwiftUI

struct ContentView28: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("ContentView28")
                .modifier(RoundedText()) // 결과 값 동일
            Text("ContentView28")
                .myRoundedTextStyle() // 결과 값 동일
            Image(systemName: "pencil")
                .myRoundedTextStyle()
            Rectangle()
                .frame(width: 100, height: 100)
                .myRoundedTextStyle()
        }
    }
}

// View를 꾸며주는 modifer
struct RoundedText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .padding()
            .background(.yellow)
            .cornerRadius(20)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .stroke(lineWidth: 10)
                    .foregroundColor(.blue)
            )
    }
}

extension View {
    func myRoundedTextStyle() -> some View {
        modifier(RoundedText())
    }
}

#Preview {
    ContentView28()
}
