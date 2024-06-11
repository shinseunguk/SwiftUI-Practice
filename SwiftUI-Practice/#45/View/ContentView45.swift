//
//  ContentView45.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import SwiftUI

struct ContentView45: View {
    
    var itemsColor: Color = Color(#colorLiteral(red: 0.21012339, green: 0, blue: 0.7719092965, alpha: 1))
    
    @StateObject var viewModel = ContentViewModel45()
    
    @State var menus: [ViewMenu] = []
    
    var totalItemCount: Int {
        menus.reduce(0) { $0 + $1.count }
    }
    
    var totalPrice: Int {
        menus.reduce(0) { $0 + $1.price * $1.count }
    }
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack(spacing: 0) {
                ScrollView {
                    ForEach($menus, id: \.self) { menus in
                        MenuView(viewMenu: menus)
                            .frame(height: 30)
                    }
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                
                VStack {
                    Spacer()
                    HStack {
                        Text("Your Orders")
                        Button {
                            viewModel.menusCountClear()
                        } label: {
                            Text("clear")
                                .foregroundColor(.white)
                        }
                        Spacer()
                        
                        Text("\(totalItemCount) Items")
                            .foregroundColor(itemsColor)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    Spacer()
                    HStack {
                        Spacer()
                        Text("₩\(totalPrice)")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                .frame(width: geometryReader.size.width, height: 100)
                .background(.gray)
                
                NavigationLink {
                    ReceiptViewController(menus: $menus)
                } label: {
                    Text("ORDER")
                        .padding(20)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: geometryReader.size.width, height: 50)
                        .background(.black)
                }
            }
        }
        .onAppear(perform: {
            viewModel.fetchMenus()
        })
        .onReceive(viewModel.$menus, perform: { menus in
            self.menus = menus
        })
        .navigationTitle("Fried Center")
    }
}

#Preview {
    ContentView45()
}
