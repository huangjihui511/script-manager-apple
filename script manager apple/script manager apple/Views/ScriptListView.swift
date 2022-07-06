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
            s.isFavorite || !showFavoritesOnly
        }
        .reversed()
    }
    @State var showFavoritesOnly: Bool = false
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        NavigationView {
            List(scriptsSelected) { script in
                NavigationLink {
                    if modelData.getScriptIndex(scriptId: script.id) != nil  {
                        ScriptDetailView(script: script)
                            .frame(minWidth: 400, idealWidth: 300, alignment: .leading)
                            .onAppear {
                                let index = modelData.getScriptIndex(scriptId: script.id)
                                if index != nil {
                                    modelData.scripts[index!].lastUsedAt = Date().timeIntervalSince1970
                                }
                                writeToClipboard(string: script.script)

                                
                            }
                    }
                } label  : {
                    VStack(alignment: .trailing) {
                        ScriptRowView(script: script)
//                        if script.id == selectedId {
//                            Text("Copied")
//                                .font(.footnote)
//                                .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
//                        }
                    }
                    
                }
                
            }
            .toolbar {
                ToolbarItemGroup {
                    Spacer()

                    Menu {
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("filter", systemImage: "line.3.horizontal.decrease.circle")
                    }
                    
                }
            }
            .frame(minWidth: 300, idealWidth: 200, alignment: .leading)
        }
        .navigationTitle("Details Infos")
    }
    
}

struct ScriptListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScriptListView()
            .environmentObject(ModelData())
    }
}

