//
//  QRCodeScannerView.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/3/24.
//

import SwiftUI
import CodeScanner

struct QRCodeScannerView: View {
    @State private var isPresentingScanner = false
    @State private var scannedCode: String?

    var body: some View {
        CodeScannerView(codeTypes: [.qr]) { response in
            if case let .success(result) = response {
                scannedCode = result.string
                isPresentingScanner = false
            }
        }
    }
}
