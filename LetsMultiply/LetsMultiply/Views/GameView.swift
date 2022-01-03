//
//  GameView.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 2/1/22.
//

import SwiftUI

struct GameView: View {
    
    var settings: GameSettingsProtocol
    @State private var result: String = ""
    
    private var currentQuestionText: String {
        "Question: \(settings.currentQuestionNumber + 1) / \(settings.numberOfQuestions)"
    }
    
    private var finishedTitleText: String {
        "You've finished the challenge"
    }

    var body: some View {
        if !settings.isGameOver {
            gameView
        } else {
            markView
        }
    }
    
    var gameView: some View {
        VStack {
            
            Text(currentQuestionText)
                .font(.title)
            
            Spacer()
            
            Text("\(settings.currentQuestion.multiplier) x \(settings.currentQuestion.multiplicand)")
                        
            TextField("Write here the result", text: $result)
                                    .keyboardType(.decimalPad)
                                    .padding(.horizontal, 100)
            
            Spacer()
            
            Button("Submit") {
                onSubmit()
            }
            
            Spacer()
        }
    }
    
    var markView: some View {
        VStack {
            
            Text(finishedTitleText)
                .font(.title)
            
            Spacer()
            
            Text("Your mark is \(settings.mark)")
                .font(.title)
            
            Spacer()
        }
    }
    
    private func onSubmit() {
        settings.update(progress: Int(result) == settings.currentQuestion.result)
        settings.updateQuestion()
        result = ""
    }
}

struct GameView_Previews: PreviewProvider {
   
    static var previews: some View {
        GameView(settings: GameSettings())
    }
}
