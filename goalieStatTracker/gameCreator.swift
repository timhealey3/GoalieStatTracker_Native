//
//  gameCreator.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/4/24.
//

import Foundation
import SwiftUI

struct gameCreatorView: View {
    @StateObject var gameCreator = gameCreatorHelper()
    var body: some View {
        TextField(
            "Opponent Name",
            text: $gameCreator.opponent
        ).frame(width: 150)
        Text(gameCreator.opponent)
    }
}
