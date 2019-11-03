//
//  Model.swift
//  ModernApp
//
//  Created by pjechris on 22/09/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import Foundation

enum TalkType: String {
    case rex
    case talk
}

struct Talk {
    let id: Int
    let title: String
    let description: String
    let type: TalkType
    let startDate: Date
    let duration: TimeInterval
    let room: String
    var rating: Int? = 0
    var endDate: Date {
        return startDate.addingTimeInterval(duration)
    }
}
