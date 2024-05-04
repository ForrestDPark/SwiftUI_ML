//
//  ContentView.swift
//  Switch
//
//  Created by Kenny on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var kor = ""
    @State var eng = ""
    @State var math = ""
    @State var message = ""
    
    var body: some View {
        VStack(content: {
            Text("평균점수 등급 계산")
                .bold()
                .padding()
            
            HStack(content: {
                Text("국어")
                TextField("숫자 입력", text: $kor)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            
            HStack(content: {
                Text("영어")
                TextField("숫자 입력", text: $eng)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            
            HStack(content: {
                Text("수학")
                TextField("숫자 입력", text: $math)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            
            Button("게산하기", action: {
                let avg = (Double(kor)! + Double(eng)! + Double(math)!) / 3.0
                var grade: String = ""
                
                // 삼항 연산자
                grade = avg >= 90 ? "수" :
                avg >= 80 ? "우" :
                avg >= 70 ? "미" :
                avg >= 60 ? "양" : "가"
                message = "평균은 \(String(format: "%.2f", avg))이고 등급은 \(grade) 입니다."
                isTextFieldFocused = false
            })
            .padding()
            
            Text(message)
                .bold()
            
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
