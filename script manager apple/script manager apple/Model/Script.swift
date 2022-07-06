//
//  Script.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import Foundation

struct Script: Hashable, Codable, Identifiable {
    var id: String
    var script: String
    var updateAt: Double
    var lastUsedAt: Double
    var isFavorite: Bool
}
