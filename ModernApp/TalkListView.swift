//
//  TalkListView.swift
//  ModernApp
//
//  Created by pjechris on 05/10/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import SwiftUI

struct TalkListView: View {
    @State var talks: [Talk]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(talks.indices) { i in
                        NavigationLink(destination: TalkDetail(talk: self.$talks[i])) {
                            TalkRow(talk: self.talks[i])
                        }
                    }
                }
            }
            .background(
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            )
        }
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
