//
//  LoginView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/27/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: ContentViewModel44
    
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var shouldShowAlert : Bool = false
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section("로그인 정보") {
                    TextField("이메일", text: $email)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("비밀번호", text: $password)
                        .textContentType(.newPassword)
                }
                
                Section {
                    Button(action: {
                        viewModel.login(email: email, password: password)
                    }, label: {
                        Text("로그인 하기")
                    })
                }
            }.onReceive(viewModel.loginSuccess, perform: { _ in
                self.shouldShowAlert = true
            })
            .alert(isPresented: $shouldShowAlert, content: {
                Alert(
                    title: Text("로그인 완료"),
                    dismissButton: .default(Text("확인"), action: {
                        self.dismiss()
                    })
                )
            })
        }
        .navigationTitle("로그인 하기")
    }
}

#Preview {
    LoginView()
}
