//
//  ListView10.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/11/24.
//

import SwiftUI

struct ListView10: View {
    
    
    init() {
        if #available(iOS 14.0, *) {
            
        } else {
            UITableView.appearance().tableFooterView = UIView()
        }
        
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List {
            
            Section(
                header: Text("오늘 할 일")
                    .font(.headline)
                    .foregroundColor(Color.black)
            ){
                ForEach(1...3, id: \.self) {
                    ProjectBasicView8(
                        backgroundColor: .purple,
                        icon: "flame.fill",
                        title: "유튭 라이브 버닝 \($0)",
                        subTitle: "8 PM - 10 PM"
                    )
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .listRowSeparator(.hidden) // Hide dividers for this section
            
            Section(
                header: Text("내일 할 일")
                    .font(.headline)
                    .foregroundColor(Color.black)
            ){
                ForEach(1...20, id: \.self) {
                    ProjectBasicView8(
                        backgroundColor: .purple,
                        icon: "flame.fill",
                        title: "유튭 라이브 버닝 \($0)",
                        subTitle: "8 PM - 10 PM"
                    )
                }
            }
            .listRowInsets(EdgeInsets.init(top: 10, leading: 10, bottom: 10, trailing: 10))
            .listRowSeparator(.hidden) // Hide dividers for this section
            .listRowBackground(Color.yellow)
        }
        .listStyle(.automatic)
        .navigationTitle("내 목록")
    }
}

#Preview {
    ListView10()
}
