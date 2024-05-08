//
//  ProfileView21.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/8/24.
//

import SwiftUI

struct ProfileView21: View {
    var body: some View {
        
        Button  {
        } label: {
            NavigationLink(destination: Text("ProfileView21")){
                ZStack {
                    Rectangle()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.blue)
                    
                    Text("프로필")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ProfileView21()
}
