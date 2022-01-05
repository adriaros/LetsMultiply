//
//  LevelView.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 2/1/22.
//

import SwiftUI

struct LevelViewLevel {
    var type: Level = .none
}

struct LevelView: View {
    
    @State private var settings: GameSettingsProtocol = GameSettings()
    @State private var level = LevelViewLevel()
    @State private var disabled = true
    
    var body: some View {
            
            VStack {
                
                Text("Choose the difficult")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.red)
                    .padding()
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button("Easy") {
                        self.settings.level = .easy
                        self.level.type = .easy
                        self.disabled = false
                    }
                    .padding()
                    .background(level.type == .easy ? .green.opacity(0.25) : .gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(4)

                    Spacer()
                    
                    Button("Medium") {
                        self.settings.level = .medium
                        self.level.type = .medium
                        self.disabled = false
                    }
                    .padding()
                    .background(level.type == .medium ? .green.opacity(0.25) : .gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(4)
                    
                    Spacer()
                    
                    Button("Hard") {
                        self.settings.level = .hard
                        self.level.type = .hard
                        self.disabled = false
                    }
                    .padding()
                    .background(level.type == .hard ? .green.opacity(0.25) : .gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(4)
                    
                    Spacer()
                }
                
                Spacer()
                
                NavigationLink(
                    destination: GameView(settings: settings),
                     label: {
                         Text("START")
                     })
                    .padding()
                    .background(disabled ? .gray.opacity(0.2) : .blue.opacity(0.25))
                    .foregroundColor(.black)
                    .cornerRadius(4)
                    .disabled(disabled)
                
                Spacer()
            }
        
            .onAppear {
                settings = GameSettings()
                level = LevelViewLevel()
            }
    }
}

struct LevelView_Previews: PreviewProvider {

    static var previews: some View {
        LevelView()
    }
}
