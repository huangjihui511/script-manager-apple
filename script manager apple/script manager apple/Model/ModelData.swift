//
//  ModelData.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    
    var scripts:[Script] = load()
}

func load() ->[Script]  {
    let now = Date().timeIntervalSince1970
    return [Script](arrayLiteral:
                        Script(id: "0", script: "merge origin/master", createdAt: now, lastUsedAt: now, isFavorite: true)
                    ,Script(id: "1", script: "az login --use-device-code", createdAt:now, lastUsedAt:now, isFavorite: true)
                    ,Script(id: "2", script: "make render-control-plane-chart-snapshots && make generate-helm-fixtures", createdAt: now, lastUsedAt:now, isFavorite: true)
                    ,Script(id: "3", script: "test", createdAt: now, lastUsedAt:now, isFavorite: true)
    )
}
