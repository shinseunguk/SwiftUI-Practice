//
//  DiceView24.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/20/24.
//

import Foundation

import SwiftUI

struct DiceView24: View {
    @EnvironmentObject var store: AppStore
    
    func rollTheDice() {
        self.store.dispatch(action: .rollTheDice)
    }
    
    var body: some View {
        VStack {
            Text(self.store.state.currentDice)
                .font(.system(size: 300, weight: .bold, design: .monospaced))
                .foregroundColor(.purple)
            
            Button {
                print("랜덤 주사위 던지기")
                rollTheDice()
            } label: {
                Text("랜덤 주사위 던지기")
            }
            .buttonStyle(TapButtonStyle(color: .orange))

        }
    }
}
