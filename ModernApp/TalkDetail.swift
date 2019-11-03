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

    var body: some View {
        VStack {
            HStack {
                //Time(startDate: talk.startDate, endDate: talk.endDate)
                Spacer()
                HStack(spacing: 2) {
                    Image("picto-location")
                    Text(talk.title)
                }
            }
            .font(.caption)

            Text(talk.type.rawValue.uppercased())

            Text(talk.title.uppercased())
                .headline()

            Rating()
        }
        .padding()
    }

    private func Rating() -> some View {
        HStack {
            ForEach (0..<5) { i in
                Button(action: { /* FIXME */ }) {
                    return self.RatingItem(i)
                }
            }
        }
    }

    private func RatingItem(_ index: Int) -> some View {
        let empty = "star"
        let noted = "star.fill"
        let rating = 0 // FIXME

        return Image(systemName: index < rating ? noted : empty)
            .accentColor(Color("tint"))
    }
}

//struct TalkDetail_Previews: PreviewProvider {
//
//    static var previews: some View {
//        TalkDetail(TalkPreview.long)
//    }
//}


private extension Text {
    func headline() -> Self {
        self
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color("tint"))
    }
}
