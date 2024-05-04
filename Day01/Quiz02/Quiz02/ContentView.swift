//
//  ContentView.swift
//  Quiz02
//
//  Created by Kenny Hahn on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var num1 = ""
    @State var num2 = ""
    @State var addition = ""
    @State var subtraction = ""
    @State var multiplication = ""
    @State var division = ""
    @State var message = "숫자 연산 입니다."
    
    
    var body: some View {
        VStack(content: {
            Text("두개의 숫자 연산")
                .bold()
                .font(.system(size: 20))
                .padding()
            
            Spacer()
            
            HStack(content: {
                Text("첫번째 숫자")
                TextField("1st Number", text: $num1)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            
            HStack(content: {
                Text("두번째 숫자")
                TextField("2nd Number", text: $num2)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })

            Button("계산하기", action: {
                let checkResult = inputCheck()
                if checkResult{
                    displayResult()
                    message = "계산이 완료 되었습니다."
                }else{
                    message = "숫자를 입력 하세요"
                }
                
                isTextFieldFocused = false
            })
            .padding(.top, 10)
            
            Button("초기화", action: {
                num1.removeAll()
                num2.removeAll()
                addition.removeAll()
                subtraction.removeAll()
                multiplication.removeAll()
                division.removeAll()
                message = "숫자 연산 입니다."
                
                isTextFieldFocused = false
            })
            .padding()
            
            
            Spacer()

            HStack(content: {
                Text("덧셈 결과")
                    .frame(minWidth: 100, alignment: .leading)
                TextField("", text: $addition)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)  // Read Only
            })

            HStack(content: {
                Text("뺄셈 결과")
                    .frame(minWidth: 100, alignment: .leading)
                TextField("", text: $subtraction)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)  // Read Only
            })

            HStack(content: {
                Text("곱셈 결과")
                    .frame(minWidth: 100, alignment: .leading)
                TextField("", text: $multiplication)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)  // Read Only
            })

            HStack(content: {
                Text("나눗셈 결과")
                    .frame(minWidth: 100, alignment: .leading)
                TextField("", text: $division)
                    .frame(width: 120)
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.trailing)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)  // Read Only
            })

            Text(message)
                .padding()
            
            Spacer()
            
        })
        .padding()// VStack
        
    } // body
    
    // --- Functions ----
    func inputCheck() -> Bool{
        if num1.isEmpty || num2.isEmpty{
            return false
        }
        return true
    }
    
    func displayResult(){
        addition = String(Int(num1)! + Int(num2)!)
        subtraction = String(Int(num1)! - Int(num2)!)
        multiplication = String(Int(num1)! * Int(num2)!)
        division = String(format:"%.2f", Double(num1)! / Double(num2)!)
    }
    
} // ContentView

#Preview {
    ContentView()
}
