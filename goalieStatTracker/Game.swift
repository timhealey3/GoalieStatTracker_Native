//
//  Game.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 9/29/24.
//

import Foundation
import SwiftData


@Model
class Game {
    let id: Int
    let opponentID: Int
    let gameDate: Date
    let goals: Int
    let goalCord: [[Float]]
    let goalType: [String]
    let shots: Int
    let shotCord: [[Float]]
    let shutOut: Bool
    let gameState: Int
    let overTime: Bool
    let shootOut: Bool
    let notes: String
    
    init(id: Int, opponentID: Int, gameDate: Date, goals: Int, goalCord: [[Float]], goalType: [String], shots: Int, shotCord: [[Float]], shutOut: Bool, gameState: Int, overTime: Bool, shootOut: Bool, notes: String) {
        self.id = id
        self.opponentID = opponentID
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
