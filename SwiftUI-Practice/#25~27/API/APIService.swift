//
//  APIService.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/21/24.
//

import Foundation
import Combine
import Alamofire

enum ApiService {
    
    ///  Users 가져오기
    /// - Returns: AnyPublisher<[User], Error>
    static func fetchUsers(page: Int) -> AnyPublisher<User, Error> {
        
        //AF로 Refactor
        return AF.request(API.fetchUser(page: page, result: 20))
            .publishDecodable(type: User.self) //디코딩
            .value() // 값만 가져오기
            .mapError { (afError:AFError) in
                //.value를 거치면 AnyPublisher<Value, AFError> 상태이므로 AFError -> Error로 캐스팅
                return afError as Error
            }
            .eraseToAnyPublisher()
    }
}
