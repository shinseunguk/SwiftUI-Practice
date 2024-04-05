//
//  ContentView5.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI

struct ContentView5: View {
    
    let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "YYYY년 M월 d일"
//        formatter.dateStyle = .full
        return formatter
    }()
    
    var today = Date()
    
    var trueOrFalse = false
    
    var number = 3
    
    var body: some View {
        VStack {
            Text("""
            What is Lorem Ipsum?
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to m
            """)
            .tracking(2)
            .font(.system(.body, design: .rounded))
            .fontWeight(.medium)
            .multilineTextAlignment(.leading)
            .lineSpacing(10)
            .truncationMode(.tail)
            .shadow(color: .red, radius: 2, x:5 ,y: 5)
            .padding(20)
//            .overlay(
//                RoundedRectangle(cornerRadius: 0)
//                    .stroke(Color.blue, lineWidth: 2)
//            )
            .background(Color.yellow)
            .cornerRadius(20)
            .padding()
            .background(.green)
            .cornerRadius(20)
            .padding()
            
            Text("gdgdgd")
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.black, lineWidth: 1)
                )
                .background(.gray)
                .foregroundColor(.white)
            
            Text("오늘의 날짜 : \(today, formatter: dateFormat)")
                .padding(.top, 20)
            
            Text("참 혹은 거짓 : \(trueOrFalse)")
            Text("숫자 : \(number)")
        }
    }
}

#Preview {
    ContentView5()
}
