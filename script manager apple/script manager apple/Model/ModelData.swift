//
//  ModelData.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation
import SwiftUI
import AppKit

final  class ModelData: ObservableObject {
    
    @Published var scripts:[Script] = loadScriptsDB()
    
    func addScript(script:String) -> Script {
        let id =  UUID().uuidString
        let createdAt = Date().timeIntervalSince1970
        let newScript = Script(id: id, script:script, createdAt: createdAt, updatedAt: createdAt, lastUsedAt: Date().timeIntervalSince1970, isFavorite: false)
        
        scripts.append(newScript)
        saveScriptsDB(scripts: scripts)
        objectWillChange.send()
        return newScript
    }
    
    func deleteScript(id: String) {
        let index  = getScriptIndex(scriptId: id)
        if index != nil {
            scripts.remove(at: index!)
            self.objectWillChange.send()
        }
        saveScriptsDB(scripts: scripts)
    }
    
    func getScriptIndex(scriptId:String) -> Optional<Int> {
        return scripts.firstIndex(where: { $0.id == scriptId })
    }
}

func loadScripts() ->[Script]  {
    let now = Date().timeIntervalSince1970
    return [Script](arrayLiteral:
                        Script(id: "0", script: "git merge origin/master",createdAt: now, updatedAt: now, lastUsedAt: now, isFavorite: true)
                    ,Script(id: "1", script: "az login --use-device-code",createdAt: now, updatedAt:now, lastUsedAt:now, isFavorite: true)
                    ,Script(id: "2", script: "make render-control-plane-chart-snapshots && make generate-helm-fixtures",createdAt: now, updatedAt: now, lastUsedAt:now, isFavorite: true)
                    ,Script(id: "3", script: "test",createdAt: now, updatedAt: now, lastUsedAt:now, isFavorite: true)
    )
}

let scriptsKey = "scriptsKey"

func loadScriptsDB() -> [Script] {
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

func saveScriptsDB(scripts: [Script]) {
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
