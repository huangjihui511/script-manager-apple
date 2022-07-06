//
//  ModelData.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    
    var scripts:[Script] = loadScripts()
    
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
