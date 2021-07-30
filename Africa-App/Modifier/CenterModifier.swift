//
//  CenterModifier.swift
//  Africa-App
//
//  Created by Victor Lee on 30/7/21.
//


import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
    
}
