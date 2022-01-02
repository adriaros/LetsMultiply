//
//  GameSettings.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 2/1/22.
//

import Foundation

enum Level: Equatable {
    case easy
    case medium
    case hard
}

struct Question {
    
    let multiplicand: Int
    let multiplier: Int
    
    var result: Int {
        multiplicand * multiplier
    }
}

protocol GameSettingsProtocol {
    var numberOfQuestions: Int { get }
    var questions: [Question] { get }
    var isGameOver: Bool { get }
    var currentQuestion: Int { get set }
    var level: Level { get set }
}

struct GameSettings: GameSettingsProtocol {
        
    var numberOfQuestions: Int = 0
    
    var questions: [Question] = []
    
    var isGameOver = false

    var currentQuestion = 0 {
        didSet {
            isGameOver = (currentQuestion == numberOfQuestions - 1)
        }
    }
    
    var level: Level = .easy {
        didSet {
            switch level {
            case .easy:
                numberOfQuestions = 5
                questions = createQuestions(numberOfQuestions)
            case .medium:
                numberOfQuestions = 10
                questions = createQuestions(numberOfQuestions)
            case .hard:
                numberOfQuestions = 20
                questions = createQuestions(numberOfQuestions)
            }
        }
    }
    
    private func createQuestions(_ number: Int) -> [Question] {
        var arrayOfQuestions: [Question] = []
        for _ in 0..<number { arrayOfQuestions.append(Question(multiplicand: Int.random(in: 1..<10), multiplier: Int.random(in: 1..<11))) }
        return arrayOfQuestions
    }
}
