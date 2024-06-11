//
//  MenuView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var viewMenu: ViewMenu
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                print("+ \(viewMenu.name)")
                viewMenu.count += 1
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
            }

            Button {
                print("- \(viewMenu.name)")
                viewMenu.count != 0 ? viewMenu.count -= 1 : nil
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(.gray)
            }
            
            Text(viewMenu.name)
                .fontWeight(.bold)
                .padding(.leading, 30)
            Text("(\(viewMenu.count))")
                .foregroundColor(.blue)
                .padding(.leading, -10)
            
            Spacer()
            Text("\(viewMenu.price)")
                .foregroundColor(.gray)
                .padding(.trailing, 20)
        }
    }
}
