//
//  TalkDetail.swift
//  ModernApp
//
//  Created by pjechris on 27/10/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import SwiftUI

struct TalkDetail: View {
    @Binding var talk: Talk

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
                    Button(action: { self.talk.rating = i + 1 }) {
                        return self.Notation(i, score: self.talk.rating ?? 0)
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

/// Pass a (writable) binding to underlying content
struct BindingData<T, Content: View>: View {
    @State private var data: T
    let content: (Binding<T>) -> Content

    init(_ data: T, @ViewBuilder content: @escaping (Binding<T>) -> Content) {
        self._data = State(initialValue: data)
        self.content = content
    }

    var body: Content {
        content($data)
    }
}

struct TalkDetail_Previews: PreviewProvider {

    static var previews: some View {
        BindingData(TalkPreview.rexType) {
            TalkDetail(talk: $0)
        }
    }
}
