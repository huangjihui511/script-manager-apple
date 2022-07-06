//
//  ScriptListView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptListView: View {
    
    var scriptsSelected: [Script]  {
        modelData.scripts.filter { s in
            s.isFavorite
        }
        .reversed()
    }
    @State var showFavoritesOnly: Bool = false
    @State var copiedId: String = ""
    @State var isEdit: Bool = false
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        NavigationView {
            List(scriptsSelected) { script in
                NavigationLink {
                    ScriptDetailView(script: script, isEdit: $isEdit)
                        .frame(minWidth: 300, idealWidth: 300, alignment: .leading)
                        .onAppear {
                            writeToClipboard(string: script.script)
                            let index = modelData.getScriptIndex(scriptId: copiedId)
                            if index != nil {
                                modelData.scripts[index!].lastUsedAt = Date().timeIntervalSince1970
                            }
                            copiedId = script.id
                            isEdit = false
                        }
                } label  : {
                    VStack(alignment: .trailing) {
                        ScriptRowView(script: script)
                        if script.id == copiedId {
                            Text("Copied")
                                .font(.footnote)
                                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .navigationSubtitle("details")
                
            }
            .navigationTitle("Lists")
            .toolbar {
                ToolbarItemGroup {
                    Menu {
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("filter", systemImage: "camera.filters")
                    }
                    Button {
                        let newId = timeIntervalChangeToTimeStr(timeInterval: Date().timeIntervalSince1970, dateFormat: nil)
                        modelData.scripts.append(Script(id: newId, script: "[NEW] echo hello-world", updateAt: Date().timeIntervalSince1970, lastUsedAt: Date().timeIntervalSince1970, isFavorite: false))
                    } label: {
                        Label("add", systemImage: "plus.square.on.square")
                    }
                    Spacer()
                }
            }
            .frame(minWidth: 200, idealWidth: 200, alignment: .leading)
        }
        .navigationTitle("Details")
    }
    
}

struct ScriptListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScriptListView()
            .environmentObject(ModelData())
    }
}

