//
//  ModelData.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation
import SwiftUI
import AppKit

final class ModelData: ObservableObject {
    
    @Published var scripts:[Script]
    
    static var instance : ModelData? = nil
    
    var scriptGroups: [String: [Script]] {
        Dictionary(
            grouping: scripts.filter({ s in
                !s.isDeleted
            }),
            by: { getScriptGroupName(script: $0) }
        )
    }
    
    func getScriptGroupName(script: Script) -> String {
        if script.script == "" {
            return "default"
        }
        return String(script.script.split(separator: " ")[0])
    }
    
    init() {
        scripts = ModelData.loadScriptsDB()
        ModelData.instance = self
    }
    
    func addScript(script:String) -> Script {
        let id =  UUID().uuidString
        let createdAt = Date().timeIntervalSince1970
        let newScript = Script(id: id, script:script, createdAt: createdAt,usageCount: 0, isFavorite: false, isDeleted: false)
        
        scripts.append(newScript)
        ModelData.saveScriptsDB(scripts: scripts)
        objectWillChange.send()
        return newScript
    }
    
    func deleteScript(id: String, isDeleted: Bool) {
        let index  = getScriptIndex(scriptId: id)
        if index != nil {
            scripts[index!].isDeleted = isDeleted
            self.objectWillChange.send()
        }
        syncScripts()
    }
    
    func getScriptIndex(scriptId:String) -> Optional<Int> {
        return scripts.firstIndex(where: { $0.id == scriptId })
    }
    
    
    static let scriptsKey = "scriptsKey"
    
    static private func loadScriptsDB() -> [Script] {
        let da = NSUserDefaultsController().defaults.array(forKey: scriptsKey)
        var result = [Script]()
        if let da1 = (da ?? [Data]()) as? [Data] {
            for d in da1 {
                let decoder = JSONDecoder()
                do {
                    let s = try decoder.decode(Script.self, from: d)
                    result.append(s)
                } catch {
                    continue
                }
            }
        }
        return result
    }
    
    static private func saveScriptsDB(scripts: [Script]) {
        NSUserDefaultsController().defaults.set(scripts.map{
            (s) -> Data in
            let encoder = JSONEncoder()
            do {
                return  try encoder.encode(s)
            } catch {
                fatalError("error: \(error)")
            }
            
        }, forKey: scriptsKey)
    }
    
    func syncScripts() {
        ModelData.saveScriptsDB(scripts: scripts)
    }
}
