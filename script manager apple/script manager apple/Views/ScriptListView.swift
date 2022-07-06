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
            if showFavoritesOnly == false {
                return true
            }
            return s.isFavorite
        }
    }
    @State var showFavoritesOnly: Bool = false
    @State var copiedId: String = ""
    @State var isEdit: Bool = false
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        NavigationView {
            List(scriptsSelected) { script in
                NavigationLink {
                    HStack {
                        VStack(alignment: .leading) {
                            ScriptDetailsView(script: script, isEdit: $isEdit)
                            Spacer()
                        }
                        Spacer()
                    }
                    .onAppear {
                        writeToClipboard(string: script.script)
                        let index = modelData.scripts.firstIndex(where: { $0.id == copiedId })
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
                        if copiedId.lengthOfBytes(using: .ascii) == 0 {
                            return
                        }
                        isEdit = !isEdit
                        let cachCopiedId = copiedId
                        let index = ModelData().getScriptIndex(scriptId: copiedId)
                        modelData.scripts[index!].updateAt = Date().timeIntervalSince1970
                        copiedId = ""
                        copiedId = cachCopiedId
                        
                    } label: {
                        if !isEdit {
                            Label("edit", systemImage: "pencil.slash")
                        } else {
                            Label("edit", systemImage: "arrow.clockwise.icloud")
                        }
                    }
                    Button {
                        modelData.scripts.append(Script(id: "0", script: "echo hello-world", updateAt: Date().timeIntervalSince1970, lastUsedAt: Date().timeIntervalSince1970, isFavorite: false))
                        copiedId = "0"
                    } label: {
                        Label("add", systemImage: "plus")
                    }
                    Spacer()
                }
            }
            .frame(minWidth: 250, alignment: .leading)
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

