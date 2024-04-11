//
//  NavigationView11.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/11/24.
//

import SwiftUI

struct NavigationView11: View {
    var body: some View {
//        NavigationView {
            ScrollView() {
                VStack(spacing: 20) {
                    Image("43")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle()) // Clip the image into a circle shape
                        .overlay(
                            Circle().stroke(Color.yellow, lineWidth: 20)
                        )
                        .padding(.top, 20)
                    
                    Text("Title")
                        .fontWeight(.bold)
                        .font(.system(size: 42))
                    
                    Text("subTitle")
                    
                    HStack(spacing: 10) {
                        Button(action: {
                            print("구독")
                        }) {
                            Text("구독")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding()
                        }
                        .background(.red)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, alignment: .trailing) // 오른쪽 정렬
                        
                        Button(action: {
                            print("오픈카톡방")
                        }) {
                            Text("오픈카톡방")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding()
                        }
                        .background(.yellow)
                        .cornerRadius(15)
                        .frame(maxWidth: .infinity, alignment: .leading) // 왼쪽 정렬
                    }
                }
            }
            .navigationTitle("내 프로필")
            .navigationBarItems(
                trailing:
                    HStack {
                        Button(action: {
                            // 오른쪽 버튼 클릭 시 동작
                            print("Right Button Tapped")
                        }) {
                            NavigationLink(destination: Text("설정 화면")) {
                                Image(systemName: "gear")
                                    .foregroundColor(.black)
                            }
                        }
                    }
            )
//        }
    }
}

#Preview {
    NavigationView11()
}
