//
//  GameView.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 2/1/22.
//

import SwiftUI

struct GameView: View {
    
    var body: some View {
        Text("Game View")
        
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Exit") {
                    
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
   
    static var previews: some View {
        GameView()
    }
}
