//
//  ContentView.swift
//  ButtonName3
//
//  Created by Kenny on 1/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var emoji = "😀"
    
    var body: some View {
        VStack(content: {
            Spacer()
            
            Text(emoji)
                .font(.title)
                .multilineTextAlignment(.center) // 가운데 정렬
            
            Spacer()
            
            HStack(content: {
                Button("😀", action: {
                    emoji += "😀"
                })
                .padding()
                .border(.blue, width: 2)
                
                Button("🥰", action: {
                    emoji += "🥰"
                })
                .padding()
                .border(.blue, width: 2)

                Button("🤓", action: {
                    emoji += "🤓"
                })
                .padding()
                .border(.blue, width: 2)

            })
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
