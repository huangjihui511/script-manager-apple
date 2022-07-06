//
//  ModelData.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation
import SwiftUI

final  class ModelData: ObservableObject {
    
    @Published var scripts:[Script] = loadScripts()
    
    func addScript(script:String) -> Script {
        let newId = timeIntervalChangeToTimeStr(timeInterval: Date().timeIntervalSince1970, dateFormat: nil)
        let newScript = Script(id: newId, script:script, updateAt: Date().timeIntervalSince1970, lastUsedAt: Date().timeIntervalSince1970, isFavorite: false)
        
        self.scripts.append(newScript)
        self.objectWillChange.send()
        return newScript
    }
    
    func deleteScript(id: String) {
        let index  = getScriptIndex(scriptId: id)!
        scripts.remove(at: index)
        self.objectWillChange.send()
    }
    
    func getScriptIndex(scriptId:String) -> Optional<Int> {
        return scripts.firstIndex(where: { $0.id == scriptId })
    }
}

func loadScripts() ->[Script]  {
    let now = Date().timeIntervalSince1970
    return [Script](arrayLiteral:
                        Script(id: "0", script: "git merge origin/master", updateAt: now, lastUsedAt: now, isFavorite: true)
                    ,Script(id: "1", script: "az login --use-device-code", updateAt:now, lastUsedAt:now, isFavorite: true)
                    ,Script(id: "2", script: "make render-control-plane-chart-snapshots && make generate-helm-fixtures", updateAt: now, lastUsedAt:now, isFavorite: true)
                    ,Script(id: "3", script: "test", updateAt: now, lastUsedAt:now, isFavorite: true)
    )
}
