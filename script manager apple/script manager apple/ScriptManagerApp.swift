//
//  script_manager_appleApp.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

@main
struct ScriptManagerApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ScriptListView()
                .environmentObject(ModelData())
        }
    }
}
