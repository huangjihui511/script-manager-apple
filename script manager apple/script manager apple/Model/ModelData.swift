//
//  ModelData.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation
import SwiftUI

final class ModelData: ObservableObject {
    @Published var scriptsMap: [String:[script]] = loadScripts()
}


func loadScripts() ->[String:[script]]  {
    let scripts = [script](arrayLiteral: script(script: "echo \"Hello World!\"", createdAt: 0, lastUsedAt: 0, isFavorite: false), script(script: "echo \"Hello World!!\"", createdAt: 0, lastUsedAt: 0, isFavorite: false))
    return Dictionary(
        grouping: scripts,
        by:{$0.id}
    )
}
