//
//  ScriptDetailsView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptDetailsView: View {
    var script: Script
    @Binding var isEdit: Bool
    @EnvironmentObject var modelData: ModelData
    
    var scriptIndex: Int {
        modelData.scripts.firstIndex(where: { $0.id == script.id })!
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ScriptDetailView(name: "id", value: $modelData.scripts[scriptIndex].id, isEdit: $isEdit, canEdit: false)
                ScriptDetailView(name: "raw script text", value: $modelData.scripts[scriptIndex].script, isEdit: $isEdit, canEdit: true)
                //                ScriptDetailView(name: "is favorite", value: .constant(String(script.isFavorite)), isEdit: $isEdit, canEdit: false)
                ScriptDetailView(name: "updated time", value: .constant( timeIntervalChangeToTimeStr(timeInterval: script.updateAt, dateFormat: nil)),isEdit: $isEdit, canEdit: false)
                ScriptDetailView(name: "last used time", value: .constant( timeIntervalChangeToTimeStr(timeInterval: script.lastUsedAt, dateFormat: nil)),isEdit: $isEdit, canEdit: false)
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Spacer()
        }
    }
}

struct ScriptDetailsView_Previews: PreviewProvider {
    static var scripts = ModelData().scripts
    
    static var previews: some View {
        ScriptDetailsView(script: scripts[2], isEdit: .constant(false))
            .environmentObject(ModelData())
    }
}
