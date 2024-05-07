//
//  LottoGenie15.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/7/24.
//

// 1~10번까지는 노란색, 11~20번은 파란색, 21~30번은 빨간색, 31~40번은 회색, 41~45번은 녹색

import SwiftUI

struct LottoGenie15: View {
    
    @State private var lottoNumbers = [Int]()
    
    var body: some View {
        VStack {
            HStack {
                ForEach(lottoNumbers, id: \.self) { number in
                    ZStack {
                        Circle()
                            .foregroundColor(getBackgroundColor(for: number))
                            .frame(width: 50, height: 50)
                        
                        Text(String(number))
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
            }
            .opacity(lottoNumbers.count != 0 ? 1.0 : 0.0)
            .padding(.bottom, 30)
            
            Button("번호 생성") {
                self.lottoNumbers = generateLottoNumbers()
            }
            .padding(15)
            .background(.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
    }
}

func generateLottoNumbers() -> [Int] {
    var lottoNumbers = [Int]()
    
    // 6개의 무작위로 선택된 번호 생성
    while lottoNumbers.count < 6 {
        let randomNumber = Int.random(in: 1...45)
        // 중복된 번호를 피하기 위해 이미 선택된 번호인지 확인
        if !lottoNumbers.contains(randomNumber) {
            lottoNumbers.append(randomNumber)
        }
    }
    
    // 생성된 번호를 정렬하여 반환
    return lottoNumbers.sorted()
}

func getBackgroundColor(for number: Int) -> Color {
    switch number {
    case 1...10:
        return Color.yellow
    case 11...20:
        return Color.blue
    case 21...30:
        return Color.red
    case 31...40:
        return Color.gray
    case 41...45:
        return Color.green
    default:
        return Color.clear // 기본값은 투명으로 설정
    }
}

#Preview {
    LottoGenie15()
}
