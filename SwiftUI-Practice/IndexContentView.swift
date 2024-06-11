//
//  ContentView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 4/5/24.
//

import SwiftUI

enum Constants {
    static let section1 = ["SwiftUI 기초(default 화면)"]
    static let section2 = ["WebView 기초"]
    static let section3 = ["Text 기초 및 속성"]
    static let section4 = ["Image 기초 및 속성"]
    static let section5 = ["VStackView", "HStackView", "ZStackView"]
    static let section6 = ["Layout 기초"]
    static let section7 = ["Geometry-Reader 기초1", "Geometry-Reader 기초2"]
    static let section8 = ["Tabbar 기초1", "Tabbar 기초2"]
    static let section9 = ["QR 코드 리더", "로또 번호 생성기"]
    static let section10 = ["Button Style"]
    static let section11 = ["Input TextField"]
    static let section12 = ["PickerView 기초1", "PickerView 기초2"]
    static let section13 = ["DeepLink 예제"]
    static let section14 = ["Menu 예제"]
    static let section15 = ["Lazy Grid 예제"]
    static let section16 = ["Redux 기초"]
    static let section17 = ["Combine + Alamofire 기초"]
    static let section18 = ["ViewModifier 기초"]
    static let section19 = ["다크모드"]
    static let section20 = ["화면 녹화 방지 및 스크린샷 감지"]
    static let section21 = ["State / Binding / EnvironmentObject 기초"]
    static let section22 = ["Tap Gesture 기초"]
    static let section23 = ["MapView 기초"]
    static let section24 = ["ScrollView Reader 기초"]
    static let section25 = ["drag&drop"]
    static let section26 = ["Login & MVVM + Alamofire + Combine"]
    static let section27 = ["키오스크"]
}

struct IndexContentView: View {
    
