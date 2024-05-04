//
//  ContentView.swift
//  Quiz03
//
//  Created by Kenny on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputNum = ""
    @State var message = "환영 합니다."
    @FocusState var isTextFieldFocused: Bool
    
    var body: some View {
        VStack(content: {
            Text("홀짝수 판별")
                .bold()
                .foregroundStyle(.red)
                .padding()
            
            HStack(content: {
                Text("입력숫자 :")
                TextField("숫자입력", text: $inputNum)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            .padding()
            
            Button("판별하기", action: {
                let checkResult = checkInput()
                if checkResult{
                    let decision = decisionOddEven()
                    if decision{
                        message = "짝수 입니다."
                    }else{
                        message = "홀수 입니다."
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
        if inputNum.isEmpty{
            return false
        }else{
            return true
        }
    }
    
    func decisionOddEven() -> Bool{
        if(Int(inputNum)! % 2 == 0){
            return true
        }else{
            return false
        }
    }
}

#Preview {
    ContentView()
}
