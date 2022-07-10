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
        l = l.filter({ s in
            scriptGroupFilter.contains { s1 in
                if s1.id == "all" {
                    return true
                }
                return s1.id == modelData.getScriptGroupName(script: s)
            }
        })
        return l.reversed()
    }
    @State var showFavoritesOnly: Bool = false
    @State var showActiveOnly: Bool = true
    @State var autoCopy: Bool = true
    
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var scriptGroupFilter = ScriptsGroup.allCases
    
    var body: some View {
        
        NavigationView {
            
            List {
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
                        Toggle(isOn: $autoCopy) {
                            Label("Auto Copy", systemImage: "eyeglasses")
                        }
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites Only", systemImage: "star.fill")
                        }
                        Toggle(isOn: $showActiveOnly) {
                            Label("Active Only", systemImage: "star.fill")
                        }
                        Picker("Group", selection: $scriptGroupFilter) {
                            ForEach(ScriptsGroup.allCases) { g in
                                Text(g.id).tag([ScriptsGroup(id:g.id)])
                            }
                        }
                        .pickerStyle(.inline)
                    } label: {
                        Label("filter", systemImage: "line.3.horizontal.decrease.circle")
                    }
                    
                }
            }
            ScriptDetailView(script: nil)
            
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

