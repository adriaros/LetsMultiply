//
//  LevelView.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 2/1/22.
//

import SwiftUI

struct LevelView: View {
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("Choose the difficult")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .foregroundColor(.red)
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Button("Easy") {
                        
                    }
                    
                    Spacer()
                    
                    Button("Medium") {
                        
                    }
                    
                    Spacer()
                    
                    Button("Hard") {
                        
                    }
                    
                    Spacer()
                }
                
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

struct ContentView_Previews: PreviewProvider {
   
    static var previews: some View {
        LevelView()
    }
}
