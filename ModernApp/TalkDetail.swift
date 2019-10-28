//
//  TalkDetail.swift
//  ModernApp
//
//  Created by pjechris on 27/10/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import SwiftUI

struct TalkDetail: View {
    let talk: Talk
    @State var notation: Int? = nil

    var body: some View {
        VStack {
            HStack {
                Time(startDate: talk.startDate,
                     endDate: talk.endDate)
                Spacer()
                Room(name: talk.room)
            }
            .font(.caption)

            Text(talk.type.rawValue.uppercased())

            Text(talk.title.uppercased())
                .headline()

            HStack {
                ForEach (0..<5) { i in
                    Button(action: { self.notation = i + 1 }) {
                        return self.Notation(i, score: self.notation ?? 0)
                    }
                }
            }
        }
        .padding()
    }

    func Notation(_ index: Int, score notation: Int) -> some View {
        let empty = "star"
        let noted = "star.fill"

        return Image(systemName: index < notation ? noted : empty)
            .accentColor(Color("tint"))
    }
}

struct TalkDetail_Previews: PreviewProvider {
    static var previews: some View {
        TalkDetail(talk: TalkPreview.rexType)
    }
}
