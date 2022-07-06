//
//  ScriptDetailsView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptDetailView: View {
    var script: Script
    @EnvironmentObject var modelData: ModelData
    
    func afterEdit() {
        modelData.scripts[modelData.getScriptIndex(scriptId: script.id)!].updateAt = Date().timeIntervalSince1970
    }
    
    var body: some View {
        if modelData.getScriptIndex(scriptId: script.id) != nil {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Raw Script Text:")
                                .font(.headline)
                                .padding(/*@START_MENU_TOKEN@*/[.top, .trailing]/*@END_MENU_TOKEN@*/)
                            TextEditor(text: $modelData.scripts[modelData.getScriptIndex(scriptId: script.id)!].script)
                                .font(.body)
                                .onSubmit {
                                    afterEdit()
                                }
                                .frame(height: 50, alignment: .leading)
                                .padding(.vertical)
                            
                            Divider()
                            Text("Settings:")
                                .font(.headline)
                                .padding([.top, .trailing])
                            Toggle("Is Favorite", isOn: $modelData.scripts[modelData.getScriptIndex(scriptId: script.id)!].isFavorite)
                                .toggleStyle(.switch)
                                .onSubmit {
                                    afterEdit()
                                }
                                .padding([.top, .bottom, .trailing])
                            
                            Divider()
                        }
                        VStack(alignment: .leading){
                            Text("About:")
                                .font(.headline)
                                .padding([.top, .bottom, .trailing])
                            Text("Created Time (id)")
                            Text(script.id)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.vertical)
                            Text("Updated Time")
                            Text(timeIntervalChangeToTimeStr(timeInterval: script.updateAt, dateFormat: nil))
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.vertical)
                            Text("Used Time")
                            Text(timeIntervalChangeToTimeStr(timeInterval: script.lastUsedAt, dateFormat: nil))
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                                .padding(.vertical)
                        }
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                }
            }
            .toolbar {
                ToolbarItemGroup{
                    Button {
                        _ = modelData.addScript(script: "[NEW] echo hello-world")
                        debugPrint(modelData.scripts)
                    } label: {
                        Label("add", systemImage: "plus.square.on.square")
                    }
                    Button {
                        modelData.deleteScript(id: script.id)
                        debugPrint(modelData.scripts)
                    } label: {
                        Label("delete", systemImage: "trash")
                    }
                }
            }
        }
           
        
        
    }
}

struct ScriptDetailView_Previews: PreviewProvider {
    static var scripts = ModelData().scripts
    
    static var previews: some View {
        ScriptDetailView(script: scripts[2])
            .environmentObject(ModelData())
    }
}
