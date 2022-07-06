//
//  ScriptDetailView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/5.
//

import SwiftUI

struct ScriptDetailView: View {
    var name: String
    @Binding var value: String
    @Binding var isEdit: Bool
  
    var canEdit: Bool
    
    var body: some View {
        
        HStack(alignment: .top){
            HStack {
                Text(name)
                    .font(.headline)
                    .fontWeight(.bold)
                Spacer()
            }
            .frame(width: 110,alignment: .leading)
            HStack {
                Text(":")
                    .font(.headline)
                    .fontWeight(.bold)
                if isEdit && canEdit {
                    TextField("value", text: $value)
                } else {
                    Text(value)
                        .font(.body)
                }
                Spacer()
            }
            .frame(minWidth: 150, alignment: .leading)

        }
        .padding(.bottom)
        
    }
}

struct ScriptDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ScriptDetailView(name: "name", value: .constant("value"), isEdit: .constant(true), canEdit: true)
                .frame(width: 400.0)
            ScriptDetailView(name: "name", value: .constant("value"), isEdit: .constant(true), canEdit: true)
                .frame(width: 300.0)
        }
       
    }
}
