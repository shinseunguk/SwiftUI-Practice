//
//  UserApiService.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation
import Alamofire
import Combine

enum UserApiService {
    // 현재사용자 정보
    static func fetchCurrentUserInfo() -> AnyPublisher<UserData, AFError>{
        print("AuthApiService - fetchCurrentUserInfo() called")
        
        
        let storedTokenData = UserDefaultsManager.shared.getTokens()
        let credential = OAuthCredential(accessToken: storedTokenData.accessToken,
                                         refreshToken: storedTokenData.refreshToken,
                                         expiration: Date(timeIntervalSinceNow: 60 * 60))
        
        // Create the interceptor
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                        credential: credential)
        
        return ApiClient.shared.session
            .request(UserRouter.userInfo, interceptor: authInterceptor)
            .publishDecodable(type: UserInfoResponse.self)
            .value()
            .map{ receivedValue in
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
    
    // 사용자 List
    static func fetchUserList() -> AnyPublisher<[UserData], AFError>{
        print("AuthApiService - fetchCurrentUserInfo() called")
        
        
        let storedTokenData = UserDefaultsManager.shared.getTokens()
        let credential = OAuthCredential(accessToken: storedTokenData.accessToken,
                                         refreshToken: storedTokenData.refreshToken,
                                         expiration: Date(timeIntervalSinceNow: 60 * 60))
        
        // Create the interceptor
        let authenticator = OAuthAuthenticator()
        let authInterceptor = AuthenticationInterceptor(authenticator: authenticator,
                                                        credential: credential)
        
        return ApiClient.shared.session
            .request(UserRouter.fetchUsers, interceptor: authInterceptor)
            .publishDecodable(type: UserListResponse.self)
            .value()
            .map { receievedValue in
                return receievedValue.data
            }
            .eraseToAnyPublisher()
    }
}
