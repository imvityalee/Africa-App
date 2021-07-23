//
//  AnimalGridItemView.swift
//  Africa-App
//
//  Created by Victor Lee on 23/7/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    
     let animal: AnimalsModel
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [AnimalsModel] =
        Bundle.main.decode(LocalazibleStrings.animalsJson)
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
