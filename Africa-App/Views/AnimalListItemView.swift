//
//  AnimalListItemView.swift
//  Africa-App
//
//  Created by Victor Lee on 7/7/21.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animalModel: AnimalsModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image(animalModel.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90, alignment: .center)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            VStack(alignment: .leading, spacing: 8) {
                Text(animalModel.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(animalModel.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static let animals: [AnimalsModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalListItemView(animalModel: animals[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
