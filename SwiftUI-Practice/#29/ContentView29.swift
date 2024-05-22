//
//  ContentView29.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/22/24.
//

import SwiftUI

struct ContentView29: View {
    
    @State var alertBool = false
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack{
//            Color.yellow
            
            Theme.myBackgroundColor(forScheme: scheme)
                .ignoresSafeArea(.all)
            
            VStack {
                Spacer()
                
                Button(action: {
                    self.alertBool.toggle()
                }, label: {
                    Text("로그인")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                })
                
                Spacer()
                    .frame(height: 50)
            }
            .alert(isPresented: $alertBool, content: {
                Alert(title: Text("로그인 완료"))
            })
        }
    }
}

#Preview {
    ContentView29()
}

struct Theme {
    static func myBackgroundColor(forScheme scheme: ColorScheme) -> Color {
        let lightColor = Color.white
        let darkColor = Color.gray
        
        switch scheme {
        case .light:
            return lightColor
        case .dark:
            return darkColor
        @unknown default:
            return lightColor
        }
    }
}
