//
//  ContentView.swift
//  ButtonName
//
//  Created by Kenny on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var name="Welcome!"
    
    var body: some View {
        VStack(content: {
            Spacer()
            
            Text(name)
                .bold()
            
            Spacer()
            
            HStack(content: {
                Button("Name", action: {
                    name += "Kenny"
                })
                .padding()
                
                Button("Clear", action: {
                    name = "Welcome!"
                })
            })
        })
    }
}

#Preview {
    ContentView()
}
