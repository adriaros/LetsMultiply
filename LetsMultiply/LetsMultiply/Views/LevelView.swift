//
//  LevelView.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 2/1/22.
//

import SwiftUI

struct LevelView: View {
    
    @State private var settings: GameSettingsProtocol = GameSettings()
    
    var body: some View {
            
            VStack {
                
                Text("Choose the difficult")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.red)
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button("Easy") {
                        self.settings.level = .easy
                    }
                    
                    Spacer()
                    
                    Button("Medium") {
                        self.settings.level = .medium
                    }
                    
                    Spacer()
                    
                    Button("Hard") {
                        self.settings.level = .hard
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
                NavigationLink(
                    destination: GameView(settings: settings),
                     label: {
                         Text("START")
                     })
                
                Spacer()
            }
    }
}

struct LevelView_Previews: PreviewProvider {

    static var previews: some View {
        LevelView()
    }
}
