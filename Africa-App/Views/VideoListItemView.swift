//
//  VideListItem.swift
//  Africa-App
//
//  Created by Victor Lee on 12/7/21.
//

import SwiftUI

struct VideoListItemView: View {
    let videoModel: AnimalVideoModel
    
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(videoModel.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                Image(systemName: LocalazibleImages.play_circle)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(videoModel.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(videoModel.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideListItem_Previews: PreviewProvider {
    static var videosModel: [AnimalVideoModel] = Bundle.main.decode(LocalazibleStrings.animalVideoJson)
        
    static var previews: some View {
        VideoListItemView(videoModel: videosModel[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
