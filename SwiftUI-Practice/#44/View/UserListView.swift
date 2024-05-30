//
//  UserListView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/27/24.
//

import SwiftUI

struct UserListView: View {
    
    @EnvironmentObject var viewModel: ContentViewModel44
    
    @State var users: [UserData] = []
    
    var body: some View {
        List {
            ForEach(users, id: \.self) { user in
                HStack {
                    if !user.avatar.isEmpty {
                        AsyncImage(url: URL(string: user.avatar)!) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 100, height: 100, alignment: .center)
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100, alignment: .center)
                            case .failure:
                                Image(systemName: "person.fill.questionmark")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                    .frame(width: 100, height: 100, alignment: .center)
                            @unknown default:
                                EmptyView()
                                    .frame(width: 100, height: 100, alignment: .center)
                            }
                        }
                    } else {
                        Image(systemName: "person.fill.questionmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(width: 100, height: 100, alignment: .center)
                    }
                    
                    Spacer()
                        .frame(width: 20)
                    
                    VStack (alignment: .leading){
                        Text(user.name)
                            .font(.system(size: 20))
                        Text(user.email)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
        }
        .onAppear {
            viewModel.fetchUserList()
        }
        .onReceive(viewModel.$users, perform: { users in
            self.users = users
        })
        .navigationTitle("사용자 목록")
    }
}

#Preview {
    UserListView()
}
