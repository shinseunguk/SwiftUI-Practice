//
//  AuthRouter.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation
import Alamofire

// 인증 라우터
// 회원가입, 로그인, 토큰갱신
enum AuthRouter: URLRequestConvertible {
    
    case register(name: String, email: String, password: String)
    case login(email: String, password: String)
    case tokenRefresh
    
    var baseURL: URL {
        return URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .register:
            return "user/register"
        case .login:
            return "user/login"
        case .tokenRefresh:
            return "user/token-refresh"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .register:
            return .post
        case .login:
            return .post
        case .tokenRefresh:
            return .post
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .register(let name, let email, let password):
            var params = Parameters()
            params["name"] = name
            params["email"] = email
            params["password"] = password
            return params
        case let .login(email, password):
            var params = Parameters()
            params["email"] = email
            params["password"] = password
            return params
        case .tokenRefresh:
            var params = Parameters()
            let tokenData = UserDefaultsManager.shared.getTokens()
            params["refresh_token"] = tokenData.refreshToken
            return params
        default:
            break
        }
    }
    
    
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        
        request.method = method
        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        
        return request
    }
}
