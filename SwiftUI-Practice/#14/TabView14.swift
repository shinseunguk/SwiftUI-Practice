//
//  TabView14.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/15/24.
//

import SwiftUI

enum TabIndex {
    case home, cart, profile
    
    var title : String {
        switch self {
        case .home:
            return "홈"
        case .cart:
            return "장바구니"
        case .profile:
            return "프로필"
        }
    }
    
    var color : Color {
        switch self {
        case .home:
            return .red
        case .cart:
            return .purple
        case .profile:
            return .blue
        }
    }
    
    var index : CGFloat {
        switch self {
        case .home:
            return -1
        case .cart:
            return 0
        case .profile:
            return 1
        }
    }
}

struct TabView14: View {
    
    @State var tabIndex: TabIndex
    
    @State var largerScale : CGFloat = 1.4
    
    var body: some View {
//        Text("TabView14")
        GeometryReader { geometry in
            ZStack (alignment: .bottom){
                ContentView13(title: tabIndex.title, bgColor: tabIndex.color)
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 90, height: 90)
                    .offset(x: geometry.size.width / 3 * tabIndex.index, y: 15)
                
                HStack (spacing: 0){
                    Button {
                        print("홈 버튼 클릭")
                        withAnimation {
                            self.tabIndex = .home
                        }
                    } label: {
                        Image(systemName: "house.fill")
                            .font(.system(size: 25))
                            .scaleEffect(tabIndex == .home ? largerScale : 1.0)
                            .foregroundColor(tabIndex == .home ? tabIndex.color : .gray)
                            .frame(width: geometry.size.width / 3, height: 50)
                            .offset(y: self.tabIndex == .home ? -10 : 0)
                    }
                    .background(.white)

                    Button {
                        print("장바구니 버튼 클릭")
                        withAnimation {
                            self.tabIndex = .cart
                        }
                    } label: {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 25))
                            .scaleEffect(tabIndex == .cart ? largerScale : 1.0)
                            .foregroundColor(tabIndex == .cart ? tabIndex.color : .gray)
                            .frame(width: geometry.size.width / 3, height: 50)
                            .offset(y: self.tabIndex == .cart ? -10 : 0)
                    }
                    .background(.white)
                    
                    Button {
                        print("프로필 버튼 클릭")
                        withAnimation {
                            self.tabIndex = .profile
                        }
                    } label: {
                        Image(systemName: "person.crop.circle")
                            .font(.system(size: 25))
                            .scaleEffect(tabIndex == .profile ? largerScale : 1.0)
                            .foregroundColor(tabIndex == .profile ? tabIndex.color : .gray)
                            .frame(width: geometry.size.width / 3, height: 50)
                            .offset(y: self.tabIndex == .profile ? -10 : 0)
                    }
                    .background(.white)
                }
            }
        }
    }
}

#Preview {
    TabView14(tabIndex: .home)
}
