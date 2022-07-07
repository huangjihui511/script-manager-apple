//
//  ScriptDetailsView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptDetailView: View {
    @Binding var script: Script?
    var index: Int? {
        if script != nil {
            return modelData.getScriptIndex(scriptId: script!.id)
        }
        return nil
    }
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        VStack {
            if index != nil {
                ScrollView {
                    HStack {
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("Raw Script Text:")
                                    .font(.headline)
                                    .padding(/*@START_MENU_TOKEN@*/[.top, .trailing]/*@END_MENU_TOKEN@*/)
                                TextEditor(text: $modelData.scripts[index!].script)
                                    .font(.body)
                                    .frame(height: 50, alignment: .leading)
                                    .padding(.vertical)
                                
                                Divider()
                                Text("Settings:")
                                    .font(.headline)
                                    .padding([.top, .trailing])
                                Toggle("Is Favorite", isOn: $modelData.scripts[modelData.getScriptIndex(scriptId: script!.id)!].isFavorite)
                                    .toggleStyle(.switch)
                                    .padding([.top, .bottom, .trailing])
                                
                                Divider()
                            }
                            VStack(alignment: .leading){
                                Text("About:")
                                    .font(.headline)
                                    .padding([.top, .bottom, .trailing])
                                Text("ID")
                                Text(script!.id)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .padding(.vertical)
                                Text("Created Time")
                                Text(timeIntervalChangeToTimeStr(timeInterval: script!.createdAt, dateFormat: nil))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .padding(.vertical)
//                                Text("Updated Time")
//                                Text(timeIntervalChangeToTimeStr(timeInterval: script!.updatedAt, dateFormat: nil))
//                                    .font(.caption)
//                                    .foregroundColor(.secondary)
//                                    .padding(.vertical)
                                Text("Used Time")
                                Text(timeIntervalChangeToTimeStr(timeInterval: script!.lastUsedAt, dateFormat: nil))
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .padding(.vertical)
                            }
                            Divider()
                            ReferenceView()
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                    }
                }
            }
            else {
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Hello!")
                            .font(.largeTitle)
                        
                        Divider()
                        ReferenceView()
                        Spacer()
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    Spacer()
                        
                }
                
            }
        }
        .toolbar {
            ToolbarItemGroup{
                Button {
                    _ = modelData.addScript(script: "[NEW] echo hello-world")
                } label: {
                    Label("add", systemImage: "plus.square.on.square")
                }
                Button {
                    modelData.deleteScript(id: script!.id)
                } label: {
                    Label("delete", systemImage: "trash")
                }
            }
            
            
        }
    }
}
//
//struct ScriptDetailView_Previews: PreviewProvider {
//    static var scripts = ModelData().scripts
//    
//    static var previews: some View {
//        Group {
//            ScriptDetailView(script: scripts[2])
//                .environmentObject(ModelData())
//            ScriptDetailView(script: nil)
//                .environmentObject(ModelData())
//        }
//        
//    }
//}
