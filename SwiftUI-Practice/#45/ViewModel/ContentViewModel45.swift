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
