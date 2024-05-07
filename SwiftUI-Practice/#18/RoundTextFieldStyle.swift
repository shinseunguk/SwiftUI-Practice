//
//  RoundTextFieldStyle.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/7/24.
//

import SwiftUI

struct RoundTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .frame(width: 250, height: 40)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1) // 테두리 색상 및 두께 지정
            )
    }
}
