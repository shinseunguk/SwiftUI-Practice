//
//  ContentView13.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/15/24.
//

import SwiftUI

struct ContentView13: View {
    
    var title: String
    var bgColor: Color
    
    var body: some View {
        
        ZStack {
            bgColor
//                .edgesIgnoringSafeArea(.top)
            
            Text(title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .font(.system(size: 32))
        }
    }
}

#Preview {
    ContentView13(
        title: "1번",
        bgColor: .red
    )
}
