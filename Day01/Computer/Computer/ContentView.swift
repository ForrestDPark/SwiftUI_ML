//
//  ContentView.swift
//  Computer
//
//  Created by Kenny Hahn on 5/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var productName = ""
    @State var screenSize = ""
    @State var weight = ""
    @State var bag = ""
    @State var color = ""
    @State var pName = "제품명"
    
    var body: some View {
        VStack(spacing: 10, content: {
            Text(pName)
                .bold()
                .padding(50)
            
            Spacer()
            
            HStack(spacing: 10,content: {
                Text("제품명 :")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("제품명을 입력 하세요", text: $productName)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })

            HStack(spacing: 10,content: {
                Text("화면 크기 :")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("화면크기를 입력 하세요", text: $screenSize)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })

            HStack(spacing: 10,content: {
                Text("무게 :")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("무게를 입력 하세요", text: $weight)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })

            HStack(spacing: 10,content: {
                Text("가방 :")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("가방유무를 입력 하세요", text: $bag)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })

            HStack(spacing: 10,content: {
                Text("색상 :")
                    .frame(minWidth: 80, alignment: .leading)
                TextField("색상을 입력 하세요", text: $color)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 200)
            })
            .padding(.bottom, 50)
            
            Spacer()

            Button("OK", action: {
                let productName_T: String = "맥북프로"
                let screenSize_T: Int = 16
                let weight_T: Double = 2.56
                let bag_T: Bool = false
                let color_T: Character = "백"
                
                productName = productName_T
                screenSize = String(screenSize_T)
                weight = String(weight_T)
                bag = String(bag_T)
                color = String(color_T)
            })
            .padding()
            .frame(width: 100)
            .background(.blue)
            .foregroundStyle(.white)
            .clipShape(.buttonBorder)
            
            Button("Clear", action: {
                productName.removeAll()
                screenSize.removeAll()
                weight.removeAll()
                bag.removeAll()
                color.removeAll()
            })
            .padding()
            .frame(width: 100)
            .foregroundStyle(.red)
            .border(.red, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            
            
            Spacer()
            
        })
        .padding()
        
    } // body
} // Struct

#Preview {
    ContentView()
}
