//
//  ScriptListView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptListView: View {
    
    var filteredScripts: [Script]  {
        var l = modelData.scripts.filter { s in
            (s.isFavorite || !showFavoritesOnly) && (!s.isDeleted || !showActiveOnly)
        }
        if reversed {
            l = l.reversed()
        }
        return l
    }
    
    var index: Int? {
        modelData.scripts.firstIndex(where: { $0.id == selectedScript?.id })
    }
    
    //    var detailScript: Script? {
    //        if filteredScripts.count <= index ?? 0 {
    //            debugPrint("cant find detail")
    //            return nil
    //        }
    //        return filteredScripts[index ?? 0]
    //    }
    @State var selectedScript: Script?
    @State var lastSelectedScript: Script?
    @State var showFavoritesOnly: Bool = false
    @State var showActiveOnly: Bool = true
    @State var reversed: Bool = true
    @State var autoCopy: Bool = true


    @EnvironmentObject var modelData: ModelData
    
    
    var body: some View {
        
        NavigationView {
            
            List(selection: $selectedScript) {
                ForEach(filteredScripts) { script in
                    NavigationLink {
                        ScriptDetailView(script: script)
                            .onAppear {
                                if autoCopy {
                                    writeToClipboard(string: script.script)
                                }
                            }
                            .frame(idealWidth: 300, alignment: .leading)
                        
                    } label  : {
                        ScriptRowView(script: script)
                        
                    }
                    
                }
            }
            .toolbar {
                ToolbarItemGroup {
                    Toggle(isOn: $autoCopy) {
                        Label("Auto Copy", systemImage: "eyeglasses")
                    }
                    Spacer()
                    
                    Menu {
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                        Toggle(isOn: $showActiveOnly) {
                            Label("Active only", systemImage: "star.fill")
                        }
                        Toggle(isOn: $reversed) {
                            Label("Reversed", systemImage: "star.fill")
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

