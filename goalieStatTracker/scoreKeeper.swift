//
//  scoreKeeper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/26/24.
//

import Foundation
import SwiftUI
import SwiftData

struct scoreKeeperView: View {
    let opponent: String
    @Query private var games: [Game]
    @Environment(\.modelContext) private var context
    @StateObject var scoreKeeper = scoreKeeperHelper()
    @State private var newDate = Date.now
    
    var body: some View {
        
        VStack {
            VStack {
                Picker("Period", selection: $scoreKeeper.currentPeriodsVar) {
                    ForEach(Periods.allCases) { period in
                        Text(period.rawValue.capitalized)
                    }
                }
                Spacer()
            }
            .pickerStyle(.segmented)
            Text("Advanced Score Keeper")
            TextField(
                "Opponent Name",
                text: $scoreKeeper.opponent
            ).frame(width: 150)
            Text(scoreKeeper.opponent)
            // Shots
            HStack {
                Button(action: {scoreKeeper.subtractShot()}
                ) {
                    Label("Shots \(scoreKeeper.getShots())", systemImage: "minus.circle")
                }
                Button(action: {scoreKeeper.addShot()}) {
                    Label("", systemImage: "plus.circle")
                }
            }
            // Goals
            HStack {
                Button(action: {scoreKeeper.subtractGoal()}) {
                    Label("Goals \(scoreKeeper.getGoals())", systemImage: "minus.circle")
                }
                Button(action: {scoreKeeper.addGoal()}) {
                    Label("", systemImage: "plus.circle")
                }
            }
            
            VStack {
                Picker("Game Outcome", selection: $scoreKeeper.gameOutcomeVar) {
                    ForEach(GameOutcome.allCases) { outcomes in
                        Text(outcomes.rawValue.capitalized)
                    }
                }
                Picker("Game Outcome OT", selection: $scoreKeeper.gameOutcomeOTVar) {
                    ForEach(GameOutcomeOT.allCases) { outcomesOT in
                        Text(outcomesOT.rawValue.capitalized)
                    }
                }
            }
            .pickerStyle(.segmented)

            
            Button("Save") {
// todo change this for first/secnd/third vars
                let newGame = Game(id: games.count + 1, opponentID: scoreKeeper.opponentID, gameDate: newDate, goals: scoreKeeper.firstGoals, goalCord: scoreKeeper.GoalCords, goalType: scoreKeeper.shotType, shots: scoreKeeper.firstShots, shotCord: scoreKeeper.ShotCords, shutOut: scoreKeeper.isShutOut(), gameState: scoreKeeper.getgameState(), overTime: scoreKeeper.OtInd, shootOut: scoreKeeper.ShootoutInd, notes: scoreKeeper.Notes)
                context.insert(newGame)
                newDate = .now
            }
        }
        navBar()
        .navigationTitle("Adv. Score Keeper")
    }
}

struct scoreKeeperPreview: PreviewProvider {
    static var previews: some View {
        let opponent = "some team"
        scoreKeeperView(opponent: opponent)
            .modelContainer(for: Game.self, inMemory: true)
    }
}
