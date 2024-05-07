//
//  ContentView17.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/7/24.
//

import SwiftUI

struct ContentView17: View {
    
    var body: some View {
        VStack (spacing: 30){
            Button("탭") {
                print("탭1")
            }
            .buttonStyle(TapButtonStyle(color: .blue))
            
            Button("롱 버튼") {
                print("탭2")
            }
            .buttonStyle(TapButtonStyle(color: .green))
            
            Button("축소 버튼") {
                print("탭3")
            }
            .buttonStyle(ReductionButtonStyle())
            
            Button("회전 버튼") {
            }
            .buttonStyle(RotationButtonStyle())
            
            Button("블러 버튼") {
                
            }
            .buttonStyle(BlurButtonStyle())
        }
    }
}

#Preview {
    ContentView17()
}
