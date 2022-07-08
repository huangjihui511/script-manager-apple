//
//  ScriptAddView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/8.
//

import SwiftUI

struct ScriptAddView: View {
    @Binding var inputContent : String
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("New Script")
                .font(.title)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            TextEditor(text: $inputContent)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: 300.0, height: 100.0)
            Button {
                _ = modelData.addScript(script: inputContent)
                inputContent = ""
            } label: {
                Label("Submit", systemImage: "plus.square.on.square")
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ScriptAddView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptAddView(inputContent: .constant("default"))
    }
}
