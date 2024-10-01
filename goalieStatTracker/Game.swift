//
//  Game.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/29/24.
//

import Foundation
import SwiftData

enum ShotType {
    case breakAway
    case TwoOnOne
    case rebound
    case wristShot
    case slapShot
    case deflection
    case wrapAround
    case ownGoal
    case other
}

enum GameState {
    case win
    case lose
    case tie
}

@Model
class Game {
    let id: Int
    let opponent: String
    let gameDate: Date
    let goals: Int
    let goalCord: [[Float]]
    let goalType: [[ShotType]]
    let shots: [[Int]]
    let shotCord: [[Float]]
    let shutOut: Bool
    let gameState: GameState
    let overTime: Bool
    let shootOut: Bool
    let notes: String
    
    init(id: Int, opponent: String, gameDate: Date, goals: Int, goalCord: [[Float]], goalType: [[ShotType]], shots: [[Int]], shotCord: [[Float]], shutOut: Bool, gameState: GameState, overTime: Bool, shootOut: Bool, notes: String) {
        self.id = id
        self.opponent = opponent
        self.gameDate = gameDate
        self.goals = goals
        self.goalCord = goalCord
        self.goalType = goalType
        self.shots = shots
        self.shotCord = shotCord
        self.shutOut = shutOut
        self.gameState = gameState
        self.overTime = overTime
        self.shootOut = shootOut
        self.notes = notes
    }
}
