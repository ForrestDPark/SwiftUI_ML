//
//  ContentView.swift
//  Quiz31
//
//  Created by Kenny on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var num1 = ""
    @State var num2 = ""
    @State var message = "환영 합니다."
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        VStack(content: {
            Text("짝수인 경우에만 덧셈 실행")
                .bold()
                .padding()
            
            HStack(content: {
                Text("1번 숫자 :")
                TextField("숫자 입력", text: $num1)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            .padding()
            
            HStack(content: {
                Text("2번 숫자 :")
                TextField("숫자 입력", text: $num2)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            
            Button("판별하기", action: {
                let checkResult = checkInput()
                if checkResult{
                    let decision = decisionOddEven()
                    if decision{
                        message = "입력하신 숫자의 합은 \(String(Int(num1)! + Int(num2)!)) 입니다."
                    }else{
                        message = "짝수를 입력하세요"
                    }
                }else{
                    message = "숫자를 입력하세요"
                }
                isTextFieldFocused = false
            })
            .padding()
            
            Text(message)
                .padding()

        })
        .padding()
    }
    
    // --- Functions ---
    
    func checkInput() -> Bool{
        if (num1.isEmpty || num2.isEmpty){
            return false
        }else{
            return true
        }
    }
    
    func decisionOddEven() -> Bool{
        if(Int(num1)! % 2 == 0 && Int(num2)! % 2 == 0){
            return true
        }else{
            return false
        }
    }
}

#Preview {
    ContentView()
}
