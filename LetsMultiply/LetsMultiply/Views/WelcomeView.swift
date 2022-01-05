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
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.4), .green.opacity(0.3), .yellow.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    Spacer()
                    
                    Text("Welcome to\nLet's Multiply!")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    NavigationLink(
                         destination: LevelView(),
                         label: {
                             Text("START")
                         })
                        .selected(true)
                     
                    Spacer()
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {

    static var previews: some View {
        WelcomeView()
    }
}
