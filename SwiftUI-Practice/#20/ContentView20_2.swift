//
//  ContentView20_2.swift
//  SwiftUI-Practice
//
//  Created by ukseung.dev on 5/8/24.
//

import SwiftUI

enum School : String, CaseIterable {
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    
    static func randomCase() -> School {
        let allCases = [School.elementary, .middle, .high]
        return allCases.randomElement()!
    }
}

struct Student: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var school: School
}

struct ContentView20_2: View {
    
    @State private var index = School.elementary
    
    @State private var student = [Student]()
    
    init() {
        
        var friendArray = [Student]()
        
        for i in 1 ... 20 {
            let friend = Student(name: "friend \(i)", school: School.randomCase())
            friendArray.append(friend)
        }

        _student = State(initialValue: friendArray)
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Text("동창?")
                    .fontWeight(.bold)
                    .font(.system(size: 16))
                    .padding(.leading, 24)
                    .padding(.top, 20)
                Spacer()
            }
            
            Picker("asd", selection: $index) {
                Text("초등학교").tag(School.elementary)
                Text("중학교").tag(School.middle)
                Text("고등학교").tag(School.high)
            }
            .pickerStyle(.segmented)
                
            List {
                ForEach(student.filter { term in
                    term.school == index
                    }
                ) { student in
                    HStack {
                        Spacer()
                        Text("name: \(student.name)")
                            .font(.system(size: 14))
                        Spacer()
                            .frame(width: 40)
                        Text("school: \(student.school)")
                        Spacer()
                    }
                }
            }
            
            Spacer()
        }
        
            .navigationTitle("filteredValue: \(index)")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ContentView20_2()
}
