//
//  Model.swift
//  ModernApp
//
//  Created by pjechris on 22/09/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import Foundation

struct Speaker {
    let avatarURL: URL?
    let firstname: String
    let lastname: String
}

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
    var endDate: Date {
        return startDate.addingTimeInterval(duration)
    }
}

//struct Slot {
//    let talk: Talk
//    let speakers: [Speaker]
//    let date: Date
//    let duration: TimeInterval
//    let room: String
//}
