//
//  TokenResponse.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/29/24.
//

import Foundation

// MARK: - TokenResponse
struct TokenResponse: Codable {
    let message: String
    let token: TokenData
}
