//
//  Reducer.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/20/24.
//

import Foundation

typealias Reducer<State, Action> = (inout State, Action) -> Void

func appRecuder(_ state: inout AppState, _ action: AppAction) -> Void {
    
    switch action {
    case .rollTheDice:
        // 앱의 상태를 변경하기
        state.currentDice = ["⚀" ,"⚁", "⚂", "⚃", "⚄", "⚅"].randomElement() ?? "⚀"
    }
}
