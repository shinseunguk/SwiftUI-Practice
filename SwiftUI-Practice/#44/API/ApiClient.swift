//
//  ApiClient.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation
import Alamofire

// API 호출 클라이언트
final class ApiClient {
    static let shared = ApiClient()
    static let BASE_URL = "https://phplaravel-574671-2229990.cloudwaysapps.com/api/"
    
    let interceptors = Interceptor(interceptors: [
        BaseInterceptor()
    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session
    
    init() {
        print("ApiClient - init() called")
        
        session = Session(
            interceptor: interceptors,
            eventMonitors: monitors
        )
    }
}
