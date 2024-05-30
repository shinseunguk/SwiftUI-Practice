//
//  ApiLogger.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation
import Alamofire

final class ApiLogger: EventMonitor {
    let queue = DispatchQueue(label: "SwiftUI_Practice")
    
    func requestDidResume(_ request: Request) {
        print("\(#file) - Resuming: \(request)")
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        debugPrint("\(#file) - Finished: \(response)")
    }
}
