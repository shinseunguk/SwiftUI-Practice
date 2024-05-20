//
//  ContentView24.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/14/24.
//

import SwiftUI

struct ContentView24: View {
    
    let store = AppStore(
        state: AppState.init(currentDice: "⚀"),
        reducer: appRecuder(_:_:)
    )
    
    var body: some View {
        DiceView24().environmentObject(store)
    }
}

#Preview {
    ContentView24()
}
