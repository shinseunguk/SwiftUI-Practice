//
//  ProjectBasicView8.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/9/24.
//

import SwiftUI

struct ProjectBasicView8: View {
    var backgroundColor: Color
    var icon: String
    var title: String
    var subTitle: String
    
    init(backgroundColor: Color, icon: String, title: String, subTitle: String) {
        self.backgroundColor = backgroundColor
        self.icon = icon
        self.title = title
        self.subTitle = subTitle
    }
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: icon)
                .resizable()
                .frame(width: 40, height: 30)
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(.white)
                Spacer().frame(height: 5)
                Text(subTitle)
                    .foregroundColor(.white)
            }
        }
        .padding(20)
        .background(backgroundColor)
        .cornerRadius(20)
    }
}

#Preview {
    ProjectBasicView8(
        backgroundColor: .purple,
        icon: "flame.fill",
        title: "유튭 라이브 버닝",
        subTitle: "8 PM - 10 PM"
    )
}
