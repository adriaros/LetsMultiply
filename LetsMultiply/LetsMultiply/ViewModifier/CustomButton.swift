//
//  CustomButton.swift
//  LetsMultiply
//
//  Created by Adrià Ros on 5/1/22.
//

import SwiftUI

struct CustomButton: ViewModifier {
    
    var selected: Bool
   
    func body(content: Content) -> some View {
        content
            .padding()
            .background(selected ? .green.opacity(0.25) : .gray.opacity(0.2))
            .foregroundColor(.black)
            .cornerRadius(4)
    }
}

extension View {
    
    func selected(_ selected: Bool) -> some View {
        self.modifier(CustomButton(selected: selected))
    }
}
