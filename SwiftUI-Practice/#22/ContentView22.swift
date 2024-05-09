//
//  ContentView22.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/9/24.
//

import SwiftUI

enum MenuConstants {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    
    var title: String {
        switch self {
        case .one:
            return "강아지 🐶"
        case .two:
            return "고양이 🐈"
        case .three:
            return "쥐 🐭"
        case .four:
            return "새 파일 만들기"
        case .five:
            return "새 폴더 만들기"
        case .six:
            return "파일 모두 삭제"
        case .seven:
            return "오늘도 화이팅"
        case .eight:
            return "휴식"
        }
    }
    
    var icon: Image? {
        switch self {
        case .four:
            return Image(systemName: "doc")
        case .five:
            return Image(systemName: "folder")
        case .six:
            return Image(systemName: "trash")
        case .seven:
            return Image(systemName: "flame.fill")
        case .eight:
            return Image(systemName: "house.fill")
        default:
            return nil
        }
    }
}

struct ContentView22: View {
    
    @State private var titleState: MenuConstants = .one
    @State private var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 30) {
                HStack {
                    Text(titleState.title)
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                    
                    titleState.icon
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                }
                Text("우측 상단에 메뉴를 눌러주세요")
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Section {
                            Button(action: {
                                self.titleState = .one
                            }, label: {
                                Text(MenuConstants.one.title)
                            })
                            Button(action: {
                                self.titleState = .two
                            }, label: {
                                Text(MenuConstants.two.title)
                            })
                            Button(action: {
                                self.titleState = .three
                            }, label: {
                                Text(MenuConstants.three.title)
                            })
                        }
                        
                        Section {
                            Button(action: {
                                self.titleState = .four
                            }, label: {
                                HStack {
                                    Text(MenuConstants.four.title)
                                    Spacer()
                                    MenuConstants.four.icon
                                }
                            })
                            Button(action: {
                                self.titleState = .five
                            }, label: {
                                HStack {
                                    Text(MenuConstants.five.title)
                                    Spacer()
                                    MenuConstants.five.icon
                                }
                            })
                        }
                        
                        Section {
                            Button(action: {
                                self.titleState = .six
                            }, label: {
                                HStack {
                                    Text(MenuConstants.six.title)
                                    Spacer()
                                    MenuConstants.six.icon
                                }
                            })
                        }
                        
                        Section {
                            Button(action: {
                                self.titleState = .seven
                                self.shouldShowAlert = true
                            }, label: {
                                HStack {
                                    Text(MenuConstants.seven.title)
                                    Spacer()
                                    MenuConstants.seven.icon
                                }
                            })
                            Button(action: {
                                self.titleState = .eight
                                self.shouldShowAlert = true
                            }, label: {
                                HStack {
                                    Text(MenuConstants.eight.title)
                                    Spacer()
                                    MenuConstants.eight.icon
                                }
                            })
                        }
                    } label: {
                        Label("", systemImage: "square.grid.2x2.fill")
                    }
                }
            }
        }
        .alert(isPresented: $shouldShowAlert, content: {
            Alert(title: Text("알림"), message: Text(titleState.title))
        })
    }
}

#Preview {
    ContentView22()
}
