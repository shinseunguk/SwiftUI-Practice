//
//  RotationButtonStyle.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/7/24.
//

import SwiftUI

struct RotationButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(.pink)
            .cornerRadius(20)
            .rotationEffect(configuration.isPressed ? .degrees(90) : .degrees(0))
    }
}

#Preview {
    Button("asd") {
        
    }
    .buttonStyle(RotationButtonStyle())
}
