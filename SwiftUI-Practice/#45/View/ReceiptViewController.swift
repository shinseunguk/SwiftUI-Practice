//
//  ReceiptViewController.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 6/11/24.
//

import SwiftUI

struct ReceiptViewController: View {
    
    @EnvironmentObject var viewModel: ContentViewModel45
    
    var body: some View {
        GeometryReader { geometryReader in
            VStack (alignment: .leading){
                HStack {
                    VStack {
                        Spacer()
                        
                        Text("Receipt")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 20)
                    }
                    
                    Spacer()
                }
                .frame(width: geometryReader.size.width, height: 180)
                .background(.black)
                
                ScrollView {
                    Spacer()
                        .frame(height: 20)
                    
                    HStack {
                        Text("Ordered Items")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    
                    ForEach(viewModel.menus, id: \.self) { menu in
                        if menu.count != 0 {
                            HStack {
                                Text("\(menu.name) \(menu.count)개")
                                    .font(.system(size: 40))
                                    .fontWeight(.light)
                                    .padding(.leading, 20)
                                
                                Spacer()
                            }
                            
                            Spacer()
                                .frame(height: 4)
                        }
                    }
                    
                    HStack {
                        Text("Price to pay")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                        
                        Spacer()
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    
                    HStack {
                        Text("Items")
                            .font(.system(size: 30))
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("₩\(viewModel.totalPrice)")
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 10)
                    
                    HStack {
                        Text("VAT")
                            .font(.system(size: 30))
                            .fontWeight(.light)
                        
                        Spacer()
                        
                        Text("₩\(viewModel.totalVat)")
                    }
                    .padding(.horizontal, 30)
                    .padding(.bottom, 10)
                    
                    Divider()
                        .background(.gray)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        Spacer()
                        
                        Text("₩\(viewModel.total)")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding(.horizontal, 30)
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 30)
                    
                    Spacer()
                }
                .frame(width: geometryReader.size.width)
            }
        }
        .ignoresSafeArea(.all)
    }
}
//
//#Preview {
//    ReceiptViewController()
//}
