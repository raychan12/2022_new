//
//  ContentView.swift
//  newyear2022
//
//  Created by Lei on 2022/01/01.
//

import SwiftUI

struct ContentView: View {
    @State var showButton = false
    @State var showSheet = false
    @AppStorage("customText") var savedCustomText = "令和"
    
    var body: some View {
        ZStack {
            Text(savedCustomText)
                .font(.custom("TamanegiKaisho-v1.06", size: 350))
                .minimumScaleFactor(0.1)
                .onTapGesture {
                    self.showButton.toggle()
                }
                .padding()
            if showButton {
                Button(action: {
                    showSheet = true
                }){
                    Text("表示を変更する")
                        .font(.largeTitle)
                }
                .sheet(isPresented: $showSheet) {
                    showButton = false
                } content: {
                    SecondView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
