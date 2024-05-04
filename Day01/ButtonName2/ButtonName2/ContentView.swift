//
//  ContentView.swift
//  ButtonName2
//
//  Created by Kenny on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var smile="😀"
    
    var body: some View {
        VStack(content: {
            Spacer()
            
            Text(smile)
                .font(.title)
            
            Spacer()
            
            Button("Smile", action: {
                smile += "😀"
            })
            
            Spacer()
        })
    }
}

#Preview {
    ContentView()
}
