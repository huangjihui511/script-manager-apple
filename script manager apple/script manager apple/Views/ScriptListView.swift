//
//  ScriptListView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptListView: View {
    @EnvironmentObject var modelData: ModelData
    
    var scripts:[script] {
        modelData.scriptsMap.flatMap { (key: String, value: [script]) in
            value
        }
    }

    var body: some View {
       List(scripts) { script in
           Text(script.id)
       }
    }
}

struct ScriptListView_Previews: PreviewProvider {
    static var previews: some View {
        ScriptListView().environmentObject(ModelData())
    }
}
