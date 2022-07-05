//
//  Script.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation

struct script: Hashable, Codable, Identifiable {
    var id: String{
        script
    }
    var script: String
    var createdAt: Int64
    var lastUsedAt: Int64
    var isFavorite: Bool
}
