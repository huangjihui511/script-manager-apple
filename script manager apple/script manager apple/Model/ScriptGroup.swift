//
//  Grouper.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/9.
//

import Foundation

struct ScriptsGroup: CaseIterable, Identifiable, Hashable {
    
    static var allCases :[ScriptsGroup] {
        var result = ModelData.instance!.scriptGroups.keys.map{(k)->ScriptsGroup in ScriptsGroup(id: k) }
        result.append(ScriptsGroup(id: "all"))
        result = result.sorted { s1, s2 in
            s1.id < s2.id
        }
        return result
    }
    
    var id: String
    
    
    
}
