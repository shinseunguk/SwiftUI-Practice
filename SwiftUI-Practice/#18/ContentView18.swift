//
//  ContentView18.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/7/24.
//

import SwiftUI

struct ContentView18: View {
    
    @State var idValue: String = ""
    @State var pwValue: String = ""
    
    var body: some View {
        VStack (spacing: 10){
            HStack {
                TextField("ID", text: $idValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    self.idValue = ""
                }, label: {
                    
                    if idValue.count > 0 {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                    }
                })
            }
            
            HStack {
                TextField("PW", text: $pwValue)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    self.pwValue = ""
                }, label: {
                    if pwValue.count > 0 {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                    }
                })
            }
            
            Text("비밀번호: \(pwValue)")
                .padding(.top, 30)
        }
        .padding(.horizontal, 50)
    }
}


#Preview {
    ContentView18()
}
