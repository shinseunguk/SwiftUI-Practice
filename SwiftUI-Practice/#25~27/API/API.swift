//
//  API.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/21/24.
//

import Foundation
import Alamofire

let BASE_URL = "https://randomuser.me/api/"

enum API: URLRequestConvertible {
    case fetchUser(page: Int = 1, result: Int = 20)
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .fetchUser:
            return ""
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchUser:
            return .get
        }
    }
    
    var parameters: Parameters {
        switch self {
        case let .fetchUser(page, results):
            var params = Parameters()
            params["page"] = page
            params["results"] = results
            params["seed"] = "ukseung.dev"
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case .fetchUser:
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        
        return request
    }
}
