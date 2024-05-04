//
//  ContentView.swift
//  Quiz32
//
//  Created by Kenny on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var startNum = ""
    @State var endNum = ""
    @State var message = "환영 합니다."
    
    var body: some View {
        VStack(content: {
            Text("범위의 합계 구하기")
                .bold()
                .padding()
            
            HStack(content: {
                Text("시작 숫자 :")
                    .frame(minWidth: 100, alignment: .leading)
                TextField("0", text: $startNum)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })

            HStack(content: {
                Text("끝 숫자 :")
                    .frame(minWidth: 100, alignment: .leading)
                TextField("0", text: $endNum)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })

            Button("범위 합계", action: {
                let numNum1 = Int(startNum) ?? 0
                let numNum2 = Int(endNum) ?? 0
                
                // 숫자 크기 비교하여 정의하기
                var num1st: Int
                var num2nd: Int
                
                if numNum1 > numNum2{
                    num1st = numNum2
                    num2nd = numNum1
                }else{
                    num1st = numNum1
                    num2nd = numNum2
                }

                // 범위의 합계 구하기
                var totalNum: Int = 0 // 누적변수
                for i in num1st...num2nd{
                    totalNum+=i
                }
                message = "숫자의 합계는 \(totalNum)입니다."
                isTextFieldFocused = false
            })
            .padding()
            
            Text(message)
                .padding()
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
