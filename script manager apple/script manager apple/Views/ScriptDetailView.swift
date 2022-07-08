//
//  ScriptDetailsView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptDetailView: View {
    var script: Script?
    var index: Int? {
        if script != nil {
            return modelData.getScriptIndex(scriptId: script!.id)
        }
        return nil
    }
    @EnvironmentObject var modelData: ModelData
    @State var showAddPop: Bool = false
    @State var inputContent : String = "new"
    
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
                                Toggle("Is Favorite", isOn: $modelData.scripts[index!].isFavorite)
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
                                Text("Usage Count")
                                Text("\(script!.usageCount)")
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
                    showAddPop = true
                } label: {
                    Label("add", systemImage: "plus.square.on.square")
                }
                .popover(isPresented: $showAddPop, arrowEdge: .bottom) {
                    ScriptAddView(inputContent: $inputContent)
                }
                if script != nil {
                    if !script!.isDeleted {
                        Button {
                            modelData.deleteScript(id: script!.id, isDeleted: true)
                        } label: {
                            Label("delete", systemImage: "trash")
                        }
                    }
                    else {
                        Button {
                            modelData.deleteScript(id: script!.id, isDeleted: false)
                        } label: {
                            Label("back", systemImage: "arrow.uturn.down")
                        }
                    }
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
