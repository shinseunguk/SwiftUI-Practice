//
//  AuthApiService.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation
import Alamofire
import Combine

enum AuthApiService {
    static func register(name: String, email: String, password: String) -> AnyPublisher<UserData, AFError> {
        print("AuthApiService - register() called")
        
        return ApiClient.shared.session
            .request(AuthRouter.register(name: name, email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map{ receivedValue in
                // 받은 토큰 정보 어딘가에 영구 저장
                // userdefaults, keychain
                UserDefaultsManager.shared.setTokens(accessToken: receivedValue.token.accessToken,
                                                     refreshToken: receivedValue.token.refreshToken)
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
    
    static func login(email: String, password: String) -> AnyPublisher<UserData, AFError> {
        return ApiClient.shared.session
            .request(AuthRouter.login(email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map { receivedValue in
                UserDefaultsManager.shared.setTokens(accessToken: receivedValue.token.accessToken,
                                                     refreshToken: receivedValue.token.refreshToken)
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
}
