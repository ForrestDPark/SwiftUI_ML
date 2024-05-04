//
//  ContentView.swift
//  TextFieldSwitchCalc
//
//  Created by Kenny Hahn on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var firstNum = ""
    @State var secondNum = ""
    
    @State var toggleAddition = false
    @State var toggleSubtraction = false
    @State var toggleMultiplication = false
    @State var toggleDivision = false
    
    @State var addition = ""
    @State var subtraction = ""
    @State var multiplication = ""
    @State var division = ""
    
    @State var storedAdd: Double = 0
    @State var storedSub: Double = 0
    @State var storedMul: Double = 0
    @State var storedDiv: Double = 0
    
    
    var body: some View {
        
        VStack(content: {
            Text("간단한 계산기")
                .bold()
            
            Spacer()
            
            HStack(content: {
                Text("첫번째 숫자 :")
                TextField("0", text: $firstNum)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })
            
            HStack(content: {
                Text("두번째 숫자 :")
                TextField("0", text: $secondNum)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 100)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.numberPad)
                    .focused($isTextFieldFocused)
            })

            HStack(content: {
                Button("계산하기", action: {
                    // 입력을 안하였을 경우 기본값 0으로 대체
                    let num1 = Double(firstNum) ?? 0
                    let num2 = Double(secondNum) ?? 0
                    
                    let addAction = Addition()
                    
                    storedAdd = addAction.add(num1, num2)
                    storedSub = num1 - num2
                    storedMul = num1 * num2
                    
                    division = ""
                    
                    if num2 == 0{
                        toggleDivision = true
                        division = "계산 불가"
                    }else{
                        toggleDivision = true
                        storedDiv = num1 / num2
                    }
                    
                    toggleAddition = true
                    toggleSubtraction = true
                    toggleMultiplication = true
                   
                    
                    checkSwitch()
                    
                    isTextFieldFocused = false
                    
                })
                .padding()
                .frame(width: 120, height: 40)
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)

                Button("지우기", action: {
                    firstNum = ""
                    secondNum = ""
                    
                    toggleAddition = false
                    toggleSubtraction = false
                    toggleMultiplication = false
                    toggleDivision = false
                    
                    addition = ""
                    subtraction = ""
                    multiplication = ""
                    division = ""
                    
                    storedAdd = 0
                    storedSub = 0
                    storedMul = 0
                    storedDiv = 0
                })
                .padding()
                .frame(width: 120, height: 40)
                .background(.red)
                .foregroundStyle(.white)
                .clipShape(.buttonBorder)

            })
            
            Spacer()
            
            HStack(content: {
                Spacer()
                
                Text("덧셈")
                    .frame(minWidth: 30, alignment: .trailing)
                Toggle("", isOn: $toggleAddition)
                    .labelsHidden()
                    .padding(.trailing, 24)
                    .onChange(of: toggleAddition, {
                        checkSwitch()
                    })
                
                Text("뺄셈")
                    .frame(minWidth: 30, alignment: .trailing)
                Toggle("", isOn: $toggleSubtraction)
                    .labelsHidden()
                    .onChange(of: toggleSubtraction, {
                        checkSwitch()
                    })
                
                Spacer()
            })

            HStack(content: {
                Spacer()
                
                Text("곱셈")
                    .frame(minWidth: 30, alignment: .trailing)
                Toggle("", isOn: $toggleMultiplication)
                    .labelsHidden()
                    .padding(.trailing, 10)
                    .onChange(of: toggleMultiplication, {
                        checkSwitch()
                    })
                
                Text("나눗셈")
                    .frame(minWidth: 30, alignment: .trailing)
                Toggle("", isOn: $toggleDivision)
                    .labelsHidden()
                    .onChange(of: toggleDivision, {
                        checkSwitch()
                    })
                
                Spacer()
            })

            Spacer()
            
            HStack(content: {
                Text("덧셈 :")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("덧셈 결과", text: $addition)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            })
            
            HStack(content: {
                Text("뺄셈 :")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("뺄셈 결과", text: $subtraction)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            })

            HStack(content: {
                Text("곱셈 :")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("곱셈 결과", text: $multiplication)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            })

            HStack(content: {
                Text("나눗셈 :")
                    .frame(minWidth: 50, alignment: .leading)
                TextField("나눗셈 결과", text: $division)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            })

            Spacer()
            
        })
        .padding()// VStack
        
    } // body
    
    // --- Functions ---
    func checkSwitch(){
        addition = toggleAddition ? String(storedAdd) : ""
        subtraction = toggleSubtraction ? String(storedSub) : ""
        multiplication = toggleMultiplication ? String(storedMul) : ""
        
        if division.isEmpty{
            division = toggleDivision && division.isEmpty ? String(storedDiv) : ""
        }
        
//        division = toggleDivision && division.isEmpty ? String(storedDiv) : ""
    }
    
} // ContentView

#Preview {
    ContentView()
}
