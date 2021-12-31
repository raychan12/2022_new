//
//  SecondView.swift
//  newyear2022
//
//  Created by Lei on 2022/01/01.
//

import SwiftUI

struct SecondView: View {
    @State var customText = ""
    @State var onEdit = false
    @AppStorage("customText") var savedCustomText = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            TextField("好きな漢字 2 文字を入力してください", text: $customText, onEditingChanged: {_ in
                self.onEdit = true
            })
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .shadow(color: onEdit ? .blue : .clear, radius: 3)
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Text("戻る")
                        .foregroundColor(Color.gray)
                        .padding()
                        .background(Color.white)
                        .overlay(
                            Rectangle()
                                .stroke(Color.gray)
                        )
                }
                Button(action: {
                    savedCustomText = customText
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("適用")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(customText.count == 2 ? .blue : .gray)
                        .disabled(customText.count != 2)
                }
            }
        }
    }
}
