//
//  RegisterView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/27/24.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var viewModel: ContentViewModel44
    
    @Environment(\.dismiss) var dismiss
    
    @State fileprivate var shouldShowAlert : Bool = false
    
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("이름")) {
                    TextField("이름", text: $name)
                        .textContentType(.name)
                }
                
                Section(header: Text("이메일")) {
                    TextField("이메일", text: $email)
                        .textContentType(.emailAddress)
                        .autocapitalization(.none)
                }
                
                Section(header: Text("로그인 정보")) {
                    SecureField("비밀번호", text: $password)
                        .textContentType(.newPassword)
                    SecureField("비밀번호 확인", text: $password)
                        .textContentType(.newPassword)
                }
                
                Section {
                    Button {
                        viewModel.register(name: name, email: email, password: password)
                    } label: {
                        Text("회원가입 하기")
                    }

                }
            }.onReceive(viewModel.registrationSuccess, perform: { _ in
                self.shouldShowAlert = true
            })
            .alert(isPresented: $shouldShowAlert, content: {
                Alert(
                    title: Text("회원가입 완료"),
                    dismissButton: .default(Text("확인"), action: {
                        self.dismiss()
                    })
                )
            })
        }
        .navigationTitle("회원가입")
    }
}

#Preview {
    RegisterView()
}
