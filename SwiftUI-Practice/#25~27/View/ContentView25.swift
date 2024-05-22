//
//  ContentView25.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/20/24.
//

import SwiftUI

struct ContentView25Constants {
    static var page = 1
}

struct ContentView25: View {
    
    @ObservedObject var viewModel = ContentViewModel25()
    @State private var isRefreshing: Bool = false
    @State private var isLoadingMore: Bool = false
    
    var body: some View {
        List(viewModel.users, id: \.id.value) { user in // 뷰모델에서 가져온 사용자 데이터를 리스트에 표시
            HStack (spacing: 20){
                ProfileView25(url: user.picture.thumbnail)
                    .frame(width: 50, height: 50)
                Text("[\(user.name.title)] \(user.name.first), \(user.name.last)")
                    .font(.system(size: 20, weight: .bold))
                    .lineLimit(0)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50, alignment: .leading)
                    .padding(.vertical)
                    .onAppear {
                        loadMoreUsersIfNeeded(currentUser: user)
                    }
            }
        }
        .refreshable {
            await refreshItems()
        }
    }
    
    private func refreshItems() async {
        isRefreshing = true
        await Task.sleep(2 * 1_000_000_000) // 2 seconds delay to simulate network request
        viewModel.fetchUsers(page: ContentView25Constants.page)
        isRefreshing = false
    }
    
    private func loadMoreUsersIfNeeded(currentUser: User.UserResponse) {
        guard !isLoadingMore, let lastUser = viewModel.users.last else {
            return
        }
        if currentUser.id.value == lastUser.id.value {
            loadMoreUsers()
        }
    }
    
    private func loadMoreUsers() {
        ContentView25Constants.page += 1
        isLoadingMore = true
//        DispatchQueue.global().asyncAfter(deadline: .now() + 2) { // Simulate network request
        viewModel.fetchUsers(page: ContentView25Constants.page)
            DispatchQueue.main.async {
                self.isLoadingMore = false
            }
//        }
    }
}

#Preview {
    ContentView25()
}
