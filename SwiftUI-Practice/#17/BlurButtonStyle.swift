//
//  BlurButtonStyle.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/7/24.
//

import SwiftUI

struct BlurButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(.black)
            .cornerRadius(20)
            .blur(radius: configuration.isPressed ? 20 : 0)
    }
}

#Preview {
    Button("asd") {
        
    }
    .buttonStyle(RotationButtonStyle())
}
