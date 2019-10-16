//
//  PreviewTalk.swift
//  ModernApp
//
//  Created by pjechris on 05/10/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import Foundation

enum TalkPreview {
    static let longTitle = Talk(id: 1,
                                title: "Optimisez la gestion des données et l'utilisation des données analytiques de votre entreprise avec SnowFlake",
                                description: "",
                                type: .talk,
                                startDate: Date(),
                                duration: 30 * 60,
                                room: "Auditorium")

    static let rexType = Talk(id: 2,
                              title: "Migration d'un Datalake vers Google Cloud",
                              description: "",
                              type: .rex,
                              startDate: Date(),
                              duration: 30 * 60,
                              room: "Couloir")
}
