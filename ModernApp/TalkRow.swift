//
//  TalkView.swift
//  ModernApp
//
//  Created by pjechris on 22/09/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import SwiftUI

struct TalkRow: View {
    let talk: Talk
    
    var body: some View {
        VStack(spacing: 4) {
            header()

            Text(talk.title)
                .headline()
                .multilineTextAlignment(.center)
        }
        .padding(8)
        .cornerRadius(3)
        .background(Color.white)
        .shadow(radius: 10)
    }

    private func header() -> some View {
        HStack {
            Time(startDate: talk.startDate, endDate: talk.endDate)

            Spacer()
            Text(talk.type.rawValue.uppercased())
            Spacer()

            Room(name: talk.room)
        }
        .font(.caption)
    }
}

struct TalkRow_Previews: PreviewProvider {
    static var previews: some View {
        TalkRow(talk: TalkPreview.longTitle)
            .previewLayout(.fixed(width: 480, height: 250))
    }
}
