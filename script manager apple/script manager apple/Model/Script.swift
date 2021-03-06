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
    var createdAt: Double
    var usageCount: Int
    var isFavorite: Bool
    var isDeleted: Bool
}
