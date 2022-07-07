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
    
    init() {
        scripts = ModelData.loadScriptsDB()
    }
    
    func addScript(script:String) -> Script {
        let id =  UUID().uuidString
        let createdAt = Date().timeIntervalSince1970
        let newScript = Script(id: id, script:script, createdAt: createdAt, updatedAt: createdAt, lastUsedAt: Date().timeIntervalSince1970, isFavorite: false)
        
        scripts.append(newScript)
        ModelData.saveScriptsDB(scripts: scripts)
        objectWillChange.send()
        return newScript
    }
    
    func deleteScript(id: String) {
        let index  = getScriptIndex(scriptId: id)
        if index != nil {
            scripts.remove(at: index!)
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
                    fatalError("error: \(error)")
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
