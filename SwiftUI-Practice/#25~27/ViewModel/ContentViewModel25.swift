//
//  ContentViewModel25.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/20/24.
//

import Foundation
import Alamofire
import Combine

final class ContentViewModel25: ObservableObject {
    
    @Published var users: [User.UserResponse] = [] // 뷰에서 사용할 사용자 데이터
    
    var subscriptions = Set<AnyCancellable>() // dispose
    
    init() {
        fetchUsers(page: 1)
    }
    
    func fetchUsers(page: Int) {
        ApiService.fetchUsers(page: page)
            .map { $0.results }
            .sink { completion in
                switch completion {
                case .failure(let err):
                    print("error: \(err)")
                case .finished:
                    break
                }
            } receiveValue: { user in
                self.users.append(contentsOf: user)
            }.store(in: &subscriptions)

    }
}
