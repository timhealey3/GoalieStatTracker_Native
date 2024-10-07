//
//  statsHelper.swift
//  goalieStatTracker
//
//  Created by Tim Healey on 10/6/24.
//

import Foundation

class statsHelper : ObservableObject {
    // init var
    @Published var goals: Float = 0
    @Published var shots: Float = 0
    @Published var gamesPlayed: Int = 0
    @Published var minutes: Float = 0
    @Published var gamesStarted: Int = 0
    @Published var wins: Int = 0
    @Published var loss: Int = 0
    @Published var ties: Int = 0
    
    // maybe allow someone to change this?
    func calcGAA() -> Float {
        return (goals * 60) / minutes
    }
    
    func calcSaves() -> Float {
        return goals - shots
    }
    
    func calcSV() -> Float {
        return calcSaves() / shots
    }
    
    
}
