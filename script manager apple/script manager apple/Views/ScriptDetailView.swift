//
//  ScriptDetailView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptDetailView: View {
    var name: String
    var value: String
    
    var body: some View {
        
        HStack(alignment: .center){
            HStack() {
                Text(name)
                    .font(.body)
                Spacer()
            }
            .frame(width: 130,alignment: .leading)
            HStack {
                Text(":")
                    .font(.body)
                    .foregroundColor(Color.gray)

                Text(value)
                    .font(.body)
                    .foregroundColor(Color.gray)
                
                Spacer()
            }
            .frame(minWidth: 150, alignment: .leading)
            
        }
        .padding(.vertical)
        
    }
}
//
//struct ScriptDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ScriptDetailView(name: "name", value: .constant("value"), isEdit: .constant(true), canEdit: true)
//                .frame(width: 400.0)
//            ScriptDetailView(name: "name", value: .constant("value"), isEdit: .constant(true), canEdit: true)
//                .frame(width: 300.0)
//        }
//
//    }
//}
