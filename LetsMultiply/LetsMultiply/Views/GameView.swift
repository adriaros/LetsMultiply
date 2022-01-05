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
        "CONGRATULATIONS!!\n\nYou've finished the challenge"
    }

    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.4), .green.opacity(0.3), .yellow.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
            
            if !settings.isGameOver {
                gameView
            } else {
                markView
            }
        }
    }
    
    var gameView: some View {
        VStack {
            
            Text(currentQuestionText)
                .font(.title)
            
            Spacer()
            
            HStack {
                
                Text("\(settings.currentQuestion.multiplier) x \(settings.currentQuestion.multiplicand)")
                    .padding(.horizontal, 60)
                
                TextField("Result", text: $result)
                                        .keyboardType(.decimalPad)
                                        .fixedSize(horizontal: true, vertical: false)
                                        .padding()
                                        .border(.black, width: 1.0)
                                        .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Button("Submit") {
                onSubmit()
            }
            .selected(true)
            
            Spacer()
        }
    }
    
    var markView: some View {
        VStack {
            
            Text(finishedTitleText)
                .font(.title)
                .multilineTextAlignment(.center)
            
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
