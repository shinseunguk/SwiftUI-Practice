//
//  ContentView15.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/3/24.
//

import SwiftUI
import CodeScanner

struct ContentView15: View {
    
    @State private var scannedCode: String?
    @State private var isPresentingScanner = false
    
    var body: some View {
        GeometryReader { proxy in
            ZStack (alignment: .bottom){
                
                if let scannedCode {
                    MyWebview4(urlToLoad: scannedCode)
                } else {
                    MyWebview4(urlToLoad: "https://www.naver.com")
                }
                
                Button(action:{
                    print("action")
                    self.isPresentingScanner = true
                }, label: {
                    Text("QR 코드 스캔")
                        .padding(30)
                        .font(.system(size: 20))
                        .frame(width: 200, height: 80)
                        .background(.blue)
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                })
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerView
                }
            }
        }
    }
    
    var scannerView: some View {
        ZStack (alignment: .center){
            CodeScannerView(codeTypes: [.qr]) { response in
                if case let .success(result) = response {
                    print(result.string)
                    scannedCode = result.string
                    isPresentingScanner = false
                }
            }
            
            Rectangle()
                .stroke(style: .init(dash: [20]))
                .frame(width: 250, height: 250)
                .foregroundStyle(.yellow)
                .opacity(isPresentingScanner ? 1.0 : 0.0)
        }
    }
}

#Preview {
    ContentView15()
}
