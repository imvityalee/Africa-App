//
//  CoverImageView.swift
//  Africa-App
//
//  Created by Victor Lee on 6/7/21.
//

import SwiftUI

struct CoverImageView: View {
    
    let coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
    
    var body: some View {
        TabView {
            ForEach(coverImages) {
                Image($0.name)
                .resizable()
                .scaledToFit    ()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
