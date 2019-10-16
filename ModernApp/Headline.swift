//
//  TextStyle.swift
//  ModernApp
//
//  Created by pjechris on 05/10/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import Foundation
import SwiftUI

struct Headline: View {
    private let text: String

    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Text(text.uppercased())
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color("tint"))
            .fixedSize(horizontal: false, vertical: true)
    }
}
