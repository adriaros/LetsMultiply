//
//  GameView.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 2/1/22.
//

import SwiftUI

struct GameView: View {
    
    var settings: GameSettingsProtocol
    
    var body: some View {
        Text("Game View level: \(settings.numberOfQuestions)")
            .font(.title)
    }
}

struct GameView_Previews: PreviewProvider {
   
    static var previews: some View {
        GameView(settings: GameSettings(level: .easy))
    }
}
