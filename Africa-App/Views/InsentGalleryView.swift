//
//  InsentGalleryView.swift
//  Africa-App
//
//  Created by Victor Lee on 8/7/21.
//

import SwiftUI

struct InsentGalleryView: View {
    
    let animalsModel: AnimalsModel
    var body: some View {
        ScrollView(.horizontal) {
            
            HStack(alignment: .center, spacing: 15) {
                ForEach(animalsModel.gallery, id: \.self) {
                    Image($0)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }

    }
}

struct InsentGalleryView_Previews: PreviewProvider {
    static let animals: [AnimalsModel] = Bundle.main.decode(LocalazibleStrings.animalsJson)
    static var previews: some View {
        InsentGalleryView(animalsModel: animals[4])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
