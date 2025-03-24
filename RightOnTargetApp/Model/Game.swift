//
//  Game.swift
//  RightOnTargetApp
//
//  Created by OSIIOSdev on 24.03.2025.
//

protocol GameProtocol {
    
    var score: Int { get }
    var currentDesiredValue: Int { get }
    var isGameOver: Bool { get }
    var limit: Int { get }
    
    func resdartGame()
    func startNewRound()
    func calculateScore(with value: Int)
    
}

final class Game: GameProtocol {
    
    var score = 0
    var currentDesiredValue = 0
    var round = 0
    
    var minDesiredValue: Int
    var maxDesiredValue: Int
    let roundCount: Int
    let limit: Int
    
    var isGameOver: Bool {
        
        round >= roundCount ? true : false
        
    }
    
    init?(minValue: Int, maxValue: Int, rounds: Int, bound: Int) {
        
        guard minValue < maxValue else { return nil }
        
        minDesiredValue = minValue
        maxDesiredValue = maxValue
        roundCount = rounds
        limit = bound
        currentDesiredValue = getNewDesiredValue()
        
    }
    
    func resdartGame() {
        
        round = 0
        score = 0
        
    }
    
    func startNewRound() {
        
        currentDesiredValue = getNewDesiredValue()
        round += 1
        
    }
    
    func getNewDesiredValue() -> Int {
        
        Int.random(in: minDesiredValue...maxDesiredValue)
        
    }
    
    func calculateScore(with value: Int) {
        
        if value != currentDesiredValue {
            score += abs(value - currentDesiredValue)
        } else {
            score += 0
        }
        
    }
    
}
