//
//  script_manager_appleApp.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI
import AppKit

@main
struct ScriptManagerApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ScriptListView()
                .environmentObject(modelData)
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.willTerminateNotification), perform: {
                    _ in
                    modelData.syncScripts()
                })
        }
        
        //        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
        //            print("active")
        //        }
    }
    
}
