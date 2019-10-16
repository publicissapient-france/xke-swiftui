//
//  Room.swift
//  ModernApp
//
//  Created by pjechris on 05/10/2019.
//  Copyright © 2019 Xebia. All rights reserved.
//

import Foundation
import SwiftUI

struct Room: View {
    let name: String

    var body: some View {
        HStack(spacing: 2) {
            Image("picto-location")
            Text(name)
        }
    }
}

struct Room_Previews: PreviewProvider {
    static var previews: some View {
        Room(name: "War room")
    }
}
