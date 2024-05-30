//
//  AuthResponse.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation

struct AuthResponse : Codable {
    var user: UserData
    var token: TokenData
    enum CodingKeys: String, CodingKey {
        case token
        case user
    }
}
