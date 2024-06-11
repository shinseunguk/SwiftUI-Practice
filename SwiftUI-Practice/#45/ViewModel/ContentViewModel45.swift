//
//  ContentViewModel45.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import Foundation
import Alamofire
import Combine

final class ContentViewModel45: ObservableObject {
    
    //MARK: properties
    var subscription = Set<AnyCancellable>()
    
    @Published var menus: [ViewMenu] = []

    var totalItemCount: Int {
        menus.reduce(0) { $0 + $1.count }
    }

    var totalPrice: Int {
        menus.reduce(0) { $0 + $1.price * $1.count }
    }
    
    var totalVat: Int {
        menus.reduce(0) { ($0 + $1.price * $1.count)} / 11
    }
    
    var total: Int {
        totalPrice + totalVat
    }
    
    func fetchMenus() {
        MenuService.fetchMenus()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("ContentViewModel45 completion: \(completion)")
            } receiveValue: {
                self.menus = $0
            }.store(in: &subscription)
    }
    
    func menusCountClear() {
        menus = menus.map {
            $0.countUpdated(0)
        }
    }
}
