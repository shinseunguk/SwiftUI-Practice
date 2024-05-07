//
//  ReductionButtonStyle.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/7/24.
//

import SwiftUI

struct ReductionButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(.purple)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
}

#Preview {
    Button("asd") {
        print("a")
    }
    .buttonStyle(ReductionButtonStyle())
}
