//
//  User.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/21/24.
//

import Foundation

// Root struct to contain the results and info
struct User: Codable {
    let results: [UserResponse]
    let info: Info

    struct UserResponse: Codable {
        let gender: String
        let name: Name
        let location: Location
        let email: String
        let login: Login
        let dob: DateOfBirth
        let registered: Registered
        let phone: String
        let cell: String
        let id: ID
        let picture: Picture
        let nat: String

        struct Name: Codable {
            let title: String
            let first: String
            let last: String
        }

        struct Location: Codable {
            let street: Street
            let city: String
            let state: String
            let country: String
            let postcode: Postcode
            let coordinates: Coordinates
            let timezone: Timezone

            struct Street: Codable {
                let number: Int
                let name: String
            }

            struct Coordinates: Codable {
                let latitude: String
                let longitude: String
            }

            struct Timezone: Codable {
                let offset: String
                let description: String
            }
            
            // Postcode 타입 정의
            enum Postcode: Codable {
                case string(String)
                case int(Int)
                
                init(from decoder: Decoder) throws {
                    let container = try decoder.singleValueContainer()
                    if let intValue = try? container.decode(Int.self) {
                        self = .int(intValue)
                    } else if let stringValue = try? container.decode(String.self) {
                        self = .string(stringValue)
                    } else {
                        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Postcode type not matched"))
                    }
                }
                
                func encode(to encoder: Encoder) throws {
                    var container = encoder.singleValueContainer()
                    switch self {
                    case .int(let value):
                        try container.encode(value)
                    case .string(let value):
                        try container.encode(value)
                    }
                }
            }
        }

        struct Login: Codable {
            let uuid: String
            let username: String
            let password: String
            let salt: String
            let md5: String
            let sha1: String
            let sha256: String
        }

        struct DateOfBirth: Codable {
            let date: String
            let age: Int
        }

        struct Registered: Codable {
            let date: String
            let age: Int
        }

        struct ID: Codable {
            let name: String
            let value: String?
        }

        struct Picture: Codable {
            let large: URL
            let medium: URL
            let thumbnail: URL
        }
    }

    struct Info: Codable {
        let seed: String
        let results: Int
        let page: Int
        let version: String
    }
}
