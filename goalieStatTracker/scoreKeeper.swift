//
//  scoreKeeper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/26/24.
//

import Foundation
import SwiftUI

struct scoreKeeperView: View {
    @StateObject var scoreKeeper = scoreKeeperHelper()
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Score Keeper")
            Button(action: {scoreKeeper.addGoal()}) {
                Label("\(scoreKeeper.currentGoals)", systemImage: "folder.badge.plus")
            }
            Button(action: {scoreKeeper.subGoal()}) {
                Label("\(scoreKeeper.currentGoals)", systemImage: "folder.badge.plus")
            }
        }
        .navigationTitle("Score Keeper")
    }
}
