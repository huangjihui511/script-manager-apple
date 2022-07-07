//
//  ScriptFilter.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/8.
//

import Foundation

class ScriptFilter {
    
    static func isFaveriteFilter(scripts: [Script]) -> [Script] {
        scripts.filter { s in
            s.isFavorite
        }
    }
    
    static func notFaveriteFilter(scripts: [Script]) -> [Script] {
        scripts.filter { s in
            !s.isFavorite
        }
    }
    
    static func usedTimeSorter(scripts: [Script]) -> [Script] {
        func cmp(i1: Script, i2: Script)->Bool{
            return i1.lastUsedAt > i2.lastUsedAt
            }
        return scripts.sorted(by: cmp(i1: i2:))
    }
}
