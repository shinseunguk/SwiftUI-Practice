//
//  MenuService.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/10/24.
//

import Foundation
import Alamofire
import Combine

enum MenuService {
    static func fetchMenus() -> AnyPublisher<[ViewMenu], AFError> {
        return ApiClient45.shared.session
            .request(MenuRouter.fetchMenu)
            .publishDecodable(type: FriedMenuArray.self)
            .value()
            .map {
                $0.menus.map {
                    return ViewMenu($0)
                }
            }
            .eraseToAnyPublisher()
    }
}
