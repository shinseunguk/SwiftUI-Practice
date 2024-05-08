//
//  ListView21.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/8/24.
//

import SwiftUI

struct TodoItem: Identifiable, Hashable {
    var id: UUID
    var title: String
}

func prepareData() -> [TodoItem] {
    print(#function)
    
    var newList = [TodoItem]()
    
    for i in 0...20 {
        let newTodo = TodoItem(id: UUID(), title: "내 할일 \(i)")
        print(newTodo)
        newList.append(newTodo)
    }
    
    return newList
}

struct ListView21: View {
    
    @State var todoItems = [TodoItem]()
    
    // 옵셔널로 처리
    @State var activeUUID: UUID?
    
    init() {
        _todoItems = State(initialValue: prepareData())
    }
    
    var body: some View {
        List(todoItems){ todoItem in
            NavigationLink(
                destination: Text("\(todoItem.title)"),
                tag: todoItem.id,
                //activeUUID 값이 변경되면 해당하는 링크로 이동
                selection: $activeUUID,
                label: {
                    Text("\(todoItem.title )")
                })
        }
        .onOpenURL(perform: { url in
            if case .todoItem(let id) = url.detailPage{
                print("Over on ID: \(id)")
                activeUUID = id
            }
        })
    }
}

#Preview {
    ListView21()
}
