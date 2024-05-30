//
//  OAuthCredential.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation
import Alamofire

struct OAuthCredential : AuthenticationCredential {
    
    let accessToken: String
    let refreshToken: String
    let expiration: Date
    var requiresRefresh: Bool { Date(timeIntervalSinceNow: 30) > expiration }
}