    @State private var deeplinkIndex: String?
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Practice#1~3")) {
                    ForEach(Constants.section1, id: \.self) { item in
                        NavigationLink(destination: ContentView1()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("WebView#4")) {
                    ForEach(Constants.section2, id: \.self) { item in
                        NavigationLink(destination: ContentView4()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Text#5")) {
                    ForEach(Constants.section3, id: \.self) { item in
                        NavigationLink(destination: ContentView5()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Image#6")) {
                    ForEach(Constants.section4, id: \.self) { item in
                        NavigationLink(destination: ContentView6()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Stack#7")) {
                    ForEach(Constants.section5, id: \.self) { item in
                        NavigationLink(destination: chapter7DetermineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Layout#8~11")) {
                    ForEach(Constants.section6, id: \.self) { item in
                        NavigationLink(destination: ContentView8()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("GeometryReader#12")) {
                    ForEach(Constants.section7, id: \.self) { item in
                        NavigationLink(destination: chapter12DetermineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Tabbar#13~14")) {
                    ForEach(Constants.section8, id: \.self) { item in
                        NavigationLink(destination: chapter13DetermineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Lotto#15")) {
                    ForEach(Constants.section9, id: \.self) { item in
                        NavigationLink(destination: chapter15DetermineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Button Style#17")) {
                    ForEach(Constants.section10, id: \.self) { item in
                        NavigationLink(destination: ContentView17()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("TextField#18")) {
                    ForEach(Constants.section11, id: \.self) { item in
                        NavigationLink(destination: ContentView18()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("PickerView#20")) {
                    ForEach(Constants.section12, id: \.self) { item in
                        NavigationLink(destination: chapter20DetermineDestination(item: item)) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Deeplink#21")) {
                    ForEach(Constants.section13, id: \.self) { item in
                        
                        NavigationLink(
                            destination: ContentView21(),
                            tag: "deeplink",
                            selection: $deeplinkIndex
                        ) {
                            Text(item)
                                .onOpenURL(perform: { url in
                                    print(url)
                                    
                                    if let host = url.host {
                                        if host.contains("deeplink") {
                                            self.deeplinkIndex = "deeplink"
                                            
                                        } else {
                                            print("포함 x")
                                        }
                                    } else {
                                        print("nil")
                                    }
                                })
                        }
                    }
                }
                
                Section(header: Text("Menu#22")) {
                    ForEach(Constants.section14, id: \.self) { item in
                        NavigationLink(destination: ContentView22()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Lazy Grid#23")) {
                    ForEach(Constants.section15, id: \.self) { item in
                        NavigationLink(destination: ContentView23()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Redux#24")) {
                    ForEach(Constants.section16, id: \.self) { item in
                        NavigationLink(destination: ContentView24()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Combine + Alamofire#25~27")) {
                    ForEach(Constants.section17, id: \.self) { item in
                        NavigationLink(destination: ContentView25()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("ViewModifier#28")) {
                    ForEach(Constants.section18, id: \.self) { item in
                        NavigationLink(destination: ContentView28()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("DarkMode#29")) {
                    ForEach(Constants.section19, id: \.self) { item in
                        NavigationLink(destination: ContentView29()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("화면 녹화 방지 및 스크린샷 감지#30")) {
                    ForEach(Constants.section20, id: \.self) { item in
                        NavigationLink(destination: ContentView30()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("State / Binding / EnvironmentObject#31")) {
                    ForEach(Constants.section21, id: \.self) { item in
                        NavigationLink(destination: ContentView31().environmentObject(ContentViewModel31())) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Tap Gesture 기초#37")) {
                    ForEach(Constants.section22, id: \.self) { item in
                        NavigationLink(destination: ContentView37()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("MapView 기초#38")) {
                    ForEach(Constants.section23, id: \.self) { item in
                        NavigationLink(destination: ContentView38()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("ScrollView Reader 기초#39")) {
                    ForEach(Constants.section24, id: \.self) { item in
                        NavigationLink(destination: ContentView39()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Drag & Drop#39")) {
                    ForEach(Constants.section25, id: \.self) { item in
                        NavigationLink(destination: ContentView40()) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("Login & MVVM + Alamofire + Combine#44")) {
                    ForEach(Constants.section26, id: \.self) { item in
                        NavigationLink(destination: ContentView44().environmentObject(ContentViewModel44())) {
                            Text(item)
                        }
                    }
                }
                
                Section(header: Text("심화 과정")) {
                    ForEach(Constants.section27, id: \.self) { item in
                        NavigationLink(destination: ContentView45()) {
                            Text(item)
                        }
                    }
                }
            }
            .navigationBarTitle("SwiftUI-Practice")
        }
    }
}

func chapter7DetermineDestination(item: String) -> some View {
    switch item {
    case "VStackView":
        return AnyView(VStackView7())
    case "HStackView":
        return AnyView(HStackView7())
    case "ZStackView":
        return AnyView(ZStackView7())
    default:
        return AnyView(EmptyView()) // Default case, do nothing
    }
}


func chapter12DetermineDestination(item: String) -> some View {
    switch item {
    case "Geometry-Reader 기초1":
        return AnyView(ContentView12())
    case "Geometry-Reader 기초2":
        return AnyView(ContentView12_2())
    default:
        return AnyView(EmptyView()) // Default case, do nothing
    }
}

func chapter13DetermineDestination(item: String) -> some View {
    switch item {
    case "Tabbar 기초1":
        return AnyView(TabView13())
    case "Tabbar 기초2":
        return AnyView(TabView14(tabIndex: .home))
    default:
        return AnyView(EmptyView()) // Default case, do nothing
    }
}

func chapter15DetermineDestination(item: String) -> some View {
    switch item {
    case "QR 코드 리더":
        return AnyView(ContentView16())
    case "로또 번호 생성기":
        return AnyView(LottoGenie())
    default:
        return AnyView(EmptyView()) // Default case, do nothing
    }
}

func chapter20DetermineDestination(item: String) -> some View {
    switch item {
    case "PickerView 기초1":
        return AnyView(ContentView20())
    case "PickerView 기초2":
        return AnyView(ContentView20_2())
    default:
        return AnyView(EmptyView()) // Default case, do nothing
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IndexContentView()
    }
}


