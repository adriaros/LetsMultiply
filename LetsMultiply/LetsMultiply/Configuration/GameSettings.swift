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
    case none
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
    var currentQuestionNumber: Int { get }
    var currentQuestion: Question { get }
    var level: Level! { get set }
    var mark: String! { get }
    func updateQuestion()
    func update(progress correct: Bool)
}

class GameSettings: GameSettingsProtocol {
        
    var numberOfQuestions: Int = 0
    
    var questions: [Question] = []
    
    var isGameOver = false

    var currentQuestionNumber = 0 {
        didSet {
            isGameOver = (currentQuestionNumber == numberOfQuestions)
        }
    }
    
    func updateQuestion() {
        currentQuestionNumber += 1
    }
    
    var currentQuestion: Question {
        questions.count > 0 ? questions[currentQuestionNumber] : Question(multiplicand: 1, multiplier: 1)
    }
    
    var level: Level! {
        didSet {
            switch level {
            case .medium:
                numberOfQuestions = 10
                questions = createQuestions(numberOfQuestions)
            case .hard:
                numberOfQuestions = 20
                questions = createQuestions(numberOfQuestions)
            default:
                numberOfQuestions = 5
                questions = createQuestions(numberOfQuestions)
            }
        }
    }
    
    private func createQuestions(_ number: Int) -> [Question] {
        var arrayOfQuestions: [Question] = []
        for _ in 0..<number { arrayOfQuestions.append(Question(multiplicand: Int.random(in: 1..<10), multiplier: Int.random(in: 1..<11))) }
        return arrayOfQuestions
    }
    
    private var progress: [Bool] = []

    func update(progress correct: Bool) {
        progress.append(correct)
    }
    
    var mark: String! {
        guard progress.count > 0 else { return "" }
        let numberOfcorrects = progress.filter { $0 }.count
        return "\(numberOfcorrects) / \(progress.count)"
    }
}
