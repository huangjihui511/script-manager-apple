//
//  ReferenceView.swift
//  script manager apple
//
//  Created by 黄继辉 on 2022/7/8.
//

import SwiftUI

struct ReferenceView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Referance:")
                .font(.headline)
                .padding([.top, .bottom, .trailing])
            Text("Feedback")
            Link("github",
                 destination: URL(string: "https://github.com/huangjihui511/script-manager-apple")!)
            .font(.caption)
            .foregroundColor(.blue)
            .padding(.vertical)
            Text("Learn")
            Link("documents",
                 destination: URL(string: "https://developer.apple.com")!)
            .font(.caption)
            .foregroundColor(.blue)
            .padding(.vertical)
        }
    }
}

struct ReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        ReferenceView()
    }
}
