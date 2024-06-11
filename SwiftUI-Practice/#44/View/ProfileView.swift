//
//  ProfileView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/27/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel : ContentViewModel44
    
    @State var id: String = ""
    @State var name: String = ""
    @State var email: String = ""
    @State var avatarImage: String = ""
    
    var body: some View {
        VStack {
            if !avatarImage.isEmpty {
                AsyncImage(url: URL(string: avatarImage)!) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 250, height: 250, alignment: .center)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 250, height: 250, alignment: .center)
                    case .failure:
                        Image(systemName: "person.fill.questionmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding()
                            .frame(width: 250, height: 250, alignment: .center)
                    @unknown default:
                        EmptyView()
                            .frame(width: 250, height: 250, alignment: .center)
                    }
                }
            } else {
                Image(systemName: "person.fill.questionmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 250, height: 250, alignment: .center)
            }
            
            Form {
                Section("프로필 정보") {
                    Text("ID: \(id)")
                    Text("name: \(name)")
                    Text("email: \(email)")
                }
            }
        }
        .redacted(reason: id != "" ? [] : .placeholder)
        .onAppear {
            viewModel.fetchUserInfo()
        }
        .onReceive(viewModel.$loggedInUser, perform: { userData in
            guard let user = userData else {return}
            self.id = "\(user.id)"
            self.name = user.name
            self.email = user.email
            self.avatarImage = user.avatar
        })
        .navigationTitle("프로필 정보")
    }
}

#Preview {
    ProfileView()
}
