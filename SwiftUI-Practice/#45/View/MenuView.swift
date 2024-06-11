//
//  MenuView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var viewMenu: ViewMenu
    @EnvironmentObject var viewModel: ContentViewModel45
    
    var menuIndex: Int
    
    var body: some View {
        HStack(spacing: 20) {
            Button {
                print("+ \(viewModel.menus[menuIndex].name)")
                viewModel.menus[menuIndex].count += 1
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.gray)
                    .padding(.leading, 20)
            }

            Button {
                print("- \(viewModel.menus[menuIndex].name)")
                viewModel.menus[menuIndex].count != 0 ? viewModel.menus[menuIndex].count -= 1 : nil
            } label: {
                Image(systemName: "minus")
                    .foregroundColor(.gray)
            }
            
            Text(viewModel.menus[menuIndex].name)
                .fontWeight(.bold)
                .padding(.leading, 30)
            Text("(\(viewModel.menus[menuIndex].count))")
                .foregroundColor(.blue)
                .padding(.leading, -10)
            
            Spacer()
            Text("\(viewModel.menus[menuIndex].price)")
                .foregroundColor(.gray)
                .padding(.trailing, 20)
        }
    }
}
