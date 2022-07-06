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
            HStack {
                if script.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
            Text(script.script)
                .lineLimit(10)
                .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)

            Spacer()
        }
        .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
        .frame(minWidth: 200, alignment: .leading)
    }
}
//
//struct ScriptRowView_Previews: PreviewProvider {
//    static var scripts = ModelData().scripts
//
//    static var previews: some View {
//        Group {
//            ScriptRowView(script: scripts[0], isFavorite: .constant(true))
//            ScriptRowView(script: scripts[1], isFavorite: .constant(true))
//            ScriptRowView(script: scripts[2], isFavorite: .constant(false))
//        }
//        .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
//    }
//}
