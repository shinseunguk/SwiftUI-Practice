//
//  ContentView8.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/9/24.
//  https://randomuser.me => 랜덤 유저

import SwiftUI

struct ContentView8: View {
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                }
                .padding(.horizontal, 10)
                
                Text("할 일 목록")
                    .fontWeight(.black)
                    .font(.system(size: 40))
                    .padding(.leading, 10)
                
                ScrollView {
                    VStack(spacing: 10){
                        ProjectCardView8()
                        ProjectBasicView8(
                            backgroundColor: .purple,
                            icon: "flame.fill",
                            title: "유튭 라이브 버닝",
                            subTitle: "8 PM - 10 PM"
                        )
                        
                        ProjectBasicView8(
                            backgroundColor: .orange,
                            icon: "flame.fill",
                            title: "영상 다시보기",
                            subTitle: "8 AM - 9 AM"
                        )
                        
                        ProjectBasicView8(
                            backgroundColor: .green,
                            icon: "cart.fill",
                            title: "마트 장보기",
                            subTitle: "10 AM - 11 AM"
                        )
                        
                        ProjectBasicView8(
                            backgroundColor: .blue,
                            icon: "gamecontroller.fill",
                            title: "히오스 한판하기",
                            subTitle: "2 PM - 3 PM"
                        )
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                }
            }
            
            Circle()
                .overlay (
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                )
                .foregroundColor(.yellow)
                .frame(width: 60, height: 60)
                .padding(.trailing, 10)
                .shadow(radius: 20)
        }
    }
}

#Preview {
    ContentView8()
}
