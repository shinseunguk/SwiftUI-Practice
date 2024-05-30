//
//  ContentView44.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/27/24.
//

import SwiftUI

enum ContentView44Constants {
    case login, register
    case profile, userList
    
    var title: String {
        switch self {
        case .login: return "로그인 하러가기"
        case .register: return "회원가입 하러가기"
            
        case .profile: return "내 프로필 보러가기"
        case .userList: return "사용자 목록 보러가기"
        }
    }
    
    var bgColor: Color {
        switch self {
        case .login: return .blue
        case .register: return .black
            
        case .profile: return .purple
        case .userList: return .green
        }
    }
}

struct ContentView44: View {
    
    @EnvironmentObject var viewModel: ContentViewModel44
    
    let constants = ContentView44Constants.self
    
    var body: some View {
        
        NavigationView {
            VStack {
                Image(systemName: "lock.shield.fill")
                    .resizable()
                    .frame(width: 180, height: 200)
                Spacer()
                    .frame(height: 100)
                
                NavigationLink(destination: LoginView()) {
                    Text(constants.login.title)
                }
                .buttonStyle(indexButtonStyle(bgColor: constants.login.bgColor))
                .padding(.horizontal)
                
                NavigationLink(destination: RegisterView()) {
                    Text(constants.register.title)
                }
                .buttonStyle(indexButtonStyle(bgColor: constants.register.bgColor))
                .padding(.horizontal)
                
                Spacer()
                    .frame(height: 40)
                
                NavigationLink(destination: ProfileView()) {
                    Text(constants.profile.title)
                }
                .buttonStyle(indexButtonStyle(bgColor: constants.profile.bgColor))
                .padding(.horizontal)
                
                NavigationLink(destination: UserListView()) {
                    Text(constants.userList.title)
                }
                .buttonStyle(indexButtonStyle(bgColor: constants.userList.bgColor))
                .padding(.horizontal)
            }
        }
    }
}

struct indexButtonStyle: ButtonStyle {
    
    var bgColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18))
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(20)
            .background(bgColor)
            .cornerRadius(10)
    }
}

#Preview {
    ContentView44()
}
