//
//  ScriptListView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptListView: View {
    
    var filteredScripts: [Script]  {
        modelData.scripts.filter { s in
            s.isFavorite || !showFavoritesOnly
        }
    }
    var index: Int? {
        modelData.scripts.firstIndex(where: { $0.id == selectedScript?.id })
    }
    var detailScript: Script? {
        if filteredScripts.count <= index ?? 0 {
            debugPrint("cant find detail")
            return nil
        }
        return filteredScripts[index ?? 0]
    }
    @State private var selectedScript: Script?
    @State var showFavoritesOnly: Bool = false
    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        
        NavigationView {
            
            List(selection: $selectedScript) {
                ForEach(filteredScripts) { script in
                    NavigationLink {
                        
                        ScriptDetailView(script: detailScript)
                            .onAppear {
                                let index = modelData.getScriptIndex(scriptId: script.id)
                                if index != nil {
                                    modelData.scripts[index!].lastUsedAt = Date().timeIntervalSince1970
                                }
                                writeToClipboard(string: script.script)
                            }
                            .frame(idealWidth: 300, alignment: .leading)
                        
                    } label  : {
                        ScriptRowView(script: script)
                        
                        
                    }
                    .tag(script)
                    
                    
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
            ScriptDetailView(script: selectedScript)
            
        }
        .navigationTitle("Informations")
        
        
        
    }
    
}

struct ScriptListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ScriptListView()
            .environmentObject(ModelData())
    }
}

