//
//  VStackView7.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI

struct VStackView7: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            
//            Spacer()

            Divider().opacity(0)
            
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
//                .padding(.bottom, 30)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
//                .padding(.vertical, 100)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
                .padding(.bottom, 30)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
//                .padding(.bottom, 30)
//                .edgesIgnoringSafeArea(.all)
            
//            Spacer()
//            Spacer()
//            Spacer()
        }
        .frame(width: 300)
        .background(.green)
    }
}

#Preview {
    VStackView7()
}
