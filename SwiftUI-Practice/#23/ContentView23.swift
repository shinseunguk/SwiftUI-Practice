//
//  ContentView23.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/9/24.
//

import SwiftUI

struct Todo: Hashable {
    var backgroundColor: Color
    var icon: String
    var title: String
    var subTitle: String
    
    // Hashable 프로토콜 준수를 위한 hash(into:) 메서드 구현
    func hash(into hasher: inout Hasher) {
        hasher.combine(backgroundColor)
        hasher.combine(title)
        hasher.combine(subTitle)
    }
    
    // Equatable 프로토콜 준수를 위한 == 연산자 구현
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.backgroundColor == rhs.backgroundColor &&
        lhs.title == rhs.title &&
        lhs.subTitle == rhs.subTitle
    }
}

struct ContentView23: View {
    
    var listArray = [Todo]()
    
    init() {
        for i in 0...100 {
            let todo = Todo(
                backgroundColor: .purple,
                icon: "book.fill",
                title: "책읽기 \(i)",
                subTitle: "8 PM - 10 PM"
            )
            
            self.listArray.append(todo)
        }
    }
    
    @State private var index: Int = 0
    
    var body: some View {
        VStack {
            HStack (spacing: 50){
                Spacer()
                Picker("", selection: $index) {
                    Image(systemName: "list.bullet").tag(0)
                    Image(systemName: "square.grid.2x2.fill").tag(1)
                    Image(systemName: "square.grid.3x3.fill").tag(2)
                }
                .pickerStyle(.segmented)
                Spacer()
            }
            
            switch index {
            case 0:
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 100))
                    ], spacing: 10){
                        ForEach(listArray, id: \.self) { todo in
                            ProjectBasicView8(
                                backgroundColor: todo.backgroundColor,
                                icon: todo.icon,
                                title: todo.title,
                                subTitle: todo.subTitle
                            )
                            .listRowSeparator(.hidden)
                        }
                    }
                    .padding(.horizontal, 10)
                }
            case 1:
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 100)), // 최소 너비 100
                        GridItem(.flexible(minimum: 100)) // 최소 너비 100
                    ], spacing: 10){
                        ForEach(listArray, id: \.self) { todo in
                            ZStack {
                                Rectangle()
                                    .aspectRatio(1, contentMode: .fit) // 가로 세로 비율을 1:1로 설정
                                    .foregroundColor(.blue)
                                    .cornerRadius(30)
                                VStack {
                                    Circle()
                                        .frame(width: 100, height: 100)
                                        .foregroundColor(.white)
                                    Text(todo.title)
                                        .foregroundColor(.white)
                                    Text(todo.subTitle)
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                }
            case 2:
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(minimum: 100)), // 최소 너비 100
                        GridItem(.flexible(minimum: 100)), // 최소 너비 100
                        GridItem(.flexible(minimum: 100)) // 최소 너비 100
                    ], spacing: 10){
                        ForEach(listArray, id: \.self) { todo in
                            ZStack {
                                Rectangle()
                                    .aspectRatio(1, contentMode: .fit) // 가로 세로 비율을 1:1로 설정
                                    .foregroundColor(.blue)
                                    .cornerRadius(30)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                }
            default:
                Text("default")
            }
        }
    }
}

struct ContentView23_Previews: PreviewProvider {
    static var previews: some View {
        ContentView23()
    }
}
