//
//  ContentView.swift
//  TextName
//
//  Created by Kenny on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var message = "Welcome!"
    @State var name = ""
    
    var body: some View {
        VStack(content: {
            Text(message)
            
            HStack(content: {
                Text("Name :")
                    .padding()
                
                TextField("이름을 입력하세요", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
                
            })
            .padding()
            
            HStack(spacing: 50, content: {
                Button("Send", action: {
                    message += name
                })
                
                Button("Clear", action: {
                    message = "Welcome!"
                    name = ""
                })
            })
        })
        .padding()
    }
    
}

#Preview {
    ContentView()
}

