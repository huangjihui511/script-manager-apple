//
//  ScriptRowView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptRowView: View {
    var script: Script
    
    var body: some View {
        HStack() {
            Text(script.script)
            Spacer()
            if !script.isDeleted {
                if script.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .imageScale(.medium)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                        .imageScale(.medium)
                }
            }
            else {
                if script.isFavorite {
                    Image(systemName: "star.fill")
                        .imageScale(.medium)
                } else {
                    Image(systemName: "star")
                        .imageScale(.medium)
                }
            }
        }
        .frame(height: 30, alignment: .leading)
        .padding(.vertical, 4)
    }
    
}

struct ScriptRowView_Previews: PreviewProvider {
    static var scripts = ModelData().scripts

    static var previews: some View {
        Group {
            ScriptRowView(script: scripts[0])
            ScriptRowView(script: scripts[1])
            ScriptRowView(script: scripts[2])
        }
    }
}
