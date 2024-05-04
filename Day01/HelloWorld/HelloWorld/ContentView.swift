//
//  ContentView.swift
//  HelloWorld
//
//  Created by Kenny Hahn on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World!")
            .font(.system(size: 25))
            .bold()
            .foregroundStyle(.blue)
            .padding()
            .background(.yellow)
            
    }
}

#Preview {
    ContentView()
}
