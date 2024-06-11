//
//  MenuRouter.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import Foundation
import Alamofire

enum MenuRouter: URLRequestConvertible {
    case fetchMenu
    
    var baseURL: URL {
        return URL(string: ApiClient45.BASE_URL)!
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchMenu:
            return .get
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var request = URLRequest(url: baseURL)
        request.method = method
        return request
    }
}
