//
//  ContentView.swift
//  SendMessage
//
//  Created by Kenny on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @FocusState var isTextFieldFocused: Bool
    @State var enteredText = ""
    @State var inputText = ""
    
    var body: some View {
        VStack(content: {
            HStack(content: {
                Text("보낸 내용")
                Spacer()
            })
            
            TextEditor(text: $enteredText)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)
                .foregroundStyle(.black).bold()
                .colorMultiply(.gray.opacity(0.7))
                .clipShape(.rect(cornerRadius: 15))
                .disabled(true)
                .padding()
            
            HStack(content: {
                Text("메세지")
                Spacer()
            })
            
            TextField("문자 입력", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .frame(width: 320)
                .multilineTextAlignment(.leading)
                .keyboardType(.default)
                .focused($isTextFieldFocused)
            
            
            HStack(spacing: 50, content: {
                Button("보내기", action: {
                    if inputText.trimmingCharacters(in: .whitespaces) != ""{
                        enteredText += "\(inputText) \n"
                        inputText = ""
                        isTextFieldFocused = false
                    }
                })
                
                Button("Emoji", action: {
                    inputText += "🥸"
                })
            })
            
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
