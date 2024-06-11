//
//  ViewMenu.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import Foundation

struct ViewMenu: Hashable {
    var name: String
    var price: Int
    var count: Int

    init(_ item: FriedMenu) {
        name = item.name
        price = item.price
        count = 0
    }

    init(name: String, price: Int, count: Int) {
        self.name = name
        self.price = price
        self.count = count
    }

    func countUpdated(_ count: Int) -> ViewMenu {
        return ViewMenu(name: name, price: price, count: count)
    }
}
