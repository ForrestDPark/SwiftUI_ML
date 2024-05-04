//
//  ContentView.swift
//  Quiz01
//
//  Created by Kenny on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isMessage = false
    
    var body: some View {
        VStack(content: {
            Spacer()
            
            Text(isMessage ? "Welcome! Kenny" : "Welcome!")
            
            Spacer()
            
            Button("Name", action: {
                isMessage.toggle()
            })
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
