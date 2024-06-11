//
//  ContentView45.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import SwiftUI

enum ContentView45Constants {
    static var itemsColor: Color = Color(#colorLiteral(red: 0.21012339, green: 0, blue: 0.7719092965, alpha: 1))
}

struct ContentView45: View {
    
    @EnvironmentObject var viewModel: ContentViewModel45
    @State var menus: [ViewMenu] = []
    
    @State private var isLoading: Bool = true
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack(spacing: 0) {
                ScrollView {
                    if isLoading {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    } else {
                        ForEach(Array(menus.enumerated()), id: \.element.self) { index, menu in
                            MenuView(viewMenu: $menus[index], menuIndex: index)
                                .frame(height: 30)
                        }
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
                        
                        Text("\(viewModel.totalItemCount) Items")
                            .foregroundColor(ContentView45Constants.itemsColor)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                    Spacer()
                    HStack {
                        Spacer()
                        Text("₩\(viewModel.totalPrice)")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                .frame(width: geometryReader.size.width, height: 100)
                .background(.gray)
                
                NavigationLink {
                    ReceiptViewController()
                        .environmentObject(viewModel)
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
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isLoading = false
            }
            
            self.menus = menus
        })
        .navigationTitle("Fried Center")
    }
}

//#Preview {
//    ContentView45()
//}
