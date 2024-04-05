//
//  CircleImageView6.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI

struct CircleImageView6: View {
    var body: some View {
//        Image(systemName: "flame.fill")
//            .font(.system(size: 200))
//            .foregroundColor(.blue)
//            .shadow(color: .gray, radius: 2, x: 10, y: 10)
        
        Image("myImage")
            .resizable()
            .scaledToFill()
            .frame(width: 300, height: 300)
            .clipShape(Circle())
            .shadow(color: .gray, radius: 10, x: 5, y: 10)
            .overlay(
                Circle()
                    .foregroundColor(.black)
                    .opacity(0.5)
            )
            .overlay (
                Circle().stroke(Color.red, lineWidth: 10)
                    .padding(20)
            )
            .overlay (
                Circle().stroke(Color.yellow, lineWidth: 10)
                    .padding(10)
            )
            .overlay (
                Circle().stroke(Color.blue, lineWidth: 10)
            )
            .overlay (
                Text("하이")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 50))
            )
    }
}

#Preview {
    CircleImageView6()
}

