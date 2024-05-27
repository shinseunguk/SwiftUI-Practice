//
//  ContentView40.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/27/24.
//

import SwiftUI

struct DataItem: Hashable {
    var id: UUID = UUID()
    var title: String
    var color: Color
    
    init(title: String, color: Color) {
        self.id = UUID()
        self.title = title
        self.color = color
    }
}

struct ContentView40: View {
    
    @State var dataList = [
        DataItem(title: "1번", color: .yellow),
        DataItem(title: "2번", color: .green),
        DataItem(title: "3번", color: .blue)
    ]
    
    @State var draggedItem: DataItem?
    
    @State var isEditModeOn: Bool = false
    
    var body: some View {
        Toggle("수정모드:", isOn: $isEditModeOn)
        LazyVStack {
            ForEach(dataList, id:\.self) { dataItem in
                Text(dataItem.title)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .background(dataItem.color)
                    .onDrag {
                        self.draggedItem = dataItem
                        return NSItemProvider(item: nil, typeIdentifier: dataItem.title)
                    }
                    .onDrop(of: [dataItem.title], delegate: MyDropDelegate(
                    currentItem: dataItem,
                    dataList: $dataList,
                    draggedItem: $draggedItem,
                    isEditModeON: $isEditModeOn
                    ))
            }
        }
        .onChange(of: isEditModeOn) { newValue in
            print("변경된 수정모드: \(isEditModeOn)")
        }
    }
}

struct MyDropDelegate: DropDelegate {
    
    let currentItem: DataItem
    @Binding var dataList: [DataItem]
    @Binding var draggedItem: DataItem?
    
    @Binding var isEditModeON: Bool
     
    // 드랍 시작
    func dropEntered(info: DropInfo) {
        print("MyDripDelegate - dropEntered() called")
        
        if !isEditModeON {return}
        
        guard let draggedItem = self.draggedItem else {return}
        
        // 드래깅된 아이템이랑 현재 내 아이템이랑 다르면
        if draggedItem != currentItem {
            let from = dataList.firstIndex(of: draggedItem)!
            let to = dataList.firstIndex(of: currentItem)!
            withAnimation {
                self.dataList.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
            }
        }
    }
    
    // 드랍에서 벗어났을때
    func dropExited(info: DropInfo) {
        print("MyDripDelegate - dropExited() called")
    }
    
    // 드랍 변경
    func dropUpdated(info: DropInfo) -> DropProposal? {
//        print("MyDripDelegate - dropUpdated() called")
        return nil
    }
    
    // 드랍 유효 여부
    func validateDrop(info: DropInfo) -> Bool {
        print("MyDripDelegate - validateDrop() called")
        return true
    }
    
    // 드랍 처리
    func performDrop(info: DropInfo) -> Bool {
        print("MyDripDelegate - performDrop() called")
        return true
    }
}

#Preview {
    ContentView40()
}
