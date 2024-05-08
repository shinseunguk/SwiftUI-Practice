//
//  ContentView20.swift
//  SwiftUI-Practice
//
//  Created by ukBook on 5/7/24.
//

import SwiftUI

enum SagmentConstants {
    case red
    case green
    case blue
    
    var index: Int {
        switch self {
        case .red:
            return 0
        case .green:
            return 1
        case .blue:
            return 2
        }
    }
    
    var color: Color {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        }
    }
    
    var colorString: String {
        switch self {
        case .red:
            return "레드"
        case .green:
            return "그린"
        case .blue:
            return "블루"
        }
    }
}

struct ContentView20: View {
    @State private var constants: SagmentConstants = .red
    
    var body: some View {
        VStack (spacing: 15){
            Circle()
                .foregroundColor(constants.color)
                .frame(width: 50, height: 50)
            
            Text("세그먼트 value: \(constants.index)")
            Text("선택된 색깔: \(constants.colorString)")
            
            HStack (spacing: 20){
                Spacer()
                Picker("What is your favorite color?", selection: $constants) {
                    Text(SagmentConstants.red.colorString).tag(SagmentConstants.red)
                    Text(SagmentConstants.green.colorString).tag(SagmentConstants.green)
                    Text(SagmentConstants.blue.colorString).tag(SagmentConstants.blue)
                }
                .pickerStyle(.segmented)
                Spacer()
            }
            
            Picker("asd", selection: $constants) {
                Text(SagmentConstants.red.colorString).tag(SagmentConstants.red)
                Text(SagmentConstants.green.colorString).tag(SagmentConstants.green)
                Text(SagmentConstants.blue.colorString).tag(SagmentConstants.blue)
            }
            .pickerStyle(.wheel)
            .frame(width: 100)
            
        }
    }
}

#Preview {
    ContentView20()
}
