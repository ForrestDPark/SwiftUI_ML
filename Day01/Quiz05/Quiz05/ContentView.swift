//
//  ContentView.swift
//  Quiz05
//
//  Created by Kenny on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var inputText = ""
    @State var enteredText = ""
    
    
    var body: some View {
        VStack(content: {
            Text("구구단 출력")
                .bold()
                .padding()
            
            HStack(content: {
                TextField("구구단", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.default)
                    .focused($isTextFieldFocused)
                
                Button("단출력", action: {
                    let textCheck = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    if !textCheck.isEmpty{
                        for i in 1...9{
                            let result = "\(inputText) X \(i) = \(Int(inputText)! * i) \n"
                            enteredText += result
                        }
                    }
                    inputText = ""
                    isTextFieldFocused = false
                })
            })
            
            TextEditor(text: $enteredText)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
                .foregroundStyle(.black).bold()
                .colorMultiply(.gray.opacity(0.8))
                .clipShape(.rect(cornerRadius: 15))
                .disabled(true)
                .padding()
            
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
