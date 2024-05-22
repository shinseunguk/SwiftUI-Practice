//
//  ProfileView25.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/22/24.
//

import SwiftUI

struct ProfileView25: View {
    
    var url: URL
    
    var body: some View {
        HStack {
            AsyncImage(url: url) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.yellow, lineWidth: 4) // 테두리 색상과 두께 설정
                    )
            } placeholder: {
                ProgressView()
            }
        }
    }
}

#Preview {
    ProfileView25(url: URL(string: "https://randomuser.me/api/portraits/thumb/men/89.jpg")!)
}
