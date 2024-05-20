//
//  AppStore.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/20/24.
//

// 모든 상태를 갖고 있는 파일
import Foundation
//리듀서랑 비슷한 형태
typealias AppStore = Store<AppState, AppAction>

// OvservableObject 앱 상태를 가지고 있는 옵저블 오버젝트 스토어

// 상속을 받지 못하는 클래스 final class
final class Store<State, Action>: ObservableObject{
    // 옵저블 오버젝트이기 때문에 바인딩 가능: 값이 변경되면 알 수 있게끔...
    
    //콤바인에서 사용하는 published, 프로퍼티가 스토어가 가지고 있는 무엇인가가 변경이 되었을 때 받을 수 있도록...
    //외부에서 값이 변경되지 않도록 private(set) (스토어 내부에선 값 변경 가능)
    
    //외부에서 읽을 수만 있도록 private(set)설정
    @Published private(set) var state: State
    
    
    //리듀서(클로서)를 갖고 있어야 함
    private let reducer: Reducer<State, Action>
    
    
    //스토어에 대한 생성자 생성
    //리듀서가 클로저 형태이므로 이스케이핑 해줘야 함
    
    //제네릭 형태의 State
    // 즉 Store가 가지고 있는 제네릭 State
    //생성자 메소드
    //escaping으로 빠져나가기 위해 @escaping 추가
    init(state: State, reducer: @escaping Reducer<State, Action>) {
        self.state = state
        self.reducer = reducer
    }
    
    //디스패치를 통해 액션 행하기
    func dispatch(action: Action){
        // inout 매개변수를 넣을 때는 &표시
        //리듀서 클로저를 실행해서 액션 처리(필터링)
        reducer(&self.state, action)
    }
    
}
