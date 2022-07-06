//
//  ScriptListView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptListView: View {
    var scripts: [Script] {
        modelData.scripts
    }
    var scriptsSelected: [Script]  {
        scripts.filter { s in
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
                    VStack(alignment: .leading) {
                        ScriptDetailsView(script: script, isEdit: $isEdit)
                        Spacer()
                    }
                    .onAppear {
                        writeToClipboard(string: script.script)
                        copiedId = script.script
                        isEdit = false
                        debugPrint(copiedId)
                    }
                } label  : {
                    VStack(alignment: .trailing) {
                        
                        ScriptRowView(script: script)
                        if script.script == copiedId {
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
                    Spacer()
                    Button {
                        if copiedId.lengthOfBytes(using: .ascii) == 0 {
                            return
                        }
                        isEdit = !isEdit
                        let cachCopiedId = copiedId
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
                        debugPrint("button")
                    } label: {
                        Label("add", systemImage: "plus")
                    }
                }
                
            }
            .frame(minWidth: 200, alignment: .leading)
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

