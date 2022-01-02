//
//  WelcomeView.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 1/1/22.
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Spacer()
                
                Text("Welcome to\nLet's Multiply!")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.red)
                
                Spacer()
                
                NavigationLink(
                     destination: LevelView(),
                     label: {
                         Text("START")
                     })
                 
                Spacer()
            }
        }
    }
}
