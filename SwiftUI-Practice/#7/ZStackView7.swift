//
//  ZStackView7.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI

struct ZStackView7: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
                .zIndex(3)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .zIndex(2)
            
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
                .zIndex(1)
        }
    }
}

#Preview {
    ZStackView7()
}
