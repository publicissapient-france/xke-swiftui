//
//  Time.swift
//  ModernApp
//
//  Created by pjechris on 05/10/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import Foundation
import SwiftUI

struct Time: View {
    let startDate: Date
    let endDate: Date

    static private var formatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("HH:mm")

        return formatter
    }()

    var body: some View {
        HStack(spacing: 2) {
            Image("picto-time")
            Text(
                Self.formatter.string(from: startDate))
                + Text("-")
                + Text(Self.formatter.string(from: endDate)
            )
        }
    }
}

