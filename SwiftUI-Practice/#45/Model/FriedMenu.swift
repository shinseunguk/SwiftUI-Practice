//
//  FriedMenu.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import Foundation

struct FriedMenuArray: Codable, Hashable {
    var menus: [FriedMenu]
}

struct FriedMenu: Codable, Hashable {
    var name: String
    var price: Int
}
