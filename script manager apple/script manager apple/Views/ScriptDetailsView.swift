//
//  ScriptDetailsView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptDetailsView: View {
    var script: Script
    @Binding var isEdit: Bool
    @EnvironmentObject var modelData: ModelData
    
    func afterEdit() {
        modelData.scripts[modelData.getScriptIndex(scriptId: script.id)!].updateAt = Date().timeIntervalSince1970
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Raw script text:")
                    .font(.headline)
                    .padding(/*@START_MENU_TOKEN@*/[.top, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                TextEditor(text: $modelData.scripts[modelData.getScriptIndex(scriptId: script.id)!].script)
                    .font(.body)
                    .onSubmit {
                        afterEdit()
                    }
                    .frame(height: 50, alignment: .leading)
                Divider()
                Text("Settings:")
                    .font(.headline)
                    .padding([.top, .bottom, .trailing])
                Toggle("Is favorite", isOn: $modelData.scripts[modelData.getScriptIndex(scriptId: script.id)!].isFavorite)
                    .toggleStyle(.switch)
                    .onSubmit {
                        afterEdit()
                    }
                Divider()
                Text("More detail...")
                    .font(.headline)
                    .padding(.vertical)
                    
                ScriptDetailView(name: "Created Time (id)", value: modelData.scripts[modelData.getScriptIndex(scriptId: script.id)!].id)
                ScriptDetailView(name: "Updated Time", value:  timeIntervalChangeToTimeStr(timeInterval: script.updateAt, dateFormat: nil))
                ScriptDetailView(name: "Used Time", value:  timeIntervalChangeToTimeStr(timeInterval: script.lastUsedAt, dateFormat: nil))
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Spacer()
        }
    }
}

struct ScriptDetailsView_Previews: PreviewProvider {
    static var scripts = ModelData().scripts
    
    static var previews: some View {
        ScriptDetailsView(script: scripts[2], isEdit: .constant(false))
            .environmentObject(ModelData())
    }
}
