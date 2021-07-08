//
//  InsentFactView.swift
//  Africa-App
//
//  Created by Victor Lee on 8/7/21.
//

import SwiftUI

struct InsentFactView: View {
    let animalsModel: AnimalsModel
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animalsModel.fact,
                        id: \.self) {
                    Text($0)
                }
                
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148,
                   idealHeight: 168,
                   maxHeight: 180)
        }
    }
}

struct InsentFactView_Previews: PreviewProvider {
    static var animals: [AnimalsModel] = Bundle.main.decode(LocalazibleStrings.animalsJson)
    static var previews: some View {
        InsentFactView(animalsModel: animals[6])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
