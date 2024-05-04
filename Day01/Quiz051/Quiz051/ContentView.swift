//
//  ContentView.swift
//  Quiz051
//
//  Created by Kenny on 1/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var lampWidth: [CGFloat] = [320.0, 130.0]
    @State var lampHeight: [CGFloat] = [500.0, 200.0]
    @State var imageLamp: [String] = ["lamp_on", "lamp_off"]
    @State var imageLargeSmallSeq: Int = 1
    @State var toggleStatus: Bool = true
    @State var toggleEnlarge: Bool = false
    
    var body: some View {
        VStack(content: {
            Image(toggleStatus ? imageLamp[0] : imageLamp[1])
                .resizable()
                .frame(width: lampWidth[imageLargeSmallSeq], height: lampHeight[imageLargeSmallSeq])
                .fixedSize()
                .padding(.bottom, 100)
                .frame(width: 400, height: 550) // VStack에 크기 고정
            
            HStack(content: {
                VStack(content: {
                    Text("전구 확대")
                    Toggle("", isOn: $toggleEnlarge)
                        .labelsHidden()
                        .onChange(of: toggleEnlarge, {
                            confirmEnlarge()
                        })
                })
                .padding()
                
                VStack(content: {
                    Text("전구 스위치")
                    Toggle("", isOn: $toggleStatus)
                        .labelsHidden()
                })
                .padding()
            })
        })
        .padding()
    }
    
    // --- Functions ---
    func confirmEnlarge(){
        if toggleEnlarge{
            imageLargeSmallSeq = 0
        }else{
            imageLargeSmallSeq = 1
        }
    }
}

#Preview {
    ContentView()
}
