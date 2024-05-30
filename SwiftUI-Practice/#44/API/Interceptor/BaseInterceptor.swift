//
//  BaseInterceptor.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation
import Alamofire

final class BaseInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        
        // 헤더 부분 넣어주기
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Accept")
        
        completion(.success(request))
    }
}
