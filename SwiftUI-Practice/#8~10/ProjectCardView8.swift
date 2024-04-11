//
//  ProjectCardView8.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/9/24.
//

import SwiftUI

struct ProjectCardView8: View {
    
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("유튭 프로젝트")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("10 AM - 11 AM")
                .foregroundColor(.secondary)
                .padding(.bottom, 10)
            HStack {
                Image("11")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(.blue)
                    )
                Image("43")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Image("56")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Spacer()
                
                Button(action: {
                    print("확인 버튼 클릭")
                    
                    self.shouldShowAlert = true
                }) {
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $shouldShowAlert, content: {
                    Alert(title: Text("알림창입니다."))
                })
            }
        }
        .padding(30)
        .background(.yellow)
        .cornerRadius(20)
    }
}

#Preview {
    ProjectCardView8()
}
