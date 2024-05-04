//
//  ContentView.swift
//  MultiLine
//
//  Created by Kenny Hahn on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var inputText = ""
    @State var enteredText = ""
    
    var body: some View {
        VStack(content: {
            Text("TextEditor를 이용한 여러 Line 출력")
                .bold()
                .padding()
            
            HStack(content: {
                TextField("문자 입력", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                    .multilineTextAlignment(.leading)
                    .keyboardType(.default)
                    .focused($isTextFieldFocused)
                
                Button("추가", action: {
                    let textCheck = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    if !textCheck.isEmpty{
                        enteredText += inputText + "\n"
                    }
                    inputText = ""
                    
                    isTextFieldFocused = false
                })
            })
            
            TextEditor(text: $enteredText)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .foregroundStyle(.black).bold()
                .colorMultiply(.gray.opacity(0.7))
                .clipShape(.rect(cornerRadius: 15))
                .disabled(true)
                .padding()
            
        })
        .padding()
            
        
    } // body
    
} // ContentView

#Preview {
    ContentView()
}
