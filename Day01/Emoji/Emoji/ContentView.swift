//
//  ContentView.swift
//  Emoji
//
//  Created by Kenny on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    @State var indexState = 0
    @State var arrNumber = ["😀", "🤓", "🥰", "😌", "☹️", "🥸"]
    @State var dispNumber = ""
    
    
    var body: some View {
        VStack(content: {
            Text("😀 🤓 🥰 😌 ☹️ 🥸")
                .padding()
            
            Text(dispNumber)
                .bold()
                .font(.system(size: 100))
                .padding()
            
            HStack(spacing: 50,content: {
                Button("Prev", action: {
                    prevData()
                })
                
                Button("Next", action: {
                    nextData()
                })
            })
        })
        .padding()
        .onAppear(perform: {
            dispNumber = arrNumber[0]
        })
    }
    
    // --- Functions ----
    
    func prevData(){
        indexState -= 1
        
        if indexState < 0{
            indexState = arrNumber.count - 1
        }
        
        dispNumber = arrNumber[indexState]
        
    }
    
    func nextData(){
        indexState += 1
        
        if indexState >= arrNumber.count{
            indexState = 0
        }
        
        dispNumber = arrNumber[indexState]

    }

} // End

#Preview {
    ContentView()
}
