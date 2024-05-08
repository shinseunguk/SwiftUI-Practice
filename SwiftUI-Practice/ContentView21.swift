//
//  ContentView21.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/8/24.
//

import SwiftUI

enum TabIdentifier: Hashable {
    case todos, profile
}

// 어떤 페이지를 가져 와야 하는지
enum PageIdentifier : Hashable{
    case todoItem(id: UUID)
}


// URL을 extension하여 확장
extension URL{
    // deeplink-swiftui 스키마가 url로 들어왔다면 true로 반환
    // info에서 추가한 딥링크가 들어왔는지 여부
    var isDeeplink : Bool{
        return scheme == "swiftui-practice"
    }
    
    // url 들어오는 것으로 어떤 타입의 탭을 보여줘야 하는지 가져오기
    var tabIdentifier: TabIdentifier? {
        guard isDeeplink else { return nil }
        
        // deeplink-swiftui://[host]
        switch host {
        case "todos":
            return .todos
        case "profile":
        return .profile
        default:
            return nil
        }
    }
    
    var detailPage: PageIdentifier?{
        // deeplink-swiftui://[host]/[pathComponents]/인 경우
        // ["/", "id"] 형식으로 들어옴
        
        print("pathComponents: \(pathComponents)")
        
        guard let tabId = tabIdentifier, pathComponents.count > 1,
            let uuid = UUID(uuidString: pathComponents[1])
        else {
            return nil
        }
        
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
    }
}

struct ContentView21: View {
    
    @State var selectedTab: TabIdentifier = TabIdentifier.todos
    
    var body: some View {
        
        TabView (selection: $selectedTab) {
            ListView21()
                .tabItem {
                    Image(systemName: "list.bullet.clipboard.fill")
                    Text("할 일 목록")
                }
                .tag(TabIdentifier.todos)
            
            ProfileView21()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("프로필")
                }
                .tag(TabIdentifier.profile)
            
        }.navigationTitle("TO DO LIST")
            .onOpenURL(perform: { url in
                switch url.host {
                case "todos":
                    selectedTab = .todos
                case "profile":
                    selectedTab = .profile
                default:
                    break;
                }
            })
    }
}

#Preview {
    ContentView21()
}
