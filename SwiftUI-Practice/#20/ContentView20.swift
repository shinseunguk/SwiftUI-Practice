//
//  ContentView20.swift
//  SwiftUI-Practice
//
//  Created by ukBook on 5/7/24.
//

import SwiftUI

struct ContentView20: View {
    @State var index: Int = 0
    
    var body: some View {
        VStack (spacing: 15){
            Circle()
                .foregroundColor(getColor(index))
                .frame(width: 50, height: 50)
            
            Text("세그먼트 value: \(index)")
            Text("선택된 색깔: \(getColorString(index))")
            
            HStack (spacing: 20){
                Spacer()
                Picker("What is your favorite color?", selection: $index) {
                    Text("레드").tag(0)
                    Text("그린").tag(1)
                    Text("블루").tag(2)
                }
                .pickerStyle(.segmented)
                Spacer()
            }
            
            Picker("asd", selection: $index) {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            }
            .pickerStyle(.wheel)
            .frame(width: 100)
            
        }
    }
}

func getColor(_ index: Int) -> Color {
    switch index {
    case 0:
        return .red
    case 1:
        return .green
    case 2:
        return .blue
    default:
        return .clear
    }
}

func getColorString(_ index: Int) -> String {
    switch index {
    case 0:
        return "레드"
    case 1:
        return "그린"
    case 2:
        return "블루"
    default:
        return ""
    }
}

#Preview {
    ContentView20()
}
