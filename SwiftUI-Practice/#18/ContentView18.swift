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
        VStack (alignment: .center){
            HStack {
                TextField("ID", text: $idValue)
                    .textFieldStyle(RoundTextFieldStyle())
                
                Button(action: {
                    self.idValue = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 20, height: 20)
                        .opacity(idValue.count != 0 ? 1.0 : 0.0)
                })
            }
            
            HStack {
                TextField("PW", text: $pwValue)
                    .textFieldStyle(RoundTextFieldStyle())
                
                Button(action: {
                    self.pwValue = ""
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .foregroundColor(.gray)
                        .frame(width: 20, height: 20)
                        .opacity(pwValue.count != 0 ? 1.0 : 0.0)
                })
            }
            
            Text("비밀번호: \(pwValue)")
                .padding(.top, 30)
        }
    }
}


#Preview {
    ContentView18()
}
