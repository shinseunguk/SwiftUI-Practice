//
//  ApiClient45.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import Foundation
import Alamofire

// API 호출 클라이언트
final class ApiClient45 {
    static let shared = ApiClient45()
    static let BASE_URL = "https://firebasestorage.googleapis.com/v0/b/rxswiftin4hours.appspot.com/o/fried_menus.json?alt=media&token=42d5cb7e-8ec4-48f9-bf39-3049e796c936"
    
    let interceptors = Interceptor(interceptors: [
        BaseInterceptor()
    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session = Session()
    
    init() {
        print("ApiClient - init() called")
        
//        session = Session(
//            interceptor: interceptors,
//            eventMonitors: monitors
//        )
    }
}
