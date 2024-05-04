//
//  ContentView.swift
//  EmojiTest
//
//  Created by Kenny Hahn on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var arrNumber = ["10", "20", "25", "31", "42", "53"]
    @State var dispNumber = ""
    @State var indexState = 0
    @State var dispArr = ""
    
    var body: some View {
        VStack(content: {
            Text(dispArr)
                .padding()
            
            Text(dispNumber)
                .bold()
                .font(.system(size: 50))
            
            Button("Next", action: {
                nextData()
            })
            .padding()
            
        }) // VStack
        .padding()
        .onAppear(perform: {
            dispNumber = arrNumber[indexState]
            
            for i in arrNumber{
                if i == arrNumber[arrNumber.count - 1]{
                    dispArr += i
                }else{
                    dispArr += i + ","
                }
                
            }
        })
        
    } // body
    
    // --- Functions ---
    func nextData(){
        indexState += 1
        if indexState >= arrNumber.count{
            indexState = 0
        }
        dispNumber = arrNumber[indexState]
    }
    
} // ContentView

#Preview {
    ContentView()
}
