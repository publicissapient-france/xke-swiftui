//
//  TalkListView.swift
//  ModernApp
//
//  Created by pjechris on 05/10/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import SwiftUI

struct TalkListView: View {
    let talks: [Talk]

    var body: some View {
        ScrollView {
            VStack {
                ForEach(talks, id: \.id) {
                    TalkRow(talk: $0)
                        .padding(.horizontal)
                }
            }
        }
        .background(Image("background"))
    }
}

struct TalkListView_Previews: PreviewProvider {
    static var previews: some View {
        TalkListView(talks: [
            TalkPreview.longTitle,
            TalkPreview.rexType
        ])
    }
}
