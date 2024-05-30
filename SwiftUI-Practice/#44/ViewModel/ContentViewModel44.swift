//
//  ContentViewModel44.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/28/24.
//

import Foundation
import Combine
import Alamofire

final class ContentViewModel44: ObservableObject {
    
    //MARK: properties
    var subscription = Set<AnyCancellable>()
    
    @Published var loggedInUser: UserData? = nil
    
    @Published var users : [UserData] = []
    
    // 회원가입 완료 이벤트
    var registrationSuccess = PassthroughSubject<(), Never>()
    
    // 로그인 완료 이벤트
    var loginSuccess = PassthroughSubject<(), Never>()
    
    func register(name: String, email: String, password: String) {
        print("VM: reegister() called");
        AuthApiService.register(name: name, email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.registrationSuccess.send()
            }.store(in: &subscription)
    }
    
    func login(email: String, password: String) {
        print("VM login() called")
        AuthApiService.login(email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.loginSuccess.send()
            }.store(in: &subscription)
    }
    
    func fetchUserInfo() {
        UserApiService.fetchCurrentUserInfo()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.loginSuccess.send()
            }.store(in: &subscription)
    }
    
    func fetchUserList() {
        UserApiService.fetchUserList()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: [UserData]) in
                self.users = receivedUser
                self.loginSuccess.send()
            }.store(in: &subscription)
    }
}
